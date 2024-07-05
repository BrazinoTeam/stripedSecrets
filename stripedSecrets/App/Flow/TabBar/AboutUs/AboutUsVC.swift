//
//  AboutUsVC.swift


import Foundation
import UIKit

class AboutUsVC: UIViewController {
    
    
    private var contentView: AboutUsView {
        view as? AboutUsView ?? AboutUsView()
    }
    
    override func loadView() {
        view = AboutUsView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

