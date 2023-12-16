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

    let modalSplashScreen: UIView = {
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

        if controller != self {
            doShowSplashScreen(screen: SplashScreen.shared.modalSplashScreen)
        }

        /// Force dismiss the modal before presenting the splash screen - not ideal.
        /*
        guard controller == self else {
            controller.dismiss(animated: false) {
                showSplashScrenCallback()
            }
            return
        }
         */

        doShowSplashScreen(screen: SplashScreen.shared.splashScreen)
    }

    private func doShowSplashScreen(screen: UIView) {
        screen.frame = view.frame
        view.addSubview(screen)
        view.bringSubviewToFront(screen)
        view.isHidden = false
    }

    @MainActor func hideSplashScreen() {
        SplashScreen.shared.splashScreen.removeFromSuperview()
        SplashScreen.shared.modalSplashScreen.removeFromSuperview()
    }
}

