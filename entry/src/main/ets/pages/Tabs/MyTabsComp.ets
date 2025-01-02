import { deviceInfo } from "@kit.BasicServicesKit"
import { hidebug } from "@kit.PerformanceAnalysisKit"
import { statfs } from "@kit.CoreFileKit"

@Component
export struct MyTabsComp {
  // @Provide 装饰器和 @Consume 装饰器：与后代组件双向同步
  @Consume @Watch('onTabsChange') currentIndex: number
  @Consume @Watch('onTabsChange') isPageShow: boolean
  ////////////////////////////////////////////////////
  @State deviceName: string = '' // 设备名称
  @State cpuUsage: number = 0 // cpu占用
  @State memorySize: number = 0 // 内存占用
  @State batteryState: number = 0 // 电池电量百分比
  @State statfsFreeSize: number = 0 // 剩余存储

  //页面加载时
  aboutToAppear(): void {
    this.getDeviceInfo()
    this.getDebugInfo()
    this.getStatfsInfo()
  }

  // 当 Tabs 发生变化 && 页面显示 时（监听父组件的 currentIndex 和 isPageShow）
  onTabsChange() {
    if (this.currentIndex === 2 && this.isPageShow === true) {
      this.getDebugInfo()
      this.getStatfsInfo()
    }
  }

  getDeviceInfo() {
    this.deviceName = deviceInfo.marketName
  }

  getDebugInfo() {
    // 获取进程的CPU使用率。 如占用率为50%，则返回0.5。
    this.cpuUsage = hidebug.getCpuUsage() * 100
    // 获取应用进程实际使用的物理内存大小，单位为kB
    // 1MB = 1024KB （Windows 系统，普遍混淆）
    // 1MB = 1000KB （MAC 系统，手机系统，Linux 系统，U 盘、DVD 光盘、、、）
    this.memorySize = Number(hidebug.getPss()) / 1000
  }

  // https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V13/js-apis-file-statvfs-V13
  getStatfsInfo() {
    const context = getContext()
    // 温馨提示：statfs 其实是 '@ohos.file.statvfs'，经历了两次改名 statfs -> statvfs -> statfs
    // 关于千字节百科解释：https://baike.baidu.com/item/KB/331
    //  1000MB  =  1GB
    //  1000KB  =  1MB
    //  1000B  =  1KB
    // 获取指定文件系统空闲字节数 Byte
    this.statfsFreeSize = statfs.getFreeSizeSync(context.filesDir) / (1000 * 1000 * 1000)
  }

  build() {
    Scroll() {
      Column() {
        Text("设备名称: " + this.deviceName).fontSize(18).fontWeight(500)

        // GridRow 布局 可以看作是 Grid 布局
        GridRow({ columns: 3, gutter: 10 }) {
          GridCol() {
            this.UsageColumn({
              icon: $r('app.media.ic_my_cpu'),
              name: 'CPU占用',
              value: this.cpuUsage.toFixed(0),
              unit: '%'
            })
          }

          GridCol() {
            this.UsageColumn({
              icon: $r('app.media.ic_my_ram'),
              name: '内存占用',
              value: this.memorySize.toFixed(0),
              unit: 'M'
            })
          }

          GridCol() {
            this.UsageColumn({
              icon: $r('app.media.ic_my_storage'),
              name: '剩余存储',
              value: this.statfsFreeSize.toFixed(1),
              unit: 'GB'
            })
          }
        }
      }
      .padding({ left: 20, right: 20 })
    }
  }

  //简单的自定义视图
  @Builder
  UsageColumn(item: UsageItem) {
    Column({ space: 10 }) {
      Image(item.icon).height(28).aspectRatio(1)
      Text(item.name).fontSize(14).fontColor($r('app.color.font2'))
      Text() {
        Span(item.value)
          .fontSize(26)
          .fontWeight(500)
        Span(' ')
        Span(item.unit)
      }.fontSize(14)
      .fontColor($r('app.color.font'))
    }
    .alignItems(HorizontalAlign.Start)
    .width('100%')
    .height(120)
    .borderRadius(5)
    .padding(10)
    .backgroundColor($r('app.color.background'))
  }
}

// Bean
interface UsageItem {
  icon: Resource
  name: string
  value: string
  unit: string
}
