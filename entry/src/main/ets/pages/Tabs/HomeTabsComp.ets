@Component
export struct HomeTabsComp {
  @State message: string = '首页';

  build() {
    RelativeContainer() {
      Text(this.message)
        .id('homeTitle')
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