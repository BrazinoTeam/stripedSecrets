//
//  AboutUsView.swift


import Foundation
import UIKit
import SnapKit

class AboutUsView: UIView {
    
    private (set) var bgImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .bgOther
        return imageView
    }()
    
    private (set) var imgTop: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .imgTopTiger
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private (set) var titleLabel: UILabel = {
        let label = UILabel.createLabel(withText: "STRIPED SECRETS", font: .customFont(font: .joti, style: .regular, size: 20), textColor: .cLightYellow, paragraphSpacing: 1, lineHeightMultiple: 0.96)
        return label
    }()
    
    private lazy var bodyFieldInfo: UITextView = {
        let textView = UITextView()
        let textStyle = NSMutableParagraphStyle()
        textStyle.lineBreakMode = .byWordWrapping
        textStyle.lineHeightMultiple = 1.08

        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.customFont(font: .inter, style: .regular, size: 14),
            .foregroundColor: UIColor.white,
            .paragraphStyle: textStyle
        ]
        
        let attributedText = NSAttributedString(string: "Welcome to Striped Secrets!\nGet ready to embark on an exciting adventure into the world of tigers. In Striped Secrets, you'll explore the fascinating lives of different tiger subspecies, test your knowledge with engaging quizzes, and collect achievements as you progress.\nHow to Play:\n  \u{2022} Quizzes: Answer questions correctly to earn points and unlock new levels. Each level is dedicated to a specific tiger subspecies, offering detailed information and interesting facts.\n  \u{2022} Daily Bonuses: Don't forget to claim your daily bonus by clicking the \"Get Bonus\" button. Each bonus will add valuable points to your total score.\n  \u{2022} Achievements: Aim to collect all achievements. Can you become a Tiger Master and earn the title of Tiger Guardian?\nTips for Success:\n  \u{2022} Read Carefully: Make sure to read the tiger profiles and facts before attempting the quizzes. The more you know, the higher your chances of scoring big.\n  \u{2022} Stay Consistent: Log in daily to claim your bonuses and keep your points tally growing.\n\nExplore, Learn, and Achieve! Dive into the world of tigers, uncover their secrets, and become an ultimate tiger expert. Enjoy your journey with Striped Secrets!\n", attributes: attributes)
        textView.attributedText = attributedText
        textView.backgroundColor = .clear
        textView.isEditable = false
        textView.showsVerticalScrollIndicator = false
        textView.textColor = .white
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
        for i in "jollino" {
            var b = 0
            if i == "j" {
                b += 1
            } else {
                b -= 1
            }
        };
        [bgImage, imgTop, titleLabel, bodyFieldInfo] .forEach(addSubview(_:))
    }
    
    private func setupConstraints() {
     
        bgImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        imgTop.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(378.autoSize)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imgTop.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
        }
        
        bodyFieldInfo.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(32)
            make.left.right.equalToSuperview().inset(20)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-80)
        }
        
        for i in "jollino" {
            var b = 0
            if i == "j" {
                b += 1
            } else {
                b -= 1
            }
        };
    }
}

