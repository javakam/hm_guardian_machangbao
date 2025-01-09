@Component
export struct GuardTabsComp {
  @State message: string = '守护中心';

  build() {
    RelativeContainer() {
      Text(this.message)
        .id('middleTitle')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
    }
    .height('100%')
    .width('100%')
  }
}