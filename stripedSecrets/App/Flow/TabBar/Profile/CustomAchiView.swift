//
//  CustomAchiView.swift
import Foundation
import UIKit
import SnapKit

class CustomAchiView: UIView {
    
    private(set) var centerImg: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private(set) var titleLabel: UILabel = {
        let label = UILabel.createLabel(withText: "title", font: .customFont(font: .joti, style: .regular, size: 20), textColor: .cLightYellow, paragraphSpacing: 1, lineHeightMultiple: 1)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private(set) var subTitleLabel: UILabel = {
        let label = UILabel.createLabel(withText: "subtitle", font: .customFont(font: .sofia, style: .light, size: 14), textColor: .white, paragraphSpacing: 1, lineHeightMultiple: 1)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    init(frame: CGRect, image: UIImage, titleText: String, subTitleText: String) {
        super.init(frame: frame)
        centerImg.image = image
        titleLabel.text = titleText
        subTitleLabel.text = subTitleText
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .cDarkRed
        layer.borderWidth = 1
        layer.borderColor = UIColor.cLightRed.cgColor
        layer.cornerRadius = 12
        [centerImg, titleLabel, subTitleLabel].forEach(addSubview(_:))
    }
    
    private func setupConstraints() {
        centerImg.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.centerX.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(centerImg.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
    }
}

private extension NSMutableParagraphStyle {
    func apply(_ changes: (NSMutableParagraphStyle) -> Void) -> NSMutableParagraphStyle {
        changes(self)
        return self
    }
}
