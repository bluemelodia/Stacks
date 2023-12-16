//
//  ViewController.swift
//  Stacks
//
//  Created by Guac on 12/16/23.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    var mainView: MainView?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    /// Present the SwiftUI view.
    private func setupView() {
        mainView = MainView()

        let hostingController = UIHostingController(rootView: mainView)
        guard let hostingView = hostingController.view else { return }

        /// Associate the child view controller with itself. This must be done before adding the
        /// child's root view to the view hierarchy.
        addChild(hostingController)
        view.addSubview(hostingView)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            hostingView.topAnchor.constraint(equalTo: view.topAnchor),
            hostingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        hostingController.didMove(toParent: self)
    }
}

