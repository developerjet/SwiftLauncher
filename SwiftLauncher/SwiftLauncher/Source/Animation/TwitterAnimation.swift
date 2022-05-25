//
//  TwitterAnimation.swift
//  SwiftLauncher
//
//  Created by Jett on 2022/5/25.
//

import UIKit

class TwitterAnimation: LauncherAnimation {
    
    override func beginAnimation() {
        guard let sourceView = sourceView, let shelterView = shelterView else { return }
        
        let logoAnimation = CAKeyframeAnimation(keyPath: "bounds")
        logoAnimation.beginTime = CACurrentMediaTime() + 1
        logoAnimation.duration = duration
        logoAnimation.keyTimes = [0, 0.4, 1]
        logoAnimation.values = [NSValue(cgRect: CGRect(x: 0, y: 0, width: 100, height: 100)),
                            NSValue(cgRect: CGRect(x: 0, y: 0, width: 85, height: 85)),
                            NSValue(cgRect: CGRect(x: 0, y: 0, width: 4500, height: 4500))]
        logoAnimation.timingFunctions = [CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut),
                                         CAMediaTimingFunction(name: CAMediaTimingFunctionName.default)]
        logoAnimation.isRemovedOnCompletion = false
        logoAnimation.fillMode = CAMediaTimingFillMode.forwards
        animationLayer.add(logoAnimation, forKey: "zoomAnimation")

        let mainViewAnimation = CAKeyframeAnimation(keyPath: "transform")
        mainViewAnimation.beginTime = CACurrentMediaTime() + 1.1
        mainViewAnimation.duration = 0.6
        mainViewAnimation.keyTimes = [0, 0.5, 1]
        mainViewAnimation.values = [NSValue(caTransform3D: CATransform3DIdentity),
                                    NSValue(caTransform3D: CATransform3DScale(CATransform3DIdentity, 1.1, 1.1, 1)),
                                    NSValue(caTransform3D: CATransform3DIdentity)]
        sourceView.layer.add(mainViewAnimation, forKey: "transformAnimation")
        sourceView.layer.transform = CATransform3DIdentity

        UIView.animate(withDuration: 0.3, delay: delay, options: .curveLinear, animations: {
            shelterView.alpha = 0
        }) { (_) in
            shelterView.removeFromSuperview()
            sourceView.layer.mask = nil
        }
    }
}
