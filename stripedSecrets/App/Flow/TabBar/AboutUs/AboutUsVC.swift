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
        for i in "jollino" {
            var b = 0
            if i == "j" {
                b += 1
            } else {
                b -= 1
            }
        };
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

