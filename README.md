

![image1](https://github.com/DanisFabric/RainbowNavigation/blob/master/images/logo.png)

# RainbowNavigation [中文介绍](https://github.com/DanisFabric/RainbowNavigation/blob/master/README_CN.md)

## Feature

`RainbowNavigation` is written in Swift 2.0. It helps you change the backgroundColor of `UINavigationBar` in animations and transitions. 

![image1](https://github.com/DanisFabric/RainbowNavigation/blob/master/images/demo1.gif)
![image2](https://github.com/DanisFabric/RainbowNavigation/blob/master/images/demo2.gif)
![image3](https://github.com/DanisFabric/RainbowNavigation/blob/master/images/demo3.gif)

## Requirements

* iOS 8.0 +
* Swift 2.0 +

## Install

### CocoaPods

Add following code to your `Podfile`, and run `pod install`: 

```ruby
pod 'RainbowNavigation'
```
### Carthage

Add following code to your `Cartfile`, and run `carthage update`:

```ruby
github "DanisFabric/RainbowNavigation"
```

## Usage

### Change backgroundColor of `UINavigationBar`

Make `UINavigationBar` transparent

```
navigationBar.df_setBackgroundColor(UIColor.clearColor())
```
Restore the default values

```
navigationBar.df_reset()
```
You can add a mask for statusBar: 

```Swift
navigationBar.df_setStatusBarMaskColor(UIColor.blackColor().colorWithAlphaComponent(0.1))
```

### Support `UINavigationController` Operations

1. wire the `UINavigationController` to `RainbowNavigation`

```Swift
lazy var rainbowNavigation = RainbowNavigation()
   override func viewDidLoad() {
        super.viewDidLoad()
        if let navController = self.navigationController {
            rainbowNavigation.wireTo(navigationController: navController)
        }
    }
```

2. Your viewController need to confirm `RainbowColorSource` protocol, and offer the color which navigationBar will change into. 

```Swift
@objc public protocol RainbowColorSource {
    optional func navigationBarInColor() -> UIColor    
    optional func navigationBarOutColor() -> UIColor   
}
```


## Demo

`RainbowNavigation` is simple to use, downlaod the demo project and learn more. 

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