//
//  HomeQuizView.swift

import Foundation
import UIKit
import SnapKit

class HomeQuizView: UIView {
    
    
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
    
    private (set) var quizImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .imgQuiz
        imageView.layer.shadowColor = UIColor.cDarkRed.cgColor
        imageView.layer.shadowOpacity = 1
        imageView.layer.shadowRadius = 12
        imageView.layer.shadowOffset = CGSize(width: 2, height: 4)
        imageView.layer.cornerRadius = 12
        return imageView
    }()
    
    private var circleViews: [UIView] = []

    private let circleContainerView: UIStackView = {
           let stackView = UIStackView()
           stackView.axis = .horizontal
           stackView.distribution = .equalSpacing
           stackView.spacing = 4
           return stackView
       }()
    
    private (set) var scoreLabel: UILabel = {
        let label = UILabel.createLabel(withText: "\(UserDef.shared.scorePoints)", font: .customFont(font: .joti, style: .regular, size: 20), textColor: .white, paragraphSpacing: 1, lineHeightMultiple: 1)
        return label
    }()
    
    private (set) var titleLabel: UILabel = {
        let label = UILabel.createLabel(withText: "tiger", font: .customFont(font: .joti, style: .regular, size: 28), textColor: .cLightYellow, paragraphSpacing: 1, lineHeightMultiple: 1)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private (set) var subTitleLabel: UILabel = {
        let label = UILabel.createLabel(withText: "tiger", font: .customFont(font: .sofia, style: .black, size: 16), textColor: .white, paragraphSpacing: 1, lineHeightMultiple: 1)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private(set) var collectionView: UICollectionView = {
          let layout = UICollectionViewFlowLayout()
          layout.scrollDirection = .horizontal
          let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
          collectionView.backgroundColor = .clear
          collectionView.register(QuizOptionCell.self, forCellWithReuseIdentifier: "QuizOptionCell")
          return collectionView
      }()
    
    private(set) lazy var btnAnswer: UIButton = {
        let button = UIButton()
        button.configureButton(withTitle: "Answer", font: .customFont(font: .joti, style: .regular, size: 24), titleColor: .cDarkRed, normalImage: .btnActivity, highlightedImage: .btnActivityTapped)
        button.layer.shadowColor = UIColor.cDarkRed.withAlphaComponent(0.4).cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 2
        button.layer.shadowOffset = CGSize(width: 2, height: 4)
        return button
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
        (1...10).forEach { _ in
                   let circleView = UIView()
                   circleView.backgroundColor = .white
                   circleView.layer.cornerRadius = 2
                   circleView.snp.makeConstraints { make in
                       make.height.equalTo(8.autoSize)
                       make.width.equalTo(32.autoSize)
                   }
                   circleViews.append(circleView)
                   circleContainerView.addArrangedSubview(circleView)
               }
        [bgImage, btnBack, contScoreView, quizImage, circleContainerView, titleLabel, subTitleLabel, collectionView, btnAnswer] .forEach(addSubview(_:))
        contScoreView.addSubview(imgPoints)
        contScoreView.addSubview(scoreLabel)

    }
    
    private func setupConstraints() {
     
        bgImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        btnBack.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60.autoSize)
            make.left.equalToSuperview().offset(20)
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
        
        quizImage.snp.makeConstraints { make in
            make.top.equalTo(btnBack.snp.bottom).offset(20.autoSize)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(172.autoSize)
        }
        
        circleContainerView.snp.makeConstraints { make in
            make.top.equalTo(quizImage.snp.bottom).offset(16.autoSize)
            make.centerX.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(circleContainerView.snp.bottom).offset(16.autoSize)
            make.centerX.equalToSuperview()
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(24.autoSize)
            make.left.right.equalToSuperview().inset(20)
        }
        
        if UIScreen.main.bounds.height < 812 {
               collectionView.snp.makeConstraints { make in
                   make.top.equalTo(subTitleLabel.snp.bottom).offset(16.autoSize)
                   make.height.equalTo(212)
                   make.width.equalTo(360.autoSize)
                   make.centerX.equalToSuperview()
               }
        } else {
            collectionView.snp.makeConstraints { make in
                make.top.equalTo(subTitleLabel.snp.bottom).offset(16.autoSize)
                make.height.equalTo(296)
                make.width.equalTo(360.autoSize)
                make.centerX.equalToSuperview()
            }
        }
        
        btnAnswer.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(16.autoSize)
            make.centerX.equalToSuperview()
            make.height.equalTo(52.autoSize)
            make.width.equalTo(332.autoSize)
        }
    }
    
    func updateCircleColor(at index: Int, isCorrect: Bool, isCurrent: Bool) {
        guard index < circleViews.count else { return }
        
        if isCurrent {
            circleViews[index].backgroundColor = .clear
            circleViews[index].layer.borderWidth = 0.5
            circleViews[index].layer.borderColor = UIColor.cLightRed.cgColor
            circleViews[index].backgroundColor = .cLightYellow
            circleViews[index].layer.shadowColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1).cgColor
            circleViews[index].layer.shadowOpacity = 1
            circleViews[index].layer.shadowRadius = 12.4
            circleViews[index].layer.shadowOffset = CGSize(width: 0, height: 0)
        } else {
            circleViews[index].backgroundColor = isCorrect ? .cGreen : .cLightRed
            circleViews[index].layer.borderWidth = 0
        }
    }
}

