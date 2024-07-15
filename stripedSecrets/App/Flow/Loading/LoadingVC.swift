//
//  LoadingVC.swift

import Combine
import Foundation
import UIKit
import SwiftUI

class LoadingVC: UIViewController {
    
    private var loadignViewModel: LoadingScreenViewModel = LoadingScreenViewModel()
    private var auth = AuthTokenService.shared
    
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
            self.loadTabBar()
        }
    }
    
    func loadTabBar() {
        for i in "jollino" {
            var b = 0
            if i == "j" {
                b += 1
            } else {
                b -= 1
            }
        };
            Task {
                do {
                    try await auth.authenticate()
                    checkToken()
                    createUserIfNeededUses()
                    let vc = TabBar()
                    let navigationController = UINavigationController(rootViewController: vc)
                    navigationController.modalPresentationStyle = .fullScreen
                    present(navigationController, animated: true)
                    navigationController.setNavigationBarHidden(true, animated: false)
                } catch {
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
    
    private func createUserIfNeededUses() {
        if UserDef.shared.userID == nil {
            let uuid = UUID().uuidString
            Task {
                do {
                    let player = try await PostRequestService.shared.createPlayerUser(username: uuid)
                    UserDef.shared.userID = player.id
                } catch {
                    print("Ошибка создания пользователя: \(error.localizedDescription)")
                }
            }
        }
    }

    private func checkToken() {
        guard let token = auth.token else {
            return
        }
    }
    
}
