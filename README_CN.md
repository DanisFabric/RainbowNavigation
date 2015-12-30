
![image1](https://github.com/DanisFabric/RainbowNavigation/blob/master/images/logo.png)

# RainbowNavigation

## 介绍

`RainbowNavigation` 是由Swfit2.0编写。它允许你在各种情况下动画改变`UINavigationBar`的backgroundColor。

`RainbowNavigation`主要能做以下几件事：

- 任意改变`UINavigationBar`的背景色（其中包括透明）
- 为`UINavigationBar`添加Material Design风格的状态栏颜色加深
- `UINavigationBar`的背景色在navigationController进行Push或Pop的过程中，动画改变。
- 为`UINavigationController`添加全屏大小的手势识别。

## 运行图

![image1](https://github.com/DanisFabric/RainbowNavigation/blob/master/images/demo1.gif)
![image2](https://github.com/DanisFabric/RainbowNavigation/blob/master/images/demo2.gif)
![image3](https://github.com/DanisFabric/RainbowNavigation/blob/master/images/demo3.gif)

## 基本要求

* iOS 8.0+
* Swift 2.0 +

## 安装

### CocoaPods

在Podfile中添加下面代码，然后执行`pod install`

```ruby
pod 'RainbowNavigation
```

### Carthage

在Cartfile添加以下代码，然后执行`carthage update`。

```ruby
github "DanisFabric/RainbowNavigation"
```

## 如何使用

### 设置`UINavigationBar`的背景色

通过`RainbowNavigation`来设置`UINavigationBar`的背景色不会出现色差问题，并且能够直接将navigationBar的背景色设置为透明：

```Swift
navigationBar.df_setBackgroundColor(UIColor.clearColor())
```

重置背景色：

```
navigationBar.ll_reset() // 恢复默认，取消之前的颜色设置的影响
```

设置StatusBar的背景颜色：

```Swift
navigationBar.df_setStatusBarMaskColor(UIColor.blackColor().colorWithAlphaComponent(0.1))
```

### `UINavigationController`集成`RainbowNavigation`

#### RainbowNavigation

1. 将`UINavigationController`绑定给`RainbowNavigation`:

```Swift
lazy var rainbowNavigation = LLRainbowNavigation()
   override func viewDidLoad() {
        super.viewDidLoad()
        if let navController = self.navigationController {
            rainbowNavigation.wireTo(navigationController: navController)
        }
    }
```
2. `UIViewController`实现`RainbowColorSource`协议，navigationBar的颜色：

```Swift
@objc public protocol LLRainbowColorSource {
    optional func navigationBarInColor() -> UIColor    // ViewController被Push进去的时候，UINavigationBar将转变的背景色
    optional func navigationBarOutColor() -> UIColor   // ViewController被Pop出去的时候，UINavigationBar将转变的颜色
}
```


## Demo

`RainbowNavigation`的使用十分简单，可以通过下载demo项目来查看Gif图片显示的功能的实现方式。

## Author

DanisFabric, danisfabric@gmail.com

## License

```
The MIT License (MIT)

Copyright © 2015 DanisFabric

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
```
