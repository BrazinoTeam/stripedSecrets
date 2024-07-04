//
//  LoadingVC.swift

import Combine
import Foundation
import UIKit
import SwiftUI

class LoadingVC: UIViewController {
    
    private var loadignViewModel: LoadingScreenViewModel = LoadingScreenViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let loadingScreen = LoadingScreen(loadignViewModel: loadignViewModel)
        let hostingController = UIHostingController(rootView: loadingScreen)
        addChild(hostingController)
        hostingController.view.frame = self.view.frame
        self.view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        animateProgressBar()
    }
    
    func animateProgressBar() {
        DispatchQueue.main.async {
            self.loadignViewModel.isAnimating = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            self.loadTabBar()
        }
    }
    
//    func loadTabBar() {
//        
//        let vc = TabBar()
//        let navigationController = UINavigationController(rootViewController: vc)
//        navigationController.modalPresentationStyle = .fullScreen
//        present(navigationController, animated: true)
//    }
    
}
