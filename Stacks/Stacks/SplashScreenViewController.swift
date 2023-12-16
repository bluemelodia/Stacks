//
//  SplashScreenViewController.swift
//  Stacks
//
//  Created by Guac on 12/16/23.
//

import Foundation
import UIKit

class SplashScreenViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
    }

    func viewWillAppear() {
        modalPresentationStyle = .fullScreen
    }
}
