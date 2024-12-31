import { deviceInfo } from "@kit.BasicServicesKit"

@Component
export struct MyTabsComp {
  @State deviceName: string = ''
  @State memorySize: number = 0
  @State cpuUsage: number = 0

  aboutToAppear(): void {
    this.loadDeviceInfo()
    this.loadDebugInfo()
  }

  loadDeviceInfo(){
    this.deviceName = deviceInfo.marketName
  }

  loadDebugInfo() {
    //todo 2024-12-31 16:46:47
  }

  build() {
    Scroll() {
      Column() {
        Text("设备名称: " + this.deviceName).fontSize(18).fontWeight(500)

        GridRow({ columns: 3, gutter: 10 }) {
          GridCol() {
            Text("").fontSize(14)
          }
        }.padding({ left: 20, right: 20 })
      }
    }
  }
}