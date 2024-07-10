//
//  TabBar.swift

import Foundation
import UIKit

final class TabBar: UITabBarController {
    
    private let profile = ProfileVC()
    private let rating = RatingVC()
    private let home = HomeVC()
    private let bonus = BonusVC()
    private let aboutUs = AboutUsVC()
    
    private lazy var btn1 = getButtonWithLabel(icon: "btnProfile", selectedIcon: "btnProfileTapped", tag: 0, title: "Profile".uppercased(), action: action)
    private lazy var btn2 = getButtonWithLabel(icon: "btnRating", selectedIcon: "btnRatingTapped", tag: 1, title: "Rating".uppercased(), action: action)
    private lazy var btn3 = getButtonWithLabel(icon: "btnHome", selectedIcon: "btnHomeTapped", tag: 2, title: "Home".uppercased(), action: action)
    private lazy var btn4 = getButtonWithLabel(icon: "btnBonus", selectedIcon: "btnBonusTapped", tag: 3, title: "Bonus".uppercased(), action: action)
    private lazy var btn5 = getButtonWithLabel(icon: "btnChapter", selectedIcon: "btnChapterTapped", tag: 4, title: "About Us".uppercased(), action: action)

    lazy var action = UIAction { [weak self] sender in
        guard
            let sender = sender.sender as? UIButton,
            let self = self
        else { return }
        
        self.updateSelectedButton(sender.tag)
        self.selectedIndex = sender.tag
    }

    private lazy var customBar: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .equalSpacing
        $0.alignment = .center
        $0.backgroundColor = .black.withAlphaComponent(0.8)
        $0.frame = CGRect(x: 0, y: view.frame.height - 128.autoSize, width: view.frame.width, height: 128.autoSize)
        $0.layer.shadowColor = UIColor.black.withAlphaComponent(0.6).cgColor
        $0.layer.shadowOpacity = 1
        $0.layer.shadowRadius = 12
        $0.layer.shadowOffset = CGSize(width: 0, height: -4)
        $0.addArrangedSubview(btn1)
        $0.addArrangedSubview(btn2)
        $0.addArrangedSubview(btn3)
        $0.addArrangedSubview(btn4)
        $0.addArrangedSubview(btn5)
        return $0
    }(UIStackView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().backgroundColor = .yellow

        profile.title = "Profile"
        rating.title = "Rating"
        home.title = "Home"
        bonus.title = "Bonus"
        aboutUs.title = "About Us"
        view.addSubview(customBar)
        tabBar.isHidden = true
        setViewControllers([profile, rating ,home, bonus, aboutUs], animated: true)
        selectedViewController = home
        updateSelectedButton(2)  // Set initial selection
    }
    
    private func getButtonWithLabel(icon: String, selectedIcon: String, tag: Int, title: String, action: UIAction) -> UIView {
        let button = UIButton(primaryAction: action)
        let image = UIImage(named: icon)?.withRenderingMode(.alwaysOriginal)
        button.setImage(image, for: .normal)
        button.tag = tag
        button.accessibilityIdentifier = icon
        button.accessibilityHint = selectedIcon
        
        let label = UILabel()
        label.text = title
        label.textAlignment = .center
        label.font = .customFont(font: .inter, style: .bold, size: 14)
        label.textColor = .white
        
        let stackView = UIStackView(arrangedSubviews: [button, label])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 4
        
        return stackView
    }
    
    private func updateSelectedButton(_ selectedIndex: Int) {
        let buttons = [btn1, btn2, btn3, btn4, btn5]
        
        for (index, stackView) in buttons.enumerated() {
            if let button = stackView.subviews.first(where: { $0 is UIButton }) as? UIButton {
                let icon = button.accessibilityIdentifier ?? ""
                let selectedIcon = button.accessibilityHint ?? ""
                
                if icon.isEmpty || selectedIcon.isEmpty {
                    print("Icon or selectedIcon is empty for button at index \(index)")
                    continue
                }
                
                if index == selectedIndex {
                    let selectedImage = UIImage(named: selectedIcon)?.withRenderingMode(.alwaysOriginal)
                    button.setImage(selectedImage, for: .normal)
                    // Add border for the selected button
                    if index == 2 { // btn3
                        button.layer.shadowColor = UIColor.cLightYellow.cgColor
                        button.layer.shadowOpacity = 1
                        button.layer.shadowRadius = 12
                        button.layer.shadowOffset = CGSize(width: 0, height: 0)
                    } else {
                        button.layer.shadowColor = UIColor.clear.cgColor
                        button.layer.shadowOpacity = 0
                        button.layer.shadowRadius = 0
                        button.layer.shadowOffset = CGSize(width: 0, height: 0)
                    }
                } else {
                    let image = UIImage(named: icon)?.withRenderingMode(.alwaysOriginal)
                    button.setImage(image, for: .normal)
                    // Remove border for non-selected buttons
                    button.layer.shadowColor = UIColor.clear.cgColor
                    button.layer.shadowOpacity = 0
                    button.layer.shadowRadius = 0
                    button.layer.shadowOffset = CGSize(width: 0, height: 0)
                }
            }
        }
    }
}
