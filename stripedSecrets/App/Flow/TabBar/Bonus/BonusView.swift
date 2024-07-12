//
//  BonusView.swift

import Foundation
import UIKit
import SnapKit

class BonusView: UIView {
    
    private (set) var bonusView: UIView = {
        let view = UIView()
        return view
    }()
    
    private (set) var bgImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .bgOther
        return imageView
    }()
    
    private (set) var contScoreView: UIView = {
        let view = UIView()
        view.backgroundColor = .cDarkRed
        view.layer.borderColor = UIColor.cLightYellow.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 26
        view.layer.shadowColor = UIColor.cLightYellow.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 8
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        return view
    }()
    
    private (set) var imgPoints: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .imgPoints
        return imageView
    }()
    
    private (set) var scoreLabel: UILabel = {
        let label = UILabel.createLabel(withText: "\(UserDef.shared.scorePoints)", font: .customFont(font: .joti, style: .regular, size: 20), textColor: .white, paragraphSpacing: 1, lineHeightMultiple: 1)
        return label
    }()
    
    private (set) var titleLabel: UILabel = {
        let label = UILabel.createLabel(withText: "Daily Bonus", font: .customFont(font: .joti, style: .regular, size: 28), textColor: .cLightYellow, paragraphSpacing: 1, lineHeightMultiple: 1)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private (set) var buttonImages: [UIImage] = [
           .imgBonusCart01, .imgBonusCart02, .imgBonusCart03,
           .imgBonusCart04, .imgBonusCart05, .imgBonusCart06,
           .imgBonusCart07, .imgBonusCart08, .imgBonusCart09
       ]
       
    
    private(set) var buttons: [UIButton] = {
        var buttons = [UIButton]()
        for i in 0..<9 {
            let button = UIButton(type: .custom)
            button.tag = i
            buttons.append(button)
        }
        return buttons
    }()
    
    private(set) lazy var btnBonus: UIButton = {
        let button = UIButton()
        button.configureButton(withTitle: "Get Bonus", font: .customFont(font: .joti, style: .regular, size: 24), titleColor: .cDarkRed, normalImage: .btnActivityLocked, highlightedImage: .btnActivityLocked)
        button.layer.shadowColor = UIColor.cDarkRed.withAlphaComponent(0.4).cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 2
        button.layer.shadowOffset = CGSize(width: 2, height: 4)
        button.isEnabled = false
        return button
    }()
    
    private (set) var timerView: UIView = {
        let view = UIView()
        view.isHidden = true
        return view
    }()
    
    private (set) var otherBgImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .bgOther
        return imageView
    }()
    
    private (set) var otherContScoreView: UIView = {
        let view = UIView()
        view.backgroundColor = .cDarkRed
        view.layer.borderColor = UIColor.cLightYellow.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 26
        view.layer.shadowColor = UIColor.cLightYellow.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 8
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        return view
    }()
    
    private (set) var otherImgPoints: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .imgPoints
        return imageView
    }()
    
    private (set) var otherScoreLabel: UILabel = {
        let label = UILabel.createLabel(withText: "\(UserDef.shared.scorePoints)", font: .customFont(font: .joti, style: .regular, size: 20), textColor: .white, paragraphSpacing: 1, lineHeightMultiple: 1)
        return label
    }()
    
    private (set) var otherTitleLabel: UILabel = {
        let label = UILabel.createLabel(withText: "Daily Bonus", font: .customFont(font: .joti, style: .regular, size: 28), textColor: .cLightYellow, paragraphSpacing: 1, lineHeightMultiple: 1)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private (set) var otherSubTitleLabel: UILabel = {
        let label = UILabel.createLabel(withText: "The next bonus will be available through:", font: .customFont(font: .sofia, style: .light, size: 14), textColor: .cLightYellow, paragraphSpacing: 1, lineHeightMultiple: 1)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private (set) var otherCountLabel: UILabel = {
        let label = UILabel.createLabel(withText: "", font: .customFont(font: .joti, style: .regular, size: 64), textColor: .cLightYellow, paragraphSpacing: 1, lineHeightMultiple: 1)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private (set) var otherImgTiger: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .imgTigerModal
        return imageView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(bonusView)
        bonusView.addSubview(bgImage)
        bonusView.addSubview(contScoreView)
        bonusView.addSubview(titleLabel)
        buttons.forEach { bonusView.addSubview($0) }
        bonusView.addSubview(btnBonus)
        contScoreView.addSubview(imgPoints)
        contScoreView.addSubview(scoreLabel)
        for button in buttons {
                    if button.tag < buttonImages.count {
                        button.setImage(buttonImages[button.tag], for: .normal)
                    }
                }
        
        addSubview(timerView)
        [otherBgImage, otherContScoreView, otherTitleLabel, otherSubTitleLabel, otherCountLabel, otherImgTiger] .forEach(timerView.addSubview(_:))
        otherContScoreView.addSubview(otherImgPoints)
        otherContScoreView.addSubview(otherScoreLabel)
    }
    
    private func setupConstraints() {
        
        bonusView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        bgImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contScoreView.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(140)
            make.top.equalToSuperview().offset(60.autoSize)
            make.right.equalToSuperview().offset(-20)
        }
        
        imgPoints.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
        }
        
        scoreLabel.snp.makeConstraints { make in
            make.centerY.equalTo(imgPoints)
            make.left.equalTo(imgPoints.snp.right).offset(20)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(contScoreView.snp.bottom).offset(40.autoSize)
        }
        
        let buttonWidth = 112.autoSize
        let buttonHeight = 112.autoSize
        let spacing = 8
        let heightSpacing = 16
        
        for (index, button) in buttons.enumerated() {
            let row = index / 3
            let column = index % 3
            button.snp.makeConstraints { make in
                make.width.equalTo(buttonWidth)
                make.height.equalTo(buttonHeight)
                make.top.equalTo(titleLabel.snp.bottom).offset(36 + (row * (Int(buttonHeight) + heightSpacing)))
                make.centerX.equalToSuperview().offset((Int(buttonWidth) + spacing) * (column - 1))
            }
        }
        
        btnBonus.snp.makeConstraints { make in
            make.top.equalTo(buttons.last!.snp.bottom).offset(36.autoSize)
            make.centerX.equalToSuperview()
            make.width.equalTo(360.autoSize)
            make.height.equalTo(44)
        }
        
        timerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        otherBgImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        otherContScoreView.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(140)
            make.top.equalToSuperview().offset(60)
            make.right.equalToSuperview().offset(-20)
        }
        
        otherImgPoints.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
        }
        
        otherScoreLabel.snp.makeConstraints { make in
            make.centerY.equalTo(otherImgPoints)
            make.left.equalTo(otherImgPoints.snp.right).offset(20)
        }
        
        otherTitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(contScoreView.snp.bottom).offset(40.autoSize)
        }
        
        otherSubTitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(otherTitleLabel.snp.bottom).offset(4.autoSize)
        }
        
        otherCountLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(otherSubTitleLabel.snp.bottom).offset(36.autoSize)
            make.height.equalTo(50)
        }
        
        otherImgTiger.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(otherCountLabel.snp.bottom).offset(36.autoSize)
            make.width.equalTo(260.autoSize)
            make.height.equalTo(350.autoSize)
        }
    }
}
