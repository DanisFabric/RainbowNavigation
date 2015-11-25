# RainbowNavigation

[![CI Status](http://img.shields.io/travis/DanisFabric/RainbowNavigation.svg?style=flat)](https://travis-ci.org/DanisFabric/RainbowNavigation)
[![Version](https://img.shields.io/cocoapods/v/RainbowNavigation.svg?style=flat)](http://cocoapods.org/pods/RainbowNavigation)
[![License](https://img.shields.io/cocoapods/l/RainbowNavigation.svg?style=flat)](http://cocoapods.org/pods/RainbowNavigation)
[![Platform](https://img.shields.io/cocoapods/p/RainbowNavigation.svg?style=flat)](http://cocoapods.org/pods/RainbowNavigation)





## Requirements
* iOS 8.0+
* Swift 2.0 +


## Installation

#### CocoaPods

add the following line to your Podfile:

```pod "RainbowNavigation"
```
#### Manual

Just drag the .swift files to your project

## How to use

It's very simple, just 3 steps

1. set the backgroundColor of navigationBar

```
	navigationController?.navigationBar.ll_setBackgroundColor(UIColor.redColor()    
     
```
2. wire the RainbowNavigationDelegate to your NavigationController

```
	lazy var navigationDelegate = LLRainbowNavigationDelegate()
```
```
	navigationDelegate.wireTo(navigationController: self.navigationController!)
```

3. If your want to change color of UINavigationBar, just let your view controller confirm protocol `LLRainbowColorSource`

```
    // MARK: - ColorSource
    func ll_navigationBarInColor() -> UIColor {
        return UIColor.redColor()
    }
    func ll_navigationBarOutColor() -> UIColor {
        return UIColor.blueColor()
    }
```

## Demo

You can download the demo project the see how it works

## Author

DanisFabric, danisfabric@gmail.com

## License

RainbowNavigation is available under the MIT license. See the LICENSE file for more info.
