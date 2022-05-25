# SwiftLauncher

## Swift easy app launcher animation.


### Usage.

```Swift

    // Twitter.
    let logoLayer = CALayer()
    logoLayer.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
    logoLayer.position = sourceView.center
    logoLayer.contents = UIImage(named: "logo")?.cgImage
    sourceView.layer.mask = logoLayer

    let shelterView = UIView(frame: sourceView.frame)
    shelterView.backgroundColor = .white
    sourceView.addSubview(shelterView)

    SwiftLauncher().config { (launcher) in
        launcher.animationStyle(style: .twitter)
        launcher.launcherLayer(layer: logoLayer)
        launcher.sourceView(view: sourceView)
        launcher.shelterView(view: shelterView)
        launcher.duration(time: 1.25)
        launcher.delay(time: 1.35)
    }.beginAnimation()

```
