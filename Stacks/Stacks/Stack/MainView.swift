//
//  MainView.swift
//  Stacks
//
//  Created by Guac on 12/16/23.
//

import Foundation
import SwiftUI

struct MainView: View {
    @State var isPresented = false

    var body: some View {
        ZStack {
            Color.red
            VStack {
                Spacer()

                Text("You are in SwiftUI.")

                Button("Show a Modal") {
                    isPresented = true
                }

                Spacer()
            }
        }
        .sheet(isPresented: $isPresented, content: {
            ZStack {
                Color.orange
                Text("You are in a modal sheet.")
            }
        })
    }
}
