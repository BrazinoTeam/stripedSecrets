//
//  RatingCell.swift



import Foundation
import UIKit
import SnapKit

class RatingCell: UITableViewCell {
    
    static let reuseId = String(describing: RatingCell.self)

    private(set) lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.font = .customFont(font: .sofia, style: .black, size: 16)
        label.textColor = .white
        return label
    }()
    
    private(set) lazy var userImage: UIImageView = {
        let iv = UIImageView()
        iv.image = .imgDefUser
        return iv
    }()
    
    private(set) lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .customFont(font: .sofia, style: .light, size: 16)
        label.textColor = .white
        return label
    }()

    private(set) lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.font = .customFont(font: .sofia, style: .black, size: 16)
        label.textColor = .cLightYellow
        return label
    }()

    private (set) var imgScore: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .imgPoints
        return imageView
    }()
    
    private(set) lazy var ratingView: UIView = {
        let view = UIView()
        view.backgroundColor = .cDarkRed
        view.layer.cornerRadius = 12
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        setUpConstraints()
    }
    
        func setupUI() {
            backgroundColor = .clear
            contentView.addSubview(ratingView)
            contentView.backgroundColor = .clear
            selectionStyle = .none
            [userImage, imgScore, nameLabel, scoreLabel, numberLabel] .forEach(ratingView.addSubview(_:))

    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        nameLabel.text = nil
        scoreLabel.text =  nil
    }
    
    private func setUpConstraints(){
        
        ratingView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(4)
            make.left.right.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().offset(-4)
            make.height.equalTo(56.autoSize)
            make.width.equalTo(354.autoSize)
        }
        
        numberLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(16)
        }
        
        userImage.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(numberLabel.snp.right).offset(12)
            make.size.equalTo(40.autoSize)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(userImage)
            make.left.equalTo(userImage.snp.right).offset(8)
        }
        
        imgScore.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-16)
            make.size.equalTo(36)
        }
        
        scoreLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(imgScore)
            make.right.equalTo(imgScore.snp.left).offset(-8)
        }
    }
}
