//
//  ViewModel.swift
//  Stacks
//
//  Created by Guac on 12/16/23.
//

import Foundation

public class ViewModel {
    @Published private(set) var showDataStatus: DataStatus = .show

    func updateShowDataStatus(_ status: DataStatus) {
        Task { @MainActor in
            showDataStatus = status
        }
    }
}
