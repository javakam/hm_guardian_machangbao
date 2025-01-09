
/**
 * @author machangbao
 * @description ArkTs语言介绍
 */
@Entry
@Component
struct TestPage {
  @State message: string = 'ArkTs';

  build() {
    Scroll() {
      Column() {
        Button("ArkTs语言介绍").onClick(() => {
          //ArkTs语言介绍
          //https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V13/introduction-to-arkts-V13#%E5%9F%BA%E6%9C%AC%E7%9F%A5%E8%AF%86

          //1 变量声明  以关键字let开头的声明引入变量，该变量在程序执行期间可以具有不同的值。
          let hi: string = 'hello';
          hi = 'hello, world';

          //2 常量声明  以关键字const开头的声明引入只读常量，该常量只能被赋值一次。
          const hello: string = 'hello';

          //3 自动类型推断   由于ArkTS是一种静态类型语言，所有数据的类型都必须在编译时确定。
          let hi1: string = 'hello';
          let hi2 = 'hello, world';

          /*
          ArkTs 三种常见的基础数据类型：
          ① string 字符串：描述信息
          ② number 数字：计算
          ③ boolean 布尔：判断 （真、假）
           */

          //4 number类型   ArkTS提供number类型，任何整数和浮点数都可以被赋给此类型的变量。
          let n1 = 3.14;
          let n2 = 3.141592;
          let n3 = .5;
          let n4 = 1e2;
          console.log("arkts", n1); //  3.14
          console.log("arkts", n2); //  3.141592
          console.log("arkts", n3); //  0.5
          console.log("arkts", n4); //  100

          //5 number 类型在表示非常大的整数时可能会丢失精度。在开发时可以按需使 用 BigInt 类型来确保精度：
          let bigInteger: BigInt = BigInt('999999999999999999999999999999999999999999999999999999999999');
          //或 let bigInteger: BigInt = 999999999999999999999999999999999999999999999999999999999999n;
          console.log('bigInteger BigInt: ' + bigInteger);
          let bigInteger2: number = 999999999999999999999999999999999999999999999999999999999999;
          console.log('bigInteger number: ' + bigInteger2); //1e+60 = 1 * 10的60次方

          //比较
          let safeMaxInt: number = Number.MAX_SAFE_INTEGER; // 最大安全整数 9007199254740991 + 1
          console.log(`最大安全整数: ${safeMaxInt}`); // The value of Number.MAX_SAFE_INTEGER is 9007199254740991 2^53 − 1.
          let unsafeInt: bigint = 9007199254740992n + 1n; // 超过最大安全整数
          console.log(`使用 BigInt 的不安全整数: ${unsafeInt}`);
          let bigNumber1: number = 9007199254740991
          let bigNumber2: number = 9007199254740992
          let bigNumber3: number = 9007199254740992 + 1
          let bigNumber4: number = 9007199254740992 + 3
          console.log("使用 number 丢失精度：" + bigNumber1 + " ; " + bigNumber2 + " ; "
            + bigNumber3 + " ; " + bigNumber4)
          /*
          运行结果：
            最大安全整数: 9007199254740991
            使用 BigInt 的不安全整数: 9007199254740993
            使用 number 丢失精度：9007199254740991 ; 9007199254740992 ; 9007199254740992 ; 9007199254740996
          分析：如果精度没有丢失，unsafeInt 和 bigNumber3 值应该是一样的。
           */

          // ①使用 Number 构造函数创建一个数字对象
          // 注意：这里我们调用了 valueOf 方法来获取原始值 [ty-reference]
          let numObject = new Number(10);
          console.log(`Number.valueOf: ${numObject.valueOf()}`);

          // ②将字符串转换为数字
          let strNum = "123.456";
          let convertedNum = Number(strNum);
          console.log(`字符串转换为数字: ${convertedNum} ; toFixed(2)=${convertedNum.toFixed(2)}`); // 保留两位小数
          // ③使用 parseInt 和 parseFloat 进行更具体的转换
          let intPart = parseInt(strNum);
          let floatPart = parseFloat(strNum);
          console.log(`parseInt: ${intPart}, parseFloat: ${floatPart}`);

          //6 string  可使用模板字面量
          let a = 'Success';
          let s3 = `The result is ${a}`;
          //模板变量 ``  ""  ''

          //7 boolean
          let isDone: boolean = false;
          // ...
          if (isDone) {
            console.log('Done!');
          }

          //8 数组
          let names: string[] = ['Alice', 'Bob', 'Carol'];
          //注意：数组指定的类型和存储的数据类型要必须一致，否则会报错

          //9 enum 枚举
          enum ColorSet { Red, Green, Blue }

          let c: ColorSet = ColorSet.Red;
          //常量表达式可以用于显式设置枚举常量的值。
          enum ColorSet2 { White = 0xFF, Grey = 0x7F, Black = 0x00 }

          let c2: ColorSet2 = ColorSet2.Black;
          //常用写法
          enum ThemeColor {
            Red = '#ff0f29',
            Orange = '#ff7100',
            Green = '#30b30e',
          }

          //10 联合类型（Union类型）  由多个类型组合成的引用类型。联合类型包含了变量可能的所有类型。
          class Cat {
            name: string = 'cat';
            // ...
          }

          class Dog {
            name: string = 'dog';
            // ...
          }

          class Frog {
            name: string = 'frog';
            // ...
          }

          type Animal = Cat | Dog | Frog | number;
          // Cat、Dog、Frog是一些类型（类或接口）

          let animal: Animal = new Cat();
          animal = new Frog();
          animal = 42;
          // 可以将类型为联合类型的变量赋值为任何组成类型的有效值

          // 可以用不同的机制获取联合类型中特定类型的值。 instanceof
          /*
          class Cat { sleep () {}; meow () {} }
          class Dog { sleep () {}; bark () {} }
          class Frog { sleep () {}; leap () {} }
          type Animal = Cat | Dog | Frog;

          function foo(animal: Animal) {
            if (animal instanceof Frog) {
              animal.leap();  // animal在这里是Frog类型
            }
            animal.sleep(); // Animal具有sleep方法
          }
          */
          // 更常用的写法
          let judge: number | string = 100
          judge = 'A+'
          judge = '优秀'
          console.log('考试成绩', judge)
          // 联合类型还可以可以将变量值约定在一组数据范围内进行选择
          let gender: 'man' | 'woman' | 'secret' = 'secret'
          gender = 'man'
          //gender = 'man2'

          //11 if语句
          /*
          if (condition1) {
            // 语句1
          } else if (condition2) {
            // 语句2
          } else {
            // else语句
          }
          */

          //12 switch
          /*
          switch (expression) {
            case label1: // 如果label1匹配，则执行
              // ...
              break; // 可省略
            case label2:
            case label3: // 如果label2或label3匹配，则执行
              // ...
              break; // 可省略
            default:
          // 默认语句
          }
          */

          //13 参数 传参需定义类型
          /*function sum(a: number, b: number) {
            let res: number = a + b
            console.log('加法结果是', res)
          }
          sum(10, 20)

          //带返回值直接 return
          function sum(a: number, b: number) {
            let res: number = a + b
            return res
          }
          let num: number = sum(5, 5)
          console.log('num', num)*/

          //14 箭头函数   ()=>{}
          let buy = (price: number, weight: number = 1) => {
            let result: number = price * weight
            return result
          }
          let apple: number = buy(2)
          console.log('苹果', apple)

          //15 对象
          // ①定义接口
          interface Person {
            name: string
            age: number
            weight: number
            dance: () => void
            sing: (song: string) => void
          }

          // ②基于接口，定义对象
          let person: Person = {
            name: 'aaa',
            age: 18,
            weight: 90,
            dance: (): void => {
              console.log('aaa', "dancing...")
            },
            sing: (song: string): void => {
              //Function implementation
            }
          }
          console.log('名字', person.name)
          console.log('年龄', person.age)
          person.dance()
        }).margin({ top: 20 })

        /*
        HarmonyOS Next 知识地图
        https://developer.huawei.com/consumer/cn/app/knowledge-map/
        ① 了解HarmonyOS     ->   鸿蒙开发快速入门
        ② 一次开发，多端部署  ->  "一多垂域案例"
        ③ 业务场景与解决方案  -> 新闻阅读类 , 项目代码 FluentNewsHomepage :
           https://gitee.com/harmonyos_samples/fluent-news-homepage
           最后过一遍该项目

        HarmonyOS Next 应用开发导读 -> HarmonyOS | 5.0.0(13)
        https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V13/application-dev-guide-V13?catalogVersion=V13
         */

        //基础组件
        //https://www.yuque.com/megasu/hm_base_v1.1/bqx56scr5fx9lkm1

        //================================ Text ================================//
        Text("基础组件 Text") {
          Span('Span不能脱离Text单独使用；Span文本会覆盖Text内容和样式')//.fontColor(Color.Blue).fontSize(12)
            .textCase(TextCase.UpperCase)//大小写控制
            .decoration({ type: TextDecorationType.LineThrough, color: Color.Red })
            .onClick(() => {
              console.log('Span——onClick')
            })
        }
        .fontSize(18)
        .fontColor(Color.Orange)
        .fontStyle(FontStyle.Italic)
        .padding(10)
        .margin(10)
        .width('90%') //组件宽高，取值数字或百分比
        //BorderStyle  Solid：实线（默认）  Dashed：虚线  Dotted：点线
        //.border({ width: .5, color: "#f1a" })

        // 红色 虚线 边框
        //.border({width: 1, color: 'red', style: BorderStyle.Dotted})

        //四个方向边框不同
        .border({
          width: {
            left: 1,
            top: 3,
            right: 5,
            bottom: 7
          },
          color: {
            left: 'blue',
            top: '#f10',
            right: '#f60',
            bottom: '#ccc'
          },
          style: { top: BorderStyle.Dashed, right: BorderStyle.Dotted }
        })

        //多个Span
        Text() {
          Span('我是Span1，').fontSize(16).fontColor(Color.Grey)
            .decoration({ type: TextDecorationType.LineThrough, color: Color.Red })
          Span('我是Span2').fontColor(Color.Blue).fontSize(16)
            .fontStyle(FontStyle.Italic)
            .decoration({ type: TextDecorationType.Underline, color: Color.Black })
          Span('，我是Span3').fontSize(16).fontColor(Color.Grey)
            .decoration({ type: TextDecorationType.Overline, color: Color.Green })
        }
        .borderWidth(1)
        .padding(10)

        this.dividerLine()

        //折行处理
        //通过textOverflow属性控制文本超长处理，textOverflow需配合maxLines一起使用（默认情况下文本自动折行）。
        Text('This is the setting of textOverflow to Clip text content This is the setting of textOverflow to None text content. This is the setting of textOverflow to Clip text content This is the setting of textOverflow to None text content.')
          .width(250)
          .textOverflow({ overflow: TextOverflow.None })
          .maxLines(1)
          .fontSize(12)
          .border({ width: 1 })
          .padding(10)
        Text('我是超长文本，超出的部分显示省略号。I am an extra long text, with ellipses displayed for any excess。')
          .width(250)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(1)
          .fontSize(12)
          .border({ width: 1 })
          .padding(10)
        Text('当文本溢出其尺寸时，文本将滚动显示。When the text overflows its dimensions, the text will scroll for displaying.')
          .width(250)
          .textOverflow({ overflow: TextOverflow.MARQUEE })//走马灯
          .maxLines(1)
          .fontSize(12)
          .border({ width: 1 })
          .padding(10)
        //最常用
        Text('我是超长文本，超出的部分显示省略号。I am an extra long text, with ellipses displayed for any excess。')
          .width(250)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(2)
          .fontSize(12)
          .border({ width: 1 })
          .padding(10)
          .lineHeight(20)// 通过lineHeight属性设置文本行高。
          .copyOption(CopyOptions.InApp) // 通过copyOption属性设置文本是否可复制粘贴。

        this.dividerLine()

        /*
         通过minFontSize与maxFontSize自适应字体大小。
         minFontSize用于设置文本的最小显示字号，maxFontSize用于设置文本的最大显示字号。这两个属性必须同时设置才能生效，
         并且需要与maxLines属性或布局大小限制配合使用，单独设置任一属性将不会产生效果。
        */
        Text('我的最大字号为30，最小字号为5，宽度为250，maxLines为1')
          .width(250)
          .maxFontSize(30)
          .minFontSize(5)
          .border({ width: 1 })
          .padding(10)
          .margin(5)

          .maxLines(1)
        Text('我的最大字号为30，最小字号为5，宽度为250，maxLines为2')
          .width(250)
          .maxFontSize(30)
          .minFontSize(5)
          .border({ width: 1 })
          .padding(10)
          .margin(5)

          .maxLines(2)

        //
        Text('我的最大字号为30，最小字号为15，宽度为250,高度为40')
          .width(250)
          .maxFontSize(30)
          .minFontSize(15)
          .border({ width: 1 })
          .padding(10)
          .margin(5)

          .height(40)
        Text('我的最大字号为30，最小字号为15，宽度为250,高度为100')
          .width(250)
          .maxFontSize(30)
          .minFontSize(15)
          .border({ width: 1 })
          .padding(10)
          .margin(5)

          .height(100)
        //要注意最小字号在最低高度下显示是否正确。
        //推荐使用 textOverflow + maxLines 方式进行适配。

        this.dividerLine()

        // 文本对齐
        // 水平对齐 TextAlign（Start Center End）：.textAlign(TextAlign.Center)
        // 垂直对齐 Alignment（Top Center Bottom）：.align(Alignment.Top)
        Text('右上角')
          .width(150)
          .height(80)
          .backgroundColor('#d3f2e3')
          .textAlign(TextAlign.End)
          .align(Alignment.Top)

        //也可以只用 align()
        Text('左下角')
          .width(150)
          .height(80)
          .backgroundColor('#d3f2e3')
          .margin(10)
          .align(Alignment.BottomStart)

        this.dividerLine()

        //官方样例 热搜榜效果
        //https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V13/arkts-common-components-text-display-V13
        Row() {
          Text("1").fontSize(14).fontColor(Color.Red).margin({ left: 10, right: 10 })
          Text("我是热搜词条1")
            .fontSize(12)
            .fontColor(Color.Blue)
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .fontWeight(300)
          Text("爆")
            .margin({ left: 6 })
            .textAlign(TextAlign.Center)
            .fontSize(10)
            .fontColor(Color.White)
            .fontWeight(600)
            .backgroundColor(0x770100)
            .borderRadius(5)
            .width(15)
            .height(14)
        }.width('100%').margin(5)

        Row() {
          Text("2").fontSize(14).fontColor(Color.Red).margin({ left: 10, right: 10 })
          Text("我是热搜词条2 我是热搜词条2 我是热搜词条2 我是热搜词条2 我是热搜词条2")
            .fontSize(12)
            .fontColor(Color.Blue)
            .fontWeight(300)
            .constraintSize({ maxWidth: 200 })
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
          Text("热")
            .margin({ left: 6 })
            .textAlign(TextAlign.Center)
            .fontSize(10)
            .fontColor(Color.White)
            .fontWeight(600)
            .backgroundColor(0xCC5500)
            .borderRadius(5)
            .width(15)
            .height(14)
        }.width('100%').margin(5)

        Row() {
          Text("3").fontSize(14).fontColor(Color.Orange).margin({ left: 10, right: 10 })
          Text("我是热搜词条3")
            .fontSize(12)
            .fontColor(Color.Blue)
            .fontWeight(300)
            .maxLines(1)
            .constraintSize({ maxWidth: 200 })
            .textOverflow({ overflow: TextOverflow.Ellipsis })
          Text("热")
            .margin({ left: 6 })
            .textAlign(TextAlign.Center)
            .fontSize(10)
            .fontColor(Color.White)
            .fontWeight(600)
            .backgroundColor(0xCC5500)
            .borderRadius(5)
            .width(15)
            .height(14)
        }.width('100%').margin(5)

        Row() {
          Text("4").fontSize(14).fontColor(Color.Grey).margin({ left: 10, right: 10 })
          Text("我是热搜词条4 我是热搜词条4 我是热搜词条4 我是热搜词条4 我是热搜词条4")
            .fontSize(12)
            .fontColor(Color.Blue)
            .fontWeight(300)
            .constraintSize({ maxWidth: 200 })
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
        }.width('100%').margin(5)

        //文字特效合集 https://gitee.com/harmonyos_samples/text-effects

        this.dividerLine()

        //实用样例： textOverflow 配合 maxLines 实现文本溢出显示省略号效果，并加入首行缩进
        Text('HarmonyOS 是新一代的智能终端操作系统，为不同设备的智能化、互联与协同提供了统一的语言。带来简洁，流畅，连续，安全可靠的全场景交互体验。')
          .fontSize(14)
          .textIndent(28)//首行缩进
          .maxLines(2)
          .textOverflow({ overflow: TextOverflow.Ellipsis }) // 超长文本使用省略号代替

        this.dividerLine()

        //================================ Image ================================//
        // 本地图片
        Image($r('app.media.ic_my_avatar'))
          .width(100)

        // 网络图片
        Image('https://www.baidu.com/img/flexible/logo/pc/result.png')
          .width(100)// 加载时显示的占位图
          .alt($r('app.media.startIcon'))
        /*
       声明权限
       https://docs.openharmony.cn/pages/v5.0/zh-cn/application-dev/security/AccessToken/declare-permissions.md
       说明： 已在子模块中申请的权限，无需在主项目重复添加，权限将在整个应用生效。

       module.json5 加入网络权限  >>>  "requestPermissions": [{ "name": "ohos.permission.INTERNET"}]
        */

        //
        //ImageKnife https://gitee.com/openharmony-tpc/ImageKnife
        //ohpm 安装
        /*
        OpenHarmony 和 HarmonyOS Next的区别

        OpenHarmony 是由开放原子开源基金会（OpenAtom Foundation）孵化及运营的开源项目，它是一个面向全场景的分布式操作系统。
           OpenHarmony 的目标是为不同类型的智能设备提供一个统一的操作系统平台，支持多种硬件架构，并通过分布式技术实现设备间的无缝协同工作。
           作为一个开源项目，OpenHarmony 吸引了来自全球开发者社区的广泛参与和支持，共同推进其发展。

        HarmonyOS Next 是基于 OpenHarmony 开源项目的一个版本分支，由华为公司主导开发。
           HarmonyOS Next 也有包含了华为针对自身产品和服务优化的独特功能和技术改进。
           这些改进可能包括但不限于增强的安全机制、优化的性能表现以及与华为云服务和其他专有服务的深度集成。
         */

        this.spaceLine();

        // aspectRatio：组件宽高比，宽度/高度
        // 本地图片 正方形图添加 aspectRatio 属性，宽高比例为 1:1
        Image($r('app.media.app_icon'))
          .width(100)
          .aspectRatio(1)

        this.spaceLine();

        Image($r('app.media.app_icon'))
          .width(100)
          .aspectRatio(2)
        /*
        温馨提示：
            在鸿蒙ArkUI布局中，当组件设置宽度为百分比单位时，该百分比是基于父组件的大小设置的宽度。
        如果父组件没有设置宽度，百分比宽度将会基于窗口的宽度进行计算。
        这意味着，即使父组件没有明确设置宽度，组件的百分比宽度依然能够正常计算和显示。
         */
        this.spaceLine();

        //objectFit
        // 图片宽或高缩放到与组件尺寸相同则停止缩放，可能导致组件有空白（等比缩放）
        Image($r('app.media.ic_my_avatar'))
          .width(150)
          .height(100)
          .backgroundColor(Color.Pink)
          .objectFit(ImageFit.Contain)

        // 默认：图片缩放到完全覆盖组件范围，可能导致图片显示不完整（等比缩放）
        Image($r('app.media.ic_my_avatar'))
          .width(150)
          .height(100)
          .backgroundColor(Color.Pink)
          .objectFit(ImageFit.Cover)

        // 图片缩放至充满组件（不等比缩放）
        Image($r('app.media.ic_my_avatar'))
          .width(150)
          .height(100)
          .backgroundColor(Color.Pink)
          .objectFit(ImageFit.Fill)

        this.dividerLine();

        //样例
        Image('http://www.luoqiuzww.cc/novels/63994.jpg')
          .width(120)
        Text('帝师县令')
          .lineHeight(60)
          .fontSize(30)
          .fontColor('#1d1c21')
          .fontWeight(600)
        Text('202万字')
          .lineHeight(24)
          .fontSize(14)
          .fontColor('#999')
        Text('兵荒马乱的世道，赵康一朝穿越成乾国九品县令。胸无大志的他并不想争霸天下，只想当个混吃等死，为非作歹的土皇帝。于是，在元江县出现了许多奇奇怪怪的东西，老八洗浴城、二狗麻将馆、张三养生店.....直到有一天女帝微服私访 元江县.....')
          .lineHeight(30)
          .fontSize(18)
          .textIndent(36)
          .maxLines(4)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .fontColor('#777')

        this.dividerLine();

        //Image SVG
        /*
        HarmonyOS图标库 https://developer.huawei.com/consumer/cn/design/harmonyos-icon/
        阿里巴巴矢量图标库 https://www.iconfont.cn/
         */

        Image($r('app.media.ic_checkbox_select'))
          .width(30)

        // fillColor() 属性修改图标颜色
        Image($r('app.media.ic_checkbox_select'))
          .width(30)
          .fillColor('#f60')


        this.dividerLine();

        //================================ 布局属性 ================================//

        Text('文字')
          .backgroundColor(Color.Pink)//.padding(20)
            // 对象：单独设置某个方向
          .padding({
            top: 0,
            right: 10,
            bottom: 20,
            left: 30
          })
        // .margin({
        //   top: 0,
        //   right: 10,
        //   bottom: 20,
        //   left: 30
        // })
        this.dividerLine();
        //样例 padding margin
        Image($r('app.media.ic_my_avatar'))
          .width(100)
          .margin({ bottom: 10 })

        Text('大王叫我来巡山')
          .fontWeight(700)
          .margin({ bottom: 30 })

        Button('QQ登录')
          .width('80%')
          .backgroundColor('#367bf6')
        Button('微信登录')
          .width('80%')
          .fontColor('#000')
          .backgroundColor('#ddd')
          .margin({ top: 10 })

        this.dividerLine();
        //圆角效果
        Text('圆角1')
          .width(100)
          .height(40)
          .textAlign(TextAlign.Center)
          .margin(5)
          .backgroundColor('#f60')
          .borderRadius(5)

        // 胶囊状 圆角半径 = 高度 / 2
        Text('圆角2')
          .width(100)
          .height(40)
          .textAlign(TextAlign.Center)
          .margin(5)
          .backgroundColor('#fc0')
          .borderRadius(20)

        // 正圆 圆角半径 = 正方形尺寸 / 2
        Image($r('app.media.ic_test_dishi'))
          .width(100)
          .margin(5)
          .aspectRatio(1)
          .borderRadius(50)

        // 四个角半径不同写法
        Text('圆角3')
          .width(100)
          .height(40)
          .textAlign(TextAlign.Center)
          .margin(5)
          .backgroundColor('#fc0')
          .borderRadius({
            topLeft: 5,
            topRight: 10,
            bottomRight: 20,
            bottomLeft: 40
          })

        this.dividerLine();
        //样例 圆角
        Column() {
          Image($r('app.media.ic_test_dishi'))
            .width('100%')
            .height(150)
            .borderRadius({ topLeft: 8, topRight: 8 })
          Text('磁力片。工厂直发磁力王。100片，尺寸7.5cm 可兼容其他品牌')
            .width('100%')
            .padding({ left: 5, right: 5 })
            .fontSize(12)
            .lineHeight(18)
            .maxLines(2)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
          Text('￥ 87')
            .width('100%')
            .padding({ left: 5, right: 5 })
            .fontSize(13)
            .fontColor('#f00')
            .margin({ top: 5 })
        }
        .width('50%')
        .padding({ bottom: 10 })
        .backgroundColor('#fff')
        .borderRadius(8)

        this.dividerLine();

        //backgroundImageSize
        /*
        设置背景图宽高尺寸：{width: 数值, height: 数值}（只设置宽或高，另一个尺寸等比例缩放）
        枚举 ImageSize：
          Cover：等比例缩放背景图至图片完全覆盖组件范围
          Contain：等比例缩放背景图，当宽或高与组件尺寸相同则停止缩放
          Auto：默认，原图尺寸
         */
        Column() {
          Text('漏洞处理流程')
            .fontColor('#fff')
            .fontSize(14)
            .fontWeight(700)
          Text('华为PSIRT按照漏洞处理流程对上报的潜在漏洞进行处理')
            .fontSize(10)
            .fontColor('#fff')
            .margin({ top: 10, bottom: 10 })
          Text('了解更多')
            .fontColor('#fff')
            .fontSize(8)
            .border({ width: 1, color: '#fff' })
            .padding({
              left: 20,
              right: 20,
              top: 5,
              bottom: 5
            })
        }
        .width('100%')
        .height(170)
        .padding({ left: 10, right: 10, top: 20 })
        .backgroundImage($r('app.media.ic_test_huawei'))
        .backgroundColor(Color.Pink)
        //.backgroundImagePosition({x: 100, y: 50})
        // .backgroundImagePosition(Alignment.Center)
        // .backgroundImageSize(ImageSize.Cover)

        //总结：先用 Contain 调到大致效果，最后改用 ImageSize.Cover 补充一些缝隙留白。
        // .backgroundImagePosition(Alignment.Top)
        // .backgroundImageSize(ImageSize.Contain)
        //最后
        .backgroundImagePosition(Alignment.Top)
        .backgroundImageSize(ImageSize.Cover)

        this.dividerLine();

        //线性渐变 linearGradient
        /*
        {
          angle?:  线性渐变的起始角度,
          direction?: 线性渐变的方向,
          colors: [[颜色1, 颜色1所处位置], [颜色2, 颜色2所处位置], ......],
          repeating?: 是否重复着色
        }
        angle：线性渐变的起始角度。0点方向顺时针旋转为正向角度，默认值：180
        direction: 线性渐变的方向，设置 angle 后不生效，值为 枚举类型 GradientDirection
        Left：(从右向) 左 ; Top：(从下向) 上 ; RightBottom：(从左上 到) 右下 ...

        径向渐变 radialGradient

         */
        Text('线性')
          .width(100)
          .height(50)
          .backgroundColor(Color.Pink)
          .linearGradient({
            direction: GradientDirection.Right,
            colors: [['#0ff', 0.1], ['#fc0', 0.8]]
          })

        this.spaceLine()

        //angle：线性渐变的起始角度。0点方向顺时针旋转为正向角度，默认值：180
        Text('线性（angle）')
          .width(100)
          .height(50)
          .backgroundColor(Color.Pink)
          .linearGradient({
            angle: 180,
            colors: [['#0ff', 0.1], ['#fc0', 0.8]]
          })

        this.spaceLine()

        Text('径向')
          .width(100).height(50).backgroundColor(Color.Pink)
          .radialGradient({
            center: [40, 0],
            radius: 40,
            // colors: [['red', 0.1], ['#fc0', '0.8']],
            colors: [
              ['rgba(255, 255, 255, 0.6)', 0],
              ['rgba(255, 255, 255, 0)', 1]
            ]
            // repeating:true
          })

        this.dividerLine();

        //阴影(shadow)
        /*
        {
          radius: 模糊半径,
          type?: 阴影类型,
          color?: 阴影颜色,
          offsetX?: X轴偏移,
          offsetY?: Y轴偏移,
          fill?: 是否内部填充
        }
         */
        Row() {
        }
        .width('80%').height(100).backgroundColor('#ff0')
        .shadow({
          // 模糊半径
          radius: 20,
          // 阴影类型
          type: ShadowType.COLOR,
          // 阴影颜色 - 测试红色
          color: 'rgba(0,0,0,0.5)',
          // X 轴偏移
          offsetX: 0,
          // Y 轴偏移
          offsetY: 0,
          // 是否内部填充，值为布尔型，默认为 false
          fill: false
        })

        this.dividerLine()

        //案例-华为商品卡片
        Column() {
          Image($r('app.media.all_x5')).width(150).margin({ bottom: 20 })
          Text('HUAWEI Mate X5')
            .width('100%')
            .fontSize(14)
            .fontWeight(700)
            .margin({ bottom: 30 })
          Text('￥12999 起').width('100%').fontSize(10).margin({ bottom: 15 })
          Row() {
            Row() {
              Text('了解更多').fontSize(10)
              Image($r('app.media.ic_public_arrow_right')).width(12)
            }
            .margin({ right: 10 })

            Row() {
              Text('购买').fontSize(10)
              Image($r('app.media.ic_public_arrow_right')).width(12)
            }
          }
          .width('100%')
        }
        .width(200)
        .backgroundColor('#fff')
        .padding(15)
        .margin(20)
        .shadow({
          radius: 20,
          color: '#1a000000'
        })
        .borderRadius(8)

        //OpenHarmony -> 显示图片（Image）
        //https://docs.openharmony.cn/pages/v5.0/zh-cn/application-dev/ui/arkts-graphics-display.md

        this.dividerLine()

        //布局 - 横向等间距
        Row({ space: 20 }) {
          Text('子元素1')
            .width(80)
            .height(40)
            .backgroundColor(Color.Pink)
          Text('子元素2')
            .width(80)
            .height(40)
            .backgroundColor(Color.Orange)
          Text('子元素3')
            .width(80)
            .height(40)
            .backgroundColor(Color.Brown)
        }
        .backgroundColor(Color.Blue)
        .padding(1)

        this.dividerLine()

        //布局 - 竖向等间距
        Column({ space: 20 }) {
          Text('子元素1')
            .width(100)
            .height(40)
            .backgroundColor(Color.Pink)
          Text('子元素2')
            .width(100)
            .height(40)
            .backgroundColor(Color.Orange)
          Text('子元素3')
            .width(100)
            .height(40)
            .backgroundColor(Color.Brown)
        }
        .backgroundColor(Color.Blue)
        .padding(1)

        this.dividerLine()
        /*
        布局主方向对齐方式  justifyContent(枚举 FlexAlign)
          Start 首端对齐 ; Center 居中对齐 ; End 尾部对齐
          SpaceBetween 两端对齐。子元素之间间距相等
          SpaceAround  子元素两侧间距相等。第一个元素到行首的距离和最后一个元素到行尾的距离是相邻元素之间距离的一半
          SpaceEvenly  相邻元素之间的距离、第一个元素与行首的间距、最后一个元素到行尾的间距都完全一样
          https://www.yuque.com/megasu/hm_base_v1.1/uvyg8ko64lrdrzt0
          *
          *
          概念：
          1 布局主方向在线性布局中叫做布局主轴
          2 另外一条坐标轴叫做交叉轴
         */

        // 主布局方向的对齐方式 justifyContent SpaceBetween
        Row() {
          Text('justifyContent.SpaceBetween')
            .width(80)
            .height(40)
            .backgroundColor(Color.Orange)
            .fontSize(12)
          Text('子元素1')
            .width(80)
            .height(40)
            .backgroundColor(Color.Pink)
          Text('子元素2')
            .width(80)
            .height(40)
            .backgroundColor(Color.Brown)
        }
        .width('100%')
        .height(100)
        .backgroundColor('#ccc')
        // 主布局方向的对齐方式
        //.justifyContent(FlexAlign.Center)
        // 两端对齐
        .justifyContent(FlexAlign.SpaceBetween)

        this.spaceLine()

        // 主布局方向的对齐方式 justifyContent SpaceAround
        Row() {
          Text('justifyContent.SpaceAround')
            .width(80)
            .height(40)
            .backgroundColor(Color.Orange)
            .fontSize(12)
          Text('子元素1')
            .width(80)
            .height(40)
            .backgroundColor(Color.Pink)
          Text('子元素2')
            .width(80)
            .height(40)
            .backgroundColor(Color.Brown)
        }
        .width('100%')
        .height(100)
        .backgroundColor('#ccc')
        // 主布局方向的对齐方式
        .justifyContent(FlexAlign.SpaceAround)

        this.spaceLine()

        // 主布局方向的对齐方式 justifyContent SpaceEvenly
        Row() {
          Text('justifyContent.SpaceEvenly')
            .width(80)
            .height(40)
            .backgroundColor(Color.Orange)
            .fontSize(12)
          Text('子元素1')
            .width(80)
            .height(40)
            .backgroundColor(Color.Pink)
          Text('子元素2')
            .width(80)
            .height(40)
            .backgroundColor(Color.Brown)
        }
        .width('100%')
        .height(100)
        .backgroundColor('#ccc')
        .justifyContent(FlexAlign.SpaceEvenly)

        this.dividerLine()

        //交叉轴对齐方式 alignItems(枚举 VerticalAlign) - 以 Row 为例，主轴在水平方向，交叉轴在垂直方向
        Row() {
          Text('子元素1')
            .width(80)
            .height(40)
            .backgroundColor(Color.Pink)
          Text('子元素2')
            .width(80)
            .height(40)
            .backgroundColor(Color.Orange)
          Text('子元素3')
            .width(80)
            .height(40)
            .backgroundColor(Color.Brown)
        }
        .width('100%')
        .height(120)
        .backgroundColor('#ccc')
        // 顶部对齐
        //.alignItems(VerticalAlign.Top)
        .alignItems(VerticalAlign.Bottom)

        this.dividerLine()

        Column() {
          Text('子元素1')
            .width(80)
            .height(30)
            .backgroundColor(Color.Pink)
          Text('子元素2')
            .width(80)
            .height(30)
            .backgroundColor(Color.Orange)
          Text('子元素3')
            .width(80)
            .height(30)
            .backgroundColor(Color.Brown)
        }
        .width('100%')
        .height(120)
        .backgroundColor('#ccc')
        //报错： Argument of type 'VerticalAlign' is not assignable to parameter of type 'HorizontalAlign'. <ArkTSCheck>
        //报错： “VerticalAlign”类型的参数不能分配给“HorizontalAlign”类型的参数。<ArkTSCheck>

        // 顶部对齐
        //.alignItems(HorizontalAlign.Start)
        // 底部对齐
        .alignItems(HorizontalAlign.End)

        this.dividerLine()

        //总结：
        //1 交叉轴的具体方向，永远是从左往右，或是从上往下。
        //2 justifyContent 默认是靠左 ; alignItems 默认是居中。
        //验证
        Row() {
          Text('子元素')
            .width(80)
            .height(40)
            .backgroundColor(Color.Orange)
        }
        .width('100%')
        .height(100)
        .backgroundColor("#d3f2e3")

        this.spaceLine()

        Column() {
          Text('子元素')
            .width(80)
            .height(40)
            .backgroundColor(Color.Brown)
        }
        .width('100%')
        .height(100)
        .backgroundColor(Color.Blue)

        this.dividerLine()

        //单个子元素交叉轴对齐方式 alignSelf()
        //枚举 ItemAlign(Stretch拉伸，交叉轴拉伸效果)
        /*
        理解: alignItems 用于Group组件统一管理内部View的交叉轴方向；
        而 alignSelf 用于Group中某个子View单独控制自己的交叉轴方向，拓展性更高。
         */
        Row() {
          Text('子元素1')
            .width(90)
            .height(40)
            .backgroundColor(Color.Pink)
          Text('alignSelf(ItemAlign.Stretch)')
            .width(90)
            .height(40)
            .backgroundColor(Color.Orange)// 交叉轴方向尺寸拉伸
            .fontSize(14)
            .alignSelf(ItemAlign.Stretch)
          Text('子元素3')
            .width(90)
            .height(40)
            .backgroundColor(Color.Brown)
        }
        .width('100%')
        .height(150)
        .backgroundColor('#ccc')

        this.dividerLine()

        //同时设置 alignSelf 和 alignItems，alignSelf 生效，alignItems失效。
        Column() {
          Text('1')
            .width(100)
            .height(40)
            .backgroundColor(Color.Pink)
          Text('2')
            .width(100)
            .height(40)
            .backgroundColor(Color.Orange)// 单个元素-交叉轴对齐方式
            .alignSelf(ItemAlign.End)
          Text('3')
            .width(100)
            .height(40)
            .backgroundColor(Color.Pink)
        }
        .width('100%')
        .height(150)
        .backgroundColor('#ccc')
        // 主轴对齐方式 -- 与Row写法一致
        .justifyContent(FlexAlign.SpaceBetween)
        // 交叉轴对齐方式（水平方向），默认居中
        .alignItems(HorizontalAlign.Start)

        //总结：实际效果中，alignSelf(ItemAlign.End) 会覆盖掉 alignItems(HorizontalAlign.Start) 的效果。
        this.dividerLine()

        //layoutWeight 原理与 Android 布局比重一致。
        //父容器尺寸确定时，设置了 layoutWeight 属性的子元素与兄弟元素占主轴尺寸按照权重进行分配。
        Column() {
          // 主轴方向：水平方向
          Row() {
            Text('左侧')
              .width(60)
              .height(30)
              .backgroundColor('#ccc')
            Text('中间')
              .height(30)
              .backgroundColor(Color.Pink)
              .layoutWeight(0.5)
            Text('右侧 layoutWeight')
              .height(30)
              .backgroundColor('#fc0')
              .layoutWeight(1)
          }
        }

        this.spaceLine()

        Column() {
          Row() {
            Text('Bluetooth').fontSize(18)

            //Blank()
            //设置最小宽度为160
            Blank('160').color(Color.Yellow)

            Toggle({ type: ToggleType.Switch })
              .width('13%')
              .margin({
                top: 14,
                bottom: 14,
                left: 10,
                right: 10
              })
          }.width('100%').backgroundColor(0xFFFFFF).borderRadius(15).padding({ left: 15 })
        }.backgroundColor(0xEFEFEF).padding(20)

        this.dividerLine()

        //案例-头条新闻
        //非常好的案例，融合了 justifyContent，alignItems，layoutWeight 的使用。
        Row({ space: 10 }) {
          // 左侧
          Column() {
            Text('第五个国际数学日，全世界和数据一起玩儿')
              .fontSize(14)
              .fontColor('#444')
            Row() {
              Text('中国青年网 昨天')
                .fontSize(12)
                .fontColor('#999')
                .layoutWeight(1)
              Image($r('app.media.ic_close'))
                .width(14)
                .fillColor('#999')
            }

            // .width('100%')
            // .justifyContent(FlexAlign.SpaceBetween)
          }
          .layoutWeight(1)
          .height('100%')
          // 水平左对齐 -- 交叉轴
          .alignItems(HorizontalAlign.Start)
          // 垂直两端对齐 -- 主轴
          .justifyContent(FlexAlign.SpaceBetween)

          // 右侧
          Image($r('app.media.math'))
            .width(100)
        }
        .width('100%')
        .height(100)
        .padding(10)

        this.dividerLine()

        //弹性布局（Flex）
        //案例-阶段菜单
        Column() {
          Text('阶段选择')
            .fontWeight(600)
            .fontSize(24)
            .width('100%')
            .padding(15)
          Flex({ wrap: FlexWrap.Wrap }) {
            Text('ArkUI')
              .padding(10)
              .margin(5)
              .backgroundColor('#f6f7f9')
            Text('ArkTS')
              .padding(10)
              .margin(5)
              .backgroundColor('#f6f7f9')
            Text('界面开发')
              .padding(10)
              .margin(5)
              .backgroundColor('#f6f7f9')
            Text('系统能力')
              .padding(10)
              .margin(5)
              .backgroundColor('#f6f7f9')
            Text('权限控制')
              .padding(10)
              .margin(5)
              .backgroundColor('#f6f7f9')
            Text('元服务')
              .padding(10)
              .margin(5)
              .backgroundColor('#f6f7f9')
          }
        }
        .width('100%')
        .height(180)
        .padding(10)

        this.dividerLine()

        //案例-微店商品
        Column() {
          Flex({ wrap: FlexWrap.Wrap }) {
            Column({ space: 8 }) {
              Image($r('app.media.top1'))
                .width('100%')
                .borderRadius({ topLeft: 5, topRight: 5 })
              Text('[ 程序员必备 ] 最高版本-格子衫')
                .fontSize(12)
                .maxLines(1)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
                .padding({ left: 10, right: 10 })
              Row() {
                Text('￥666 ')
                  .fontSize(12)
                  .fontColor('#f52555')
                Text('销量666')
                  .fontSize(8)
                  .fontColor('#999')
              }
              .padding({ left: 10, right: 10 })
            }
            .width('47%')
            .backgroundColor('#fff')
            .margin({ right: 10, bottom: 10 })
            .borderRadius(5)
            .alignItems(HorizontalAlign.Start)
            .padding({ bottom: 10 })

            Column({ space: 8 }) {
              Image($r('app.media.top2'))
                .width('100%')
                .borderRadius({ topLeft: 5, topRight: 5 })
              Text('[ 程序员必备 ] 最高版本-格子衫')
                .fontSize(12)
                .maxLines(1)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
                .padding({ left: 10, right: 10 })
              Row() {
                Text('￥888 ')
                  .fontSize(12)
                  .fontColor('#f52555')
                Text('销量888')
                  .fontSize(8)
                  .fontColor('#999')
              }
              .padding({ left: 10, right: 10 })
            }
            .width('47%')
            .backgroundColor('#fff')
            .margin({ right: 10, bottom: 10 })
            .borderRadius(5)
            .alignItems(HorizontalAlign.Start)
            .padding({ bottom: 10 })

            Column({ space: 8 }) {
              Image($r('app.media.top3'))
                .width('100%')
                .borderRadius({ topLeft: 5, topRight: 5 })
              Text('[ 程序员必备 ] 最高版本-格子衫')
                .fontSize(12)
                .maxLines(1)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
                .padding({ left: 10, right: 10 })
              Row() {
                Text('￥333 ')
                  .fontSize(12)
                  .fontColor('#f52555')
                Text('销量666')
                  .fontSize(8)
                  .fontColor('#999')
              }
              .padding({ left: 10, right: 10 })
            }
            .width('47%')
            .backgroundColor('#fff')
            .margin({ right: 10, bottom: 10 })
            .borderRadius(5)
            .alignItems(HorizontalAlign.Start)
            .padding({ bottom: 10 })

            Column({ space: 8 }) {
              Image($r('app.media.top4'))
                .width('100%')
                .borderRadius({ topLeft: 5, topRight: 5 })
              Text('[ 程序员必备 ] 最高版本-格子衫')
                .fontSize(12)
                .maxLines(1)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
                .padding({ left: 10, right: 10 })
              Row() {
                Text('￥444 ')
                  .fontSize(12)
                  .fontColor('#f52555')
                Text('销量666')
                  .fontSize(8)
                  .fontColor('#999')
              }
              .padding({ left: 10, right: 10 })
            }
            .width('47%')
            .backgroundColor('#fff')
            .margin({ right: 10, bottom: 10 })
            .borderRadius(5)
            .alignItems(HorizontalAlign.Start)
            .padding({ bottom: 10 })

            Column({ space: 8 }) {
              Image($r('app.media.top2'))
                .width('100%')
                .borderRadius({ topLeft: 5, topRight: 5 })
              Text('[ 程序员必备 ] 最高版本-格子衫')
                .fontSize(12)
                .maxLines(1)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
                .padding({ left: 10, right: 10 })
              Row() {
                Text('￥555 ')
                  .fontSize(12)
                  .fontColor('#f52555')
                Text('销量666')
                  .fontSize(8)
                  .fontColor('#999')
              }
              .padding({ left: 10, right: 10 })
            }
            .width('47%')
            .backgroundColor('#fff')
            .margin({ right: 10, bottom: 10 })
            .borderRadius(5)
            .alignItems(HorizontalAlign.Start)
            .padding({ bottom: 10 })

            Column({ space: 8 }) {
              Image($r('app.media.top5'))
                .width('100%')
                .borderRadius({ topLeft: 5, topRight: 5 })
              Text('[ 程序员必备 ] 最高版本-格子衫')
                .fontSize(12)
                .maxLines(1)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
                .padding({ left: 10, right: 10 })
              Row() {
                Text('￥444 ')
                  .fontSize(12)
                  .fontColor('#f52555')
                Text('销量444')
                  .fontSize(8)
                  .fontColor('#999')
              }
              .padding({ left: 10, right: 10 })
            }
            .width('47%')
            .backgroundColor('#fff')
            .margin({ right: 10, bottom: 10 })
            .borderRadius(5)
            .alignItems(HorizontalAlign.Start)
            .padding({ bottom: 10 })
          }
        }
        .width('100%')
        //.height(200)
        .backgroundColor('#f5f6f7')
        .padding(10)

        this.dividerLine()

        //定位
        //● 绝对定位：position，相对父组件左上角进行偏移
        //● 相对定位：offset，相对自身左上角进行偏移

        //绝对定位：position()
        /*
        {x: 水平偏移量, y: 垂直偏移量} -> x轴向右为正向，y轴向下为正向
        绝对定位特点：
        1. 参照父组件左上角进行偏移
        2. 绝对定位后的组件不再占用自身原有位置
         */
        Column() {
          Text('position')
            .width(80)
            .height(40)
            .backgroundColor(Color.Pink)
            .position({
              x: 30,
              y: 10
            })
          // .onClick(() => {
          //   this.getUIContext().showAlertDialog({
          //     title: '测试',
          //     message: '绝对定位，初始位置不保留',
          //     autoCancel: true,
          //     alignment: DialogAlignment.Center,
          //   })
          // })
        }
        .width('100%')
        .height(100)
        .backgroundColor('#ccc')

        this.spaceLine()

        //相对定位：offset()
        /*
        相对定位特点：
        1. 相对自身左上角进行偏移
        2. 相对定位后的组件仍然占用自身原有位置
         */
        Column() {
          Text('内容1')
            .width(80)
            .height(40)
            .backgroundColor(Color.Pink)
          Text('offset')
            .width(80)
            .height(40)
            .backgroundColor(Color.Orange)// 占位
            .offset({
              x: 100,
              y: -30
            })
          // .onClick(() => {
          //   this.getUIContext().showAlertDialog({
          //     title: '测试',
          //     message: '相对定位，初始位置依然保留',
          //     autoCancel: true,
          //     alignment: DialogAlignment.Center,
          //   })
          // })
          Text('内容3')
            .width(80)
            .height(40)
            .backgroundColor(Color.Brown)
        }
        .width('100%')
        .height(150)
        .backgroundColor('#ccc')

        this.dividerLine()

        //案例-人气热播故事 position
        Column() {
          // 图片
          Image($r('app.media.moco'))
            .width('100%')
            .aspectRatio(0.8)
            .borderRadius(8)
          // 文字
          Row({ space: 10 }) {
            Image($r('app.media.ic_device_earphone_roc_filled'))
              .width(20)
              .padding(3)
              .borderRadius(10)//控制 SVG 颜色
              .backgroundColor('#0cbff9')
              .fillColor('#fff')
            Text('飞狗MOCO')
              .fontSize(16)
              .fontColor('#4b3635')
              .fontWeight(600)
          }
          .width('100%')
          .padding(5)
          .alignItems(VerticalAlign.Top)

          // VIP
          Text('VIP')
            .width(34)
            .height(18)
            .backgroundColor('#f3912e')
            .border({
              width: 2,
              color: '#ffe7a0'
            })
            .borderRadius({
              topLeft: 8,
              bottomRight: 8
            })
            .position({ x: 0, y: 0 })
            .fontSize(12)
            .fontColor('#ffe788')
            .textAlign(TextAlign.Center)
            .fontWeight(700)
            .fontStyle(FontStyle.Italic)
        }
        .width('45%')

        this.dividerLine()

        //上面的例子是通过 Column+position 实现，也可以使用层叠布局。
        /*
        层叠布局（StackLayout）用于在屏幕上预留一块区域来显示组件中的元素，提供元素可以重叠的布局。
        层叠布局通过 Stack 容器组件实现位置的固定定位与层叠，容器中的子元素依次入栈，后一个子元素覆盖前一个子元素，子元素可以叠加，也可以设置位置。
        层叠布局具有较强的页面层叠、位置定位能力，其使用场景有广告、卡片层叠效果等。

        原理同 Android FrameLayout。
         */
        //
        //默认居中
        Stack() {
          Column() {
          }
          .width('90%')
          .height(130)
          .backgroundColor(Color.Gray)

          Text('text')
            .width('60%')
            .height('60%')
            .backgroundColor(Color.Orange)
          Button('button')
            .width('30%')
            .height('30%')
            .backgroundColor('#ff8ff3eb')
            .fontColor('#000')
        }
        .width('100%')
        .height(150)
        .backgroundColor(Color.Pink)

        this.dividerLine()

        //Stack 对齐方式
        //alignContent: Alignment.BottomEnd
        Column() {
          Stack({ alignContent: Alignment.BottomEnd }) {
            Column() {
            }
            .width('90%')
            .height(130)
            .backgroundColor(Color.Gray)

            Text('text')
              .width('60%')
              .height('60%')
              .backgroundColor(Color.Orange)
            Button('button')
              .width('30%')
              .height('30%')
              .backgroundColor('#ff8ff3eb')
              .fontColor('#000')
          }
          .width('100%')
          .height(150)
          .backgroundColor(Color.Pink)
        }
        .margin(10)

        //Stack Z序控制
        //zIndex(整数数字)属性调整显示层级 -> 整数数字值越大，显示层级越高
        Stack({ alignContent: Alignment.BottomEnd }) {
          Column() {
          }
          .width('90%')
          .height(130)
          .backgroundColor(Color.Gray)

          Text('text')
            .width('60%')
            .height('60%')
            .backgroundColor('rgba(255,165,0,0.5)')// Z 序：显示在按钮上一层
            .zIndex(1)
          Button('button')
            .width('30%')
            .height('30%')
            .backgroundColor('#ff8ff3eb')
            .fontColor('#000')
          //.zIndex(2)
        }
        .width('100%')
        .height(150)
        .backgroundColor(Color.Pink)

        this.dividerLine()

        //综合案例-B站-视频卡片(凤凰传奇 铁衣)
        //https://www.yuque.com/megasu/hm_base_v1.1/evi4167sdd4o4769#YsF79
        /*
        区域划分：
        ●图片区域（层叠布局）
            ○图片组件
            ○文字内容：播放 + 评论 + 时长（Row 线性布局）
        ●文字区域（Column 线性布局）
            ○标题文字
            ○点赞量 + 更多 (Row 线性布局)
         */
        Column() {
          Column() {
            // 图片区域 -- 层叠布局
            Stack({ alignContent: Alignment.BottomStart }) {
              // 图片组件
              Image($r('app.media.tieyi'))
                .width(200)
                .height(125)
                .objectFit(ImageFit.Cover)
                .borderRadius({
                  topLeft: 10,
                  topRight: 10
                })
              // 文字内容
              Row() {
                // 播放量
                /*
                此处也可以用 Text+ImageSpan 实现
                Text() {
                  ImageSpan($r('app.media.ic_bofangshu')).width(16)  //ImageSpan 不支持 fillColor('#fff')
                  Span('282万').fontColor('#fff').fontSize(12)
                }
                 */

                Row({ space: 5 }) {
                  Image($r('app.media.ic_bofangshu')).width(16).fillColor('#fff')
                  Text('282万').fontColor('#fff').fontSize(12)
                }
                .margin({ right: 5 })

                // 评论数
                Row({ space: 5 }) {
                  Image($r('app.media.ic_ziyuan')).fillColor('#fff').width(14)
                  Text('8655').fontColor('#fff').fontSize(12)
                }

                // 空白填充组件
                Blank()
                // 右侧时长
                Text('4:33').fontColor('#fff').fontSize(12)
              }
              .width('100%')
              .height(24)
              .padding({ left: 5, right: 5 })
            }

            //.backgroundColor(Color.Blue)

            // 文字区域
            Column() {
              // 标题文字
              Text('【凤凰传奇新歌】欢迎来到国风统治区：唢呐一响神曲《铁衣流派推广曲》')
                .fontSize(13)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
                .maxLines(2)
                .lineHeight(16)
              // 点赞更多
              Row() {
                Text('19万点赞')
                  .padding(3)
                  .backgroundColor('#fef0ef')
                  .fontSize(10)
                  .fontColor('#e66c43')
                Image($r('app.media.ic_gengduo')).width(14).fillColor('#bfbfbf')
              }
              .width('100%')
              .margin({ top: 10 })
              .justifyContent(FlexAlign.SpaceBetween)
            }
            .padding(5)
          }
          .width(200)
          .height(200)
          .backgroundColor('#fff')
          .borderRadius(10)
        }
        .width('100%')
        //.height('100%')
        .backgroundColor('#ccc')
        .padding(10)

        this.dividerLine()

        //@State装饰器：组件内状态
        /*
        @State 装饰的变量，或称为状态变量，一旦变量拥有了状态属性，就可以触发其直接绑定UI组件的刷新。当状态改变时，UI会发生对应的渲染改变。
        在状态变量相关装饰器中，@State是最基础的，使变量拥有状态属性的装饰器，它也是大部分状态变量的数据源。

        @State装饰的变量，与声明式范式中的其他被装饰变量一样，是私有的，只能从组件内部访问，在声明时必须指定其类型和本地初始化。
         */

        //红包 @State ， position
        // Button('显示右侧边栏红包').onClick(() => {
        //   this.opacityNum = 1
        // })

        Button(`${this.followFlag ? '已关注' : '+ 关注'}`)
          .backgroundColor(`${this.followFlag ? '#f60' : '#00f'}`)
          .onClick(() => {
            this.followFlag = !this.followFlag
          })

        this.spaceLine()

        Column() {
          Image($r('app.media.coupon_float_left'))
          Image($r('app.media.ic_close'))
            .width(18)
            .height(18)
            .backgroundColor('rgba(0,0,0,0.1)')
            .padding(2)
            .borderRadius(8)
            .position({ x: 0, y: 0 })// 单击，修改opacityNum状态值为0，即透明度值变为0，红包区域隐藏
            .onClick(() => {
              this.opacityNum = 0
            })
        }
        .width(80)
        .height(80)
        .position({ x: '85%', y: '80%' })
        .opacity(this.opacityNum)

        //通用属性
        /*
        多态样式
        作用：设置组件不同状态的样式  ;  属性：stateStyles()
        normal    正常态（默认态）
        pressed   按压态（点击态）
        disabled  不可用态（禁用态）
        focused   获焦态（Tab 键换焦）
        selected  选中态
         */
        //看这个 https://docs.openharmony.cn/pages/v5.0/zh-cn/application-dev/quick-start/arkts-statestyles.md
        Text('Text1')
          .width(80)
          .height(50)
          .backgroundColor(Color.Pink)
          .stateStyles({
            pressed: {
              .backgroundColor(Color.Red)
              .width(200)
            }
          })

        this.spaceLine()

        /*
        @Styles 和 stateStyles 联合使用
        以下示例通过 @Styles 指定 stateStyles 的不同状态。
         */
        Text('Text2')
          .width(100)
          .height(50)
          .fontSize(20)
          .fontColor(Color.White)
          .stateStyles({
            normal: this.normalStyle,
            pressed: this.pressedStyle,
          })

        this.spaceLine()

        /*
        在 stateStyles 里使用常规变量和状态变量
        stateStyles 可以通过 this 绑定组件内的常规变量和状态变量。

        @State  类似于 LiveData ； IOS 自带该属性
        https://docs.openharmony.cn/pages/v5.0/zh-cn/application-dev/quick-start/arkts-state.md
         */
        Button('clickMe')
          .height(100)
          .width(100)
          .stateStyles({
            normal: {
              .backgroundColor(this.normalColor)
            },
            pressed: {
              .backgroundColor(this.pressedColor)
            }
          })
          .onClick(() => {
            this.pressedColor = Color.Pink
          })
          .margin('5%')

        this.dividerLine()

        /*
        动画 animation
        组件的某些通用属性变化时，可以通过属性动画实现渐变过渡效果，提升用户体验。
        支持的属性包括width、height、backgroundColor、opacity、scale、rotate、translate等。

        https://www.yuque.com/megasu/hm_base_v1.1/evi4167sdd4o4769#xn98o
         */

        //动画-平移 translate(x,y,z) 注意xyz轴的方向。
        Image($r('app.media.ic_my_avatar'))
          .width(100)
          .aspectRatio(1)
          .stateStyles({
            normal: {
              .translate({ x: 0 })
            },
            pressed: {
              .translate({ x: 150 })
            }
          })
          .animation({
            duration: 500,
          })

        //动画-缩放 scale(x,y,z) 默认值为1
        Image($r('app.media.app_icon'))
          .width(100)
          .aspectRatio(1)
          .stateStyles({
            normal: {
              .scale({ x: 1, y: 1 })
            },
            pressed: {
              .scale({ x: 0.5, y: 0.5 })
            }
          })
          .animation({
            duration: 500,
          })

        //动画-旋转 rotate()(x,y,z)
        Image($r('app.media.ic_my_avatar'))
          .width(100)
          .aspectRatio(1)
          .stateStyles({
            normal: {
              .rotate({ angle: 0 })
            },
            pressed: {
              .rotate({ angle: 200 })
            }
          })
          .animation({
            duration: 500,
          })

        this.dividerLine()

        //综合案例-美团购物车 - 运算符
        //TestPageMeituanShopCart.ets

        /*
        总结：@See README.md
         */

        //todo 2025年1月9日11:02:48 类型进阶与渲染控制

      }
    }
    .height('100%')
    .width('100%')
  }

  @State followFlag: boolean = false
  @State opacityNum: number = 1
  @State normalColor: Color = Color.Green
  pressedColor: Color = Color.Blue

  @Styles
  normalStyle() {
    .backgroundColor(Color.Blue)
    .width(100)
  }

  @Styles
  pressedStyle() {
    .backgroundColor(Color.Red)
    .width("180vp")
  }

  @Builder
  dividerLine() {
    Line().width('100%').height(1).backgroundColor(Color.Red).margin(10)
  }

  @Builder
  spaceLine() {
    Line().width('100%').backgroundColor(Color.Transparent).margin(10)
  }
}