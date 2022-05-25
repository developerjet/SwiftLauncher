//
//  LauncherView.swift
//  SwiftLauncher
//
//  Created by Jett on 2022/5/25.
//

import UIKit

enum LauncherAnimationStyle {
    case twitter
    case other
}

// MARK: - Protocol

protocol SwiftLauncherProtocol { }

extension SwiftLauncherProtocol where Self: SwiftLauncher {
    @discardableResult
    func config(_ config:(Self)->Void) -> Self {
        config(self)
        return self
    }
}

class SwiftLauncher {
    
    // MARK: - Animation
    
    private var animation: LauncherAnimation?
    
    // MARK: - Public method.
    
    func beginAnimation() {
        guard let anima = animation else {
            return
        }
        
        anima.beginAnimation()
    }
}

// MARK: - Extension

extension SwiftLauncher: SwiftLauncherProtocol {
    @discardableResult
    func animationStyle(style: LauncherAnimationStyle) -> Self {
        switch style {
        case .twitter:
            self.animation = TwitterAnimation()
        default:
            self.animation = TwitterAnimation()
        }
        
        return self
    }
    
    @discardableResult
    func launcherLayer(layer: CALayer) -> Self {
        self.animation?.animationLayer = layer
        return self
    }
    
    @discardableResult
    func duration(time: CFTimeInterval) -> Self {
        self.animation?.duration = time
        return self
    }
    
    @discardableResult
    func delay(time: CFTimeInterval) -> Self {
        self.animation?.delay = time
        return self
    }
    
    @discardableResult
    func sourceView(view: UIView) -> Self {
        self.animation?.sourceView = view
        return self
    }

    @discardableResult
    func shelterView(view: UIView) -> Self {
        self.animation?.shelterView = view
        return self
    }
    
}
