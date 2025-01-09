# 纯血 HarmonyOS Next 项目《守护助手APP》学习

### 学习总结
```
个人体会

HarmonyOS Next 脱胎于 Openharmony，又有自己的一些东西。HarmonyOS Next 是以 ArkTs和ArkUI 为基础语言和UI框架搭建起来的项目，写起来很像用H5去写Android。
优化特好编译和运行都极快，模拟器运行很稳定，虽然经常报内存不足，但基本上极少崩溃。

架构上，参照官方案例 10_TextToSpeech->10_Complete 中的代码可以看出，整体项目不仅架构上和Android非常相似，
组件化上也与Android开发一致。代码按类型归类分包，便于阅读、协同开发和后期维护。文档更新的及其及时和频繁，华为对该系统的重视程度可见一斑。

10_TextToSpeech->10_Complete
第十节课：https://developer.huawei.com/consumer/cn/codelabsPortal/carddetails/tutorials_Next-TTS
第一节课：https://developer.huawei.com/consumer/cn/codelabsPortal/carddetails/tutorials_Next-HelloWorld

不足之处，目前代码可读性不高，项目里无法直接看到具体实现方式(2025年1月)。
目前使用起来感觉有点乱，比如 External Libraries 中有hms和openharmony两个同名的"ArkTS-HarmonyOS-5.0.1"。

从API Version 8开始，不再提供Java语言SDK包。
```

### 上手
- OpenHarmony 和 HarmonyOS Next 的区别
- HarmonyOS Next 应用开发导读 -> HarmonyOS | 5.0.0(13)
  https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V13/application-dev-guide-V13?catalogVersion=V13

- HarmonyOS Next 知识地图
https://developer.huawei.com/consumer/cn/app/knowledge-map/
  - ① 了解HarmonyOS     ->   鸿蒙开发快速入门
  - ② 一次开发，多端部署  ->  "一多垂域案例"
  - ③ 业务场景与解决方案  ->  新闻阅读类 , 项目代码 FluentNewsHomepage :
- TestPage 内容
- 最后过一遍该项目
https://gitee.com/harmonyos_samples/fluent-news-homepage

### 重点内容

- Gitee官方项目：https://gitee.com/harmonyos_samples
- 文字特效合集：https://gitee.com/harmonyos_samples/text-effects
- ImageKnife（专门为OpenHarmony打造的一款图像加载缓存库，致力于更高效、更轻便、更简单。）
  https://gitee.com/openharmony-tpc/ImageKnife
- Stage & FA 模型比较："https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V2/project_overview-0000001053822398-V2"

- HarmonyOS图标库 https://developer.huawei.com/consumer/cn/design/harmonyos-icon/
- 阿里巴巴矢量图标库 https://www.iconfont.cn/

> 博客园（Megasu）https://www.cnblogs.com/Megasu/p/17945667
> 问题："ohpm : 无法将“ohpm”项识别为 cmdlet、函数、脚本文件或可运行程序的名称。"
>
> PowerShell 安全策略。能在 cmd 终端中使用 ohpm，但不能在 PowerShell
> 中使用，需解决安全策略问题。 https://www.cnblogs.com/Megasu/p/17945667
> IDE路径："C:\fastwork\Huawei\DevEco Studio\bin"，
> ohpm路径："C:\fastwork\Huawei\DevEco Studio\tools\ohpm\bin"。


### 课程资料

- 视频》课程地址： `https://www.bilibili.com/video/BV1EJpLeRE3L/`
- 视频2》课程地址： `https://www.bilibili.com/video/BV1BdaUerEJD/`
- 文档》鸿蒙基础_V1.1： `https://www.yuque.com/megasu/hm_base_v1.1`
- 文档》鸿蒙守护助手-黑马程序员_v1.0： `https://www.yuque.com/megasu/guardian_v1.0`
- 源码》鸿蒙守护助手（Gitee）：`https://gitee.com/Megasu/hm_guardian`
- 接口》鸿蒙守护助手：`https://apifox.com/apidoc/shared-575c0269-1ed9-4ffa-be46-bd5361822f36/doc-4294029`

### 官方文档

- 华为文档：`https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V13/map-map-V13`
- OpenHarmony文档：`https://docs.openharmony.cn/pages/v5.0/zh-cn/application-dev/dfx/hidebug-guidelines-arkts.md`

### 其它课程

```
【鸿蒙应用开发必学】
鸿蒙4.0：BV1Sa4y1Z7B1
鸿蒙Next星河版：BV14t421W7pA
鸿蒙端云一体化：BV1xW421w7By
鸿蒙《守护助手APP》项目：BV1EJpLeRE3L
```

### 资料来源

> 百度网盘：链接:https://pan.baidu.com/s/12ZtumHj2kMOYQYRXg9RtCg 提取码:1234

> 资料QQ播妞：3128242702
