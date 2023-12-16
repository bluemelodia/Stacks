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
    var viewModel: ViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        addLifecycleObservers()
    }

    /// Present the SwiftUI view.
    private func setupView() {
        viewModel = ViewModel()

        guard let viewModel else { return }
        mainView = MainView(viewModel: viewModel)

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

    private func addLifecycleObservers() {
        let viewModel = self.viewModel

        NotificationCenter.default.addObserver(
            forName: UIApplication.didEnterBackgroundNotification,
            object: nil,
            queue: nil) { _ in
                viewModel?.updateShowDataStatus(.hideSensitiveData)
        }

        NotificationCenter.default.addObserver(
            forName: UIApplication.willEnterForegroundNotification,
            object: nil,
            queue: nil) { _ in
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    viewModel?.updateShowDataStatus(.show)
                }
        }
    }
}

