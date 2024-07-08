//
//  HomeView.swift

import Foundation
import UIKit
import SnapKit

class HomeView: UIView {
    
    
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
    
    private(set) lazy var leftBtn: UIButton = {
        let button = UIButton()
        button.setImage(.btnLeft, for: .normal)
        button.setImage(.btnLeft, for: .highlighted)
        return button
    }()
 
    private(set) lazy var rightBtn: UIButton = {
        let button = UIButton()
        button.setImage(.btnRight, for: .normal)
        button.setImage(.btnRight, for: .highlighted)
        return button
    }()

    private(set) lazy var collectionView: UICollectionView = {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.backgroundColor = .clear
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        return collectionView
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

        [bgImage, contScoreView, collectionView, leftBtn, rightBtn] .forEach(addSubview(_:))
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
        
        collectionView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(50)
            make.top.equalTo(contScoreView.snp.bottom).offset(20)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-120)
        }
        
        leftBtn.snp.makeConstraints { make in
            make.centerY.equalTo(collectionView)
            make.right.equalTo(collectionView.snp.left).offset(-16)
        }
        
        rightBtn.snp.makeConstraints { make in
            make.centerY.equalTo(collectionView)
            make.left.equalTo(collectionView.snp.right).offset(16)
        }
    }
    
    func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .groupPaging
            return section
        }
        return layout
    }
}

