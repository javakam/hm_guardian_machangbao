import { hidebug } from '@kit.PerformanceAnalysisKit';

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
          let unsafeInt = 9007199254740992n + 1n; // 超过最大安全整数
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
          .width(200)
          .height(100)
          .backgroundColor('#d3f2e3')
          .textAlign(TextAlign.End)
          .align(Alignment.Top)

        //也可以只用 align()
        Text('左下角')
          .width(200)
          .height(100)
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
        Image('http://www.zqrb.cn/zqrb_index/images/logoyeshou.jpg')
          .width(100)
        //.alt($r('app.media.startIcon')) // 加载时显示的占位图

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
          .backgroundColor(Color.Pink).objectFit(ImageFit.Cover)

        // 图片缩放至充满组件（不等比缩放）
        Image($r('app.media.ic_my_avatar'))
          .width(150)
          .height(100)
          .backgroundColor(Color.Pink).objectFit(ImageFit.Fill)

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
            .borderRadius({topLeft: 8, topRight: 8})
          Text('磁力片。工厂直发磁力王。100片，尺寸7.5cm 可兼容其他品牌')
            .width('100%')
            .padding({left: 5, right: 5})
            .fontSize(12)
            .lineHeight(18)
            .maxLines(2)
            .textOverflow({overflow: TextOverflow.Ellipsis})
          Text('￥ 87')
            .width('100%')
            .padding({left: 5, right: 5})
            .fontSize(13)
            .fontColor('#f00')
            .margin({top: 5})
        }
        .width('50%')
        .padding({bottom:10})
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
            .margin({top: 10, bottom: 10})
          Text('了解更多')
            .fontColor('#fff')
            .fontSize(8)
            .border({width: 1, color: '#fff'})
            .padding({left: 20, right: 20, top:5, bottom: 5})
        }
        .width('90%')
        .height(160)
        .padding({left: 10, right: 10, top: 20})
        .backgroundImage($r('app.media.ic_test_huawei'))
        .backgroundColor(Color.Pink)
        //.backgroundImagePosition({x: 100, y: 50})
        // .backgroundImagePosition(Alignment.Center)
        // .backgroundImageSize(ImageSize.Cover)

        //总结：先用 Contain 调到大致效果，最后改用 ImageSize.Cover 补充一些缝隙留白。
        .backgroundImagePosition(Alignment.TopStart)
        .backgroundImageSize(ImageSize.Contain)


        //todo 2025年1月3日17:07:03

        this.dividerLine();

      }
    }
    .height('100%')
    .width('100%')

  }

  @Builder
  dividerLine() {
    Line().width('100%').backgroundColor(Color.Red).margin(10)
  }

  @Builder
  spaceLine() {
    Line().width('100%').backgroundColor(Color.Transparent).margin(10)
  }
}