//
//  MainView.swift
//  Stacks
//
//  Created by Guac on 12/16/23.
//

import Foundation
import SwiftUI

public struct MainView: View {
    public var viewModel: ViewModel
    @State var isPresented = true
    @State var showSplashScreen = false

    public init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        ZStack {
            Color.red
            VStack {
                Spacer()

                Text("You are in SwiftUI.")

                Button("Show a Modal") {
                    isPresented = true
                }
                .foregroundColor(.white)

                Spacer()
            }
        }
        .onReceive(viewModel.$showDataStatus, perform: { status in
            switch(status) {
            case .show:
                showSplashScreen = false
            case .hideSensitiveData:
                showSplashScreen = true
            }
        })
        .sheet(isPresented: $isPresented, content: {
            ZStack {
                Color.orange
                Text("You are in a modal sheet.")
            }
        })
        /// This fails to cover the contents of the app if a modal is presented at the time the user backgrounds the app.
        .fullScreenCover(isPresented: $showSplashScreen, content: {
            ZStack {
                Color.yellow
                Text("This is the SwiftUI splash screen.")
            }
        })
    }
}
