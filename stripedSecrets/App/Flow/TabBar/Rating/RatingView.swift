//
//  RatingView.swift

import Foundation
import UIKit
import SnapKit

class RatingView: UIView {
    
    
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
        let label = UILabel.createLabel(withText: "Rating of the week", font: .customFont(font: .joti, style: .regular, size: 28), textColor: .cLightYellow, paragraphSpacing: 1, lineHeightMultiple: 0.96)
        return label
    }()
    
    private(set) lazy var ratingTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 4, right: 0)
        tableView.register(RatingCell.self, forCellReuseIdentifier: RatingCell.reuseId)
        tableView.register(CustomRatingCell.self, forCellReuseIdentifier: CustomRatingCell.reuseId)
        tableView.separatorStyle = .none
        return tableView
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

        [bgImage, contScoreView, titleLabel, ratingTableView] .forEach(addSubview(_:))
        contScoreView.addSubview(imgPoints)
        contScoreView.addSubview(scoreLabel)

    }
    
    private func setupConstraints() {
     
        bgImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
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
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(contScoreView.snp.bottom).offset(20)
        }
        
        ratingTableView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(24)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-56)
        }
    }
}

