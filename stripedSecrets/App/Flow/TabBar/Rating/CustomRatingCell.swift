//
//  CustomRatingCell.swift

import UIKit
import SnapKit

class CustomRatingCell: UITableViewCell {
    
    static let reuseId = String(describing: CustomRatingCell.self)
    
    private(set) lazy var firstContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    private(set) lazy var secondContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    private(set) lazy var thirdContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    private(set) lazy var customImageView1: UIImageView = {
        let iv = UIImageView()
        iv.image = .imgMedalOne
        iv.contentMode = .scaleAspectFill
        iv.layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
        iv.layer.shadowOpacity = 1
        iv.layer.shadowRadius = 10
        iv.layer.shadowOffset = CGSize(width: 0, height: 4)
        return iv
    }()
    
    private(set) lazy var customImageScore1: UIImageView = {
        let iv = UIImageView()
        iv.image = .imgPoints
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    private(set) lazy var cutomUserImg1: UIImageView = {
        let iv = UIImageView()
        iv.image = .imgDefUser
        iv.contentMode = .scaleAspectFill
        iv.layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
        iv.layer.shadowOpacity = 1
        iv.layer.shadowRadius = 10
        iv.layer.shadowOffset = CGSize(width: 0, height: 4)
        return iv
    }()
    
    private(set) lazy var customImageView2: UIImageView = {
        let iv = UIImageView()
        iv.image = .imgMedalTwo
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    private(set) lazy var customImageScore2: UIImageView = {
        let iv = UIImageView()
        iv.image = .imgPoints
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    private(set) lazy var cutomUserImg2: UIImageView = {
        let iv = UIImageView()
        iv.image = .imgDefUser
        iv.contentMode = .scaleAspectFill
        iv.layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
        iv.layer.shadowOpacity = 1
        iv.layer.shadowRadius = 10
        iv.layer.shadowOffset = CGSize(width: 0, height: 4)
        return iv
    }()
    
    private(set) lazy var customImageView3: UIImageView = {
        let iv = UIImageView()
        iv.image = .imgMedalThree
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    private(set) lazy var customImageScore3: UIImageView = {
        let iv = UIImageView()
        iv.image = .imgPoints
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    private(set) lazy var cutomUserImg3: UIImageView = {
        let iv = UIImageView()
        iv.image = .imgDefUser
        iv.contentMode = .scaleAspectFill
        iv.layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
        iv.layer.shadowOpacity = 1
        iv.layer.shadowRadius = 10
        iv.layer.shadowOffset = CGSize(width: 0, height: 4)
        return iv
    }()
    
    private(set) lazy var firstLabel1: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .cLightYellow
        label.font = .customFont(font: .sofia, style: .black, size: 16)
        return label
    }()
    
    private(set) lazy var firstLabel2: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .cLightYellow
        label.font = .customFont(font: .sofia, style: .black, size: 16)
        return label
    }()
    
    private(set) lazy var firstLabel3: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .cLightYellow
        label.font = .customFont(font: .sofia, style: .black, size: 16)
        return label
    }()
    
    private(set) lazy var secondLabel1: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = .customFont(font: .joti, style: .regular, size: 20)
        return label
    }()
    
    private(set) lazy var secondLabel2: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = .customFont(font: .joti, style: .regular, size: 20)
        return label
    }()
    
    private(set) lazy var secondLabel3: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = .customFont(font: .joti, style: .regular, size: 20)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .clear
        selectionStyle = .none
        contentView.addSubview(firstContainer)
        contentView.addSubview(secondContainer)
        contentView.addSubview(thirdContainer)
        
        firstContainer.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(-16)
            make.centerX.equalToSuperview()
            make.width.equalTo(117)
            make.height.equalTo(274)
        }
        
        secondContainer.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.right.equalTo(firstContainer.snp.left).offset(-20)
            make.width.equalTo(100.autoSize)
            make.height.equalTo(253.autoSize)
        }
        
        thirdContainer.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalTo(firstContainer.snp.right).offset(20)
            make.width.equalTo(100.autoSize)
            make.height.equalTo(253.autoSize)
        }
        
        setupContainer(firstContainer, imageView: customImageView1, imageUser: cutomUserImg1, imageScore: customImageScore1, firstLabel: firstLabel1, secondLabel: secondLabel1, isFirstContainer: true)
        setupContainer(secondContainer, imageView: customImageView2, imageUser: cutomUserImg2, imageScore: customImageScore2, firstLabel: firstLabel2, secondLabel: secondLabel2, isFirstContainer: false)
        setupContainer(thirdContainer, imageView: customImageView3, imageUser: cutomUserImg3, imageScore: customImageScore3, firstLabel: firstLabel3, secondLabel: secondLabel3, isFirstContainer: false)
    }
    
    private func setupContainer(_ container: UIView, imageView: UIImageView, imageUser: UIImageView, imageScore: UIImageView, firstLabel: UILabel, secondLabel: UILabel, isFirstContainer: Bool) {
        container.addSubview(imageView)
        container.addSubview(imageUser)
        container.addSubview(firstLabel)
        container.addSubview(imageScore)
        container.addSubview(secondLabel)
        
        if isFirstContainer {
            imageView.snp.makeConstraints { make in
                make.top.equalToSuperview()
                make.left.right.equalToSuperview()
                make.height.equalTo(140)
                make.width.equalTo(117)
            }
        } else {
            imageView.snp.makeConstraints { make in
                make.top.equalToSuperview()
                make.left.right.equalToSuperview()
                make.height.equalTo(120)
                make.width.equalTo(100)
            }
        }
        
        imageUser.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(4)
            make.centerX.equalTo(imageView)
            make.size.equalTo(64)
        }
        
        firstLabel.snp.makeConstraints { make in
            make.top.equalTo(imageUser.snp.bottom).offset(8)
            make.centerX.equalTo(imageUser)
        }
        
        imageScore.snp.makeConstraints { make in
            make.top.equalTo(firstLabel.snp.bottom).offset(12)
            make.right.equalToSuperview()
            make.size.equalTo(34)
        }
        
        secondLabel.snp.makeConstraints { make in
            make.centerY.equalTo(imageScore)
            make.right.equalTo(imageScore.snp.left).offset(-8)
        }
    }
    
    func configure(with users: [User]) {
        guard users.count >= 3 else { return }
        print("Configuring cell with users: \(users)") // Debug print to check users in cell

        firstLabel1.text = users[0].name == nil ? "USER# \(users[0].id ?? 0)" : users[0].name
        firstLabel2.text = users[1].name == nil ? "USER# \(users[1].id ?? 0)" : users[1].name
        firstLabel3.text = users[2].name == nil ? "USER# \(users[2].id ?? 0)" : users[2].name

        secondLabel1.text = "\(users[0].balance ?? 0)"
        secondLabel2.text = "\(users[1].balance ?? 0)"
        secondLabel3.text = "\(users[2].balance ?? 0)"
    }
}
