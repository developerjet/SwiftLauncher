//
//  LauncherAnimation.swift
//  SwiftLauncher
//
//  Created by Jett on 2022/5/25.
//

import UIKit

// MARK: - Protocol

protocol LauncherAnimationProtocol { }

class LauncherAnimation: LauncherAnimationProtocol {

    // MARK: - public
    
    public var animationLayer: CALayer = .init()
    
    /// 动画执行时常
    public var duration: CFTimeInterval = 1.0
    
    /// 动画等待执行时间
    public var delay: CFTimeInterval = 1.4
    
    /// 需要添加动画的父视图
    public var sourceView: UIView?
    
    /// 动画画布
    public var shelterView: UIView?
    
    // MARK: - Public methods.
    
    public func beginAnimation() { }
}

