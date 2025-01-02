@Entry
@Component
struct TestPage {
  @State message: string = 'ArkTs';

  build() {
    Column(){
      Button("基本类型").onClick(() => {
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

        console.log("mb", n1); //  3.14
        console.log("mb", n2); //  3.141592
        console.log("mb", n3); //  0.5
        console.log("mb", n4); //  100

        //5 number类型在表示大整数时会造成精度丢失。在开发时可以按需使用bigInt类型来确保精度：

        let bigIntger: BigInt = BigInt('999999999999999999999999999999999999999999999999999999999999');
        console.log("mb",'bigIntger ' + bigIntger.toString());
        //正常使用
        console.log("mb",'bigIntger Number ' + Number(bigIntger).toString());
        console.log("mb",'bigIntger Number2 ' + Number(bigIntger).toFixed(0));

        //6 string  可使用模板字面量
        let a = 'Success';
        let s3 = `The result is ${a}`;

        //7 boolean
        let isDone: boolean = false;
        // ...
        if (isDone) {
          console.log ('Done!');
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

        //10 Union类型  union类型，即联合类型，是由多个类型组合成的引用类型。联合类型包含了变量可能的所有类型。
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

        // 可以用不同的机制获取联合类型中特定类型的值。
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

        //13 参数 todo 2025年1月2日17:01:11



      })
    }
    .height('100%')
    .width('100%')

  }
}
