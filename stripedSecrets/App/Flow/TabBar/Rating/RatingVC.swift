//
//  RatingVC.swift


import Foundation
import UIKit

class RatingVC: UIViewController {
    
    
    private var contentView: RatingView {
        view as? RatingView ?? RatingView()
    }
    
    override func loadView() {
        view = RatingView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

