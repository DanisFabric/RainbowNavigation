<!--[![CI Status](http://img.shields.io/travis/DanisFabric/RainbowNavigation.svg?style=flat)](https://travis-ci.org/DanisFabric/RainbowNavigation)
[![Version](https://img.shields.io/cocoapods/v/RainbowNavigation.svg?style=flat)](http://cocoapods.org/pods/RainbowNavigation)
[![License](https://img.shields.io/cocoapods/l/RainbowNavigation.svg?style=flat)](http://cocoapods.org/pods/RainbowNavigation)
[![Platform](https://img.shields.io/cocoapods/p/RainbowNavigation.svg?style=flat)](http://cocoapods.org/pods/RainbowNavigation)-->


![image1](https://github.com/DanisFabric/RainbowNavigation/blob/master/images/logo.png)

# RainbowNavigation

`RainbowNavigation` 是由Swfit2.0 编写的一个能够动态改变`UINavigationBar`背景色的组件。

## 功能

* 将`UINavigationBar`背景色改为透明
* `UINavigationBar` 增加类似MaterialDesign的深色`StatusBar`
* `UINavigationController`在Push/Pop 时，背景色随动画过程进行改变
* 手势拖拽进行`UINavigationController`的Pop行为

## 运行图

![image1](https://github.com/DanisFabric/RainbowNavigation/blob/master/images/demo1.gif)
![image2](https://github.com/DanisFabric/RainbowNavigation/blob/master/images/demo2.gif)
![image3](https://github.com/DanisFabric/RainbowNavigation/blob/master/images/demo3.gif)

## 基本需求

* iOS 8.0+
* Swift 2.0 +

## 安装

### CocoaPods

在Podfile添加以下代码快速集成

```
pod 'RainbowNavigation
```


## 如何使用

### 设置`UINavigationBar`的背景色


如下代码能够直接设置UINavigationBar的背景色，并不会有iOS7之后`UINavigationBar`的色差问题。当把颜色设置为`clearColor`时，`UINavigationBar`的背景会透明。

```
navigationBar.ll_setBackgroundColor(UIColor.clearColor())
```

将`ll_setBackgroundColor`带来的影响去掉

```
navigationBar.ll_reset() // 恢复默认，取消之前的颜色设置的影响
```

### 设置statusBar 遮罩颜色

```
navigationBar.ll_setStatusBarMaskColor(UIColor.blackColor().colorWithAlphaComponent(0.1))

```

### `UINavigationController`集成`RainbowNavigation`

#### RainbowNavigation

最好统一使用`ll_setBackgroundColor(color)`这个方法，因为`RainbowNavigation`也是通过此方法对UINavigationBar的颜色进行设置的。	

首先声明`LLRainbowNavigation`属性，然后通过`wireTo`方法将为其绑定对应的`UINavigationController`。

```
lazy var rainbowNavigation = LLRainbowNavigation()
   override func viewDidLoad() {
        super.viewDidLoad()
        if let navController = self.navigationController {
            rainbowNavigation.wireTo(navigationController: navController)
        }
    }
```


#### LLRainbowColorSource

`LLRainbowColorSource`是一个`protocol`，所有的UIViewController都可以实现此协议。在`RainbowNavigation`绑定了一个`UINavigationController`之后，每次`UINavigationController`在进行`Push`或`Pop`操作时，都会检查栈顶的`UIViewController`是否实现了ColorSource协议，并且显示Protocol两个方法返回的对应的颜色。	

```
@objc public protocol LLRainbowColorSource {
    optional func ll_navigationBarInColor() -> UIColor    // ViewController被Push进去的时候，UINavigationBar将转变的背景色
    optional func ll_navigationBarOutColor() -> UIColor   // ViewController被Pop出去的时候，UINavigationBar将转变的颜色
}
```
`LLRainbowColorSource`是可选的，可以不实现，此时`UINavigationBar`将保持原本的颜色。


## Demo

`RainbowNavigation`的使用十分简单，可以通过下载demo项目来查看Gif图片显示的功能的实现方式。

## Author

DanisFabric, danisfabric@gmail.com

## License

RainbowNavigation is available under the MIT license. See the LICENSE file for more info.
