//
//  ProfileVC.swift

import Foundation
import UIKit

class ProfileVC: UIViewController {
    
    
    private var contentView: ProfileView {
        view as? ProfileView ?? ProfileView()
    }
    
    override func loadView() {
        view = ProfileView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureLabel()
    }
    
    private func configureLabel() {
        contentView.scoreLabel.text = "\(UserDef.shared.scorePoints)"
    }
    
}

