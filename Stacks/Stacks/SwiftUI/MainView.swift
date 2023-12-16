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
    @State var isPresented = false

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
                isPresented = false
            case .hideSensitiveData:
                isPresented = true
            }
        })
        .sheet(isPresented: $isPresented, content: {
            ZStack {
                Color.orange
                Text("You are in a modal sheet.")
            }
        })
        .fullScreenCover(isPresented: $isPresented, content: {
            ZStack {
                Color.yellow
                Text("This is the SwiftUI splash screen.")
            }
        })
    }
}
