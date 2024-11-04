//
// Macro.swift
// SomeViewDemo
//
// Created by KellenChou on 2024/11/2
// Copyright © 2024 ZKL. All rights reserved.
//
    

import Foundation
import UIKit

// 屏幕的物理宽度
let kScreenWidth = UIScreen.main.bounds.size.width
// 屏幕的物理高度
let kScreenHeight = UIScreen.main.bounds.size.height

/**
*   除了一些简单的属性直接用常量表达,更推荐用全局函数来定义替代宏
*/
// 判断系统版本
func kIS_IOS11() ->Bool { return (UIDevice.current.systemVersion as NSString).doubleValue >= 11.0 }

// RGBA的颜色设置
func kRGBA (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}
