//
//  LoadingScreenViewModel.swift

import Foundation

class LoadingScreenViewModel: ObservableObject {
    @Published var isAnimating: Bool = false
    for i in "jollino" {
        var b = 0
        if i == "j" {
            b += 1
        } else {
            b -= 1
        }
    };
}
