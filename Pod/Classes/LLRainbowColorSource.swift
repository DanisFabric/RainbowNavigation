//
//  LLRainbowColorSource.swift
//  Pods
//
//  Created by Danis on 15/11/25.
//
//

@objc public protocol LLRainbowColorSource {
    optional func ll_navigationBarInColor() -> UIColor
    optional func ll_navigationBarOutColor() -> UIColor
}
