/*
美团购物车(七. ArkTS-核心-基础   拉到底)
https://www.yuque.com/megasu/hm_base_v1.1/td91d1sawk1ti96g#uYTWS
 */
@Entry
@Component
struct TestPageMeituanShopCart {
  // 布局构建：排版 -> 内容 -> 美化 -> 交互
  // 购买数量
  @State count: number = 1
  // 原价
  @State oldPrice: number = 40.4
  // 现价
  @State nowPrice: number = 21.2

  build() {
    Column() {
      // 商品信息：排版 -> 内容 -> 美化
      Row({ space: 10 }) {
        // 图
        Image($r('app.media.product1'))
          .width(100)
          .borderRadius(5)
        // 列
        Column({ space: 10 }) {
          Text('冲销量量10ml纷果捞冲销量量10ml纷果捞')
            .fontSize(14)
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
          Text('含1份折扣商品')
            .fontSize(12)
            .fontColor('#7f7f7f')
          Row({ space: 5 }) {
            // 基线对齐的文字
            Text() {
              Span('¥ ')
                .fontSize(14)
              Span(this.nowPrice.toFixed(2))
            }
            .fontColor('#ff4000')
            .fontSize(18)

            Text('¥' + this.oldPrice.toFixed(2))
              .fontColor('#7f7f7f')
              .fontSize(12)
              .decoration({
                type: TextDecorationType.LineThrough,
                color: '#7f7f7f'
              })
              .layoutWeight(1)
              .alignSelf(ItemAlign.Baseline) // 基线对齐
            // 计数器
            Row() {
              Text('-')
                .width(24)
                .height(24)
                .textAlign(TextAlign.Center)
                .border({
                  width: 1,
                  color: '#ccc'
                })
                .borderRadius({
                  topLeft: 5,
                  bottomLeft: 5
                })
                .enabled(this.count > 1)
                .onClick(() => {
                  // TODO: 减少
                  this.count--
                })
              Text(this.count.toString())
                .padding({ left: 10, right: 10 })
                .height(24)
                .textAlign(TextAlign.Center)
                .fontSize(14)
                .border({
                  width: {
                    top: 1,
                    bottom: 1
                  },
                  color: '#ccc'
                })
              Text('+')
                .width(24)
                .height(24)
                .textAlign(TextAlign.Center)
                .border({
                  width: 1,
                  color: '#ccc'
                })
                .borderRadius({
                  topRight: 5,
                  bottomRight: 5
                })
                .enabled(this.count < 10)
                .onClick(() => {
                  // TODO: 增加
                  this.count++
                })
            }
          }
        }
        .layoutWeight(1)
        .alignItems(HorizontalAlign.Start) // 交叉轴：水平靠左对齐
      }
      .alignItems(VerticalAlign.Top) // 交叉轴：垂直靠顶部对齐
      .width('100%')
      .padding(10)
      .shadow(ShadowStyle.OUTER_DEFAULT_MD)
      .backgroundColor(Color.White)

      // 结算信息：排版 -> 内容 -> 美化
      Row({ space: 10 }) {
        Column({ space: 5 }) {
          Text() {
            Span(`已选${this.count}件, `)
              .fontColor('#848484')
            Span('合计: ')
            Span('¥' + (this.nowPrice * this.count).toFixed(2))
              .fontColor('#fd4104')
          }
          .fontSize(14)

          Text(
            '共减 ¥' +
            ((this.oldPrice - this.nowPrice) * this.count).toFixed(2)
          )
            .fontSize(12)
            .fontColor('#fd4104')
        }
        .alignItems(HorizontalAlign.End) // 交叉轴-水平靠右对齐

        Text('结算外卖')
          .width(100)
          .height(40)
          .backgroundColor('#F8D84B')
          .borderRadius(20)
          .textAlign(TextAlign.Center)
          .fontWeight(600)
          .fontSize(14)
      }
      .width('100%')
      .justifyContent(FlexAlign.End) // Row 主轴末尾(右)对齐
      .padding({ right: 30, top: 15, bottom: 15 })
      .backgroundColor(Color.White)
      .position({ bottom: 0 }) // 绝对定位：基于父组件
    }
    .width('100%')
    .height('100%') // 父组件设置高度 100%，让子元素靠底部对齐
    .backgroundColor('#F3F3F3')
  }
}