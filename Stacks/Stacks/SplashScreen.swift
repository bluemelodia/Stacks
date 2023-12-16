//
//  SplashScreen.swift
//  Stacks
//
//  Created by Guac on 12/16/23.
//

import Foundation
import UIKit

public class SplashScreen {
    private init() {}

    static let shared = SplashScreen.init()

    let splashScreen: UIView = {
        let screen = UIView.init()
        screen.backgroundColor = .blue
        return screen
    }()
}

extension UIViewController {
    func showSplashScreen() {
        let window = UIApplication.shared.keyWindow
        let showSplashScrenCallback = doShowSplashScreen

        guard var controller = window?.rootViewController else { return }
        while let presentedViewController = controller.presentedViewController {
            controller = presentedViewController
        }

        guard controller == self else {
            controller.dismiss(animated: false) {
                showSplashScrenCallback()
            }
            return
        }

        doShowSplashScreen()
    }

    private func doShowSplashScreen() {
        let screen = SplashScreen.shared.splashScreen
        screen.frame = view.frame
        view.addSubview(screen)
        view.bringSubviewToFront(screen)
        view.isHidden = false
    }

    @MainActor func hideSplashScreen() {
        let screen = SplashScreen.shared.splashScreen
        screen.removeFromSuperview()
    }
}

