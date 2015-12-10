

![image1](https://github.com/DanisFabric/RainbowNavigation/blob/master/images/logo.png)

# RainbowNavigation [中文介绍](https://github.com/DanisFabric/RainbowNavigation/blob/master/README_CN.md)

You can use `RainbowNavigation` to set the backgroundColor of `UINavigationBar` in animation.

## Feature

* Set the backgroundColor of `UINavigationBar`.
* Make transparent `UINavigationBar`
* Add statusBar mask for `UINavigationBar`
* Update the backgroundColor of `UINavgationBar` in animation
* Support `Push/Pop` operations
* Support gesture `Pop` operation

![image1](https://github.com/DanisFabric/RainbowNavigation/blob/master/images/demo1.gif)
![image2](https://github.com/DanisFabric/RainbowNavigation/blob/master/images/demo2.gif)
![image3](https://github.com/DanisFabric/RainbowNavigation/blob/master/images/demo3.gif)

## Requirements

* iOS 8.0 +
* Swift 2.0 +

## Install

### CocoaPods

add following code to your Podfile

```
pod 'RainbowNavigation'
```


## Usage

### Set the backgroundColor of `UINavigationBar`

Make `UINavigationBar` transparent

```
navigationBar.ll_setBackgroundColor(UIColor.clearColor())
```
Restore the default values

```
navigationBar.ll_reset() // 恢复默认，取消之前的颜色设置的影响
```

### Add StatusBar Mask


```
navigationBar.ll_setStatusBarMaskColor(UIColor.blackColor().colorWithAlphaComponent(0.1))

```

### Add `UINavigationController` support

#### RainbowNavigation

wire the `UINavigationController` to `RainbowNavigation`

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

`UINavigationController's` children viewControllers comfirm `LLRainbowColorSource` protocol, and return the `UINavigationBar` color is OK.	

```
@objc public protocol LLRainbowColorSource {
    optional func ll_navigationBarInColor() -> UIColor    
    optional func ll_navigationBarOutColor() -> UIColor   
}
```


## Demo

`RainbowNavigation` is simple to use, downlaod the demo project and learn more. 

## Author

DanisFabric, danisfabric@gmail.com

## License

RainbowNavigation is available under the MIT license. See the LICENSE file for more info.
