//
//  HomeInfoView.swift

import Foundation
import UIKit
import SnapKit

class HomeInfoView: UIView {
    
    
    private (set) var bgImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .bgOther
        return imageView
    }()
    
    private(set) lazy var btnBack: UIButton = {
        let button = UIButton()
        button.layer.shadowColor = UIColor.cLightYellow.cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 8
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.setBackgroundImage(.btnBack, for: .normal)
        button.setBackgroundImage(.btnBackTapped, for: .highlighted)
        return button
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
    
    private (set) var imgInfo: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.shadowColor = UIColor.cLightRed.cgColor
        imageView.layer.shadowOpacity = 1
        imageView.layer.shadowRadius = 32
        imageView.layer.shadowOffset = CGSize(width: 0, height: 0)
        return imageView
    }()
    
    private (set) var titleLabel: UILabel = {
        let label = UILabel.createLabel(withText: "Indochinese Tiger", font: .customFont(font: .joti, style: .regular, size: 20), textColor: .cLightYellow, paragraphSpacing: 1, lineHeightMultiple: 1)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var bodyFieldInfo: UITextView = {
        let textView = UITextView.createTextView(withText: "123", font: .customFont(font: .sofia, style: .light, size: 14), textColor: .white, paragraphSpacing: 0, lineHeightMultiple: 1.0)
        textView.backgroundColor = .clear
        textView.isEditable = false
        textView.showsVerticalScrollIndicator = false
        textView.textColor = .white
        textView.textAlignment = .left
        return textView
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
        
        [bgImage, btnBack, contScoreView, imgInfo, titleLabel, bodyFieldInfo] .forEach(addSubview(_:))
        contScoreView.addSubview(imgPoints)
        contScoreView.addSubview(scoreLabel)
        
    }
    
    private func setupConstraints() {
        
        bgImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        btnBack.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.left.equalToSuperview().offset(20)
        }
        
        contScoreView.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(140)
            make.top.equalToSuperview().offset(60)
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
        
        imgInfo.snp.makeConstraints { make in
            make.top.equalTo(btnBack.snp.bottom).offset(20)
            make.left.right.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imgInfo.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
        }
        
        bodyFieldInfo.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(24)
            make.left.right.equalToSuperview().inset(40)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-24)
        }
    }
}

