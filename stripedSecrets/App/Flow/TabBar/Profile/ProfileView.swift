//
//  ProfileView.swift

import Foundation
import UIKit
import SnapKit

class ProfileView: UIView, UIScrollViewDelegate{
    
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
        let label = UILabel.createLabel(withText: "Profile", font: .customFont(font: .joti, style: .regular, size: 28), textColor: .cLightYellow, paragraphSpacing: 1, lineHeightMultiple: 1)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private (set) var containerProfile: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.cLightYellow.cgColor
        view.layer.cornerRadius = 12
        return view
    }()
    
    private (set) var imgBgCointainer: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .contModel
        return imageView
    }()
    
    private (set) var imgUserProfile: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .imgDefUser
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private (set) var titleProfileLabel: UILabel = {
        let label = UILabel.createLabel(withText: "User Name", font: .customFont(font: .joti, style: .regular, size: 28), textColor: .cLightYellow, paragraphSpacing: 1, lineHeightMultiple: 0.96)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private (set) var inGameLabel: UILabel = {
        let label = UILabel.createLabel(withText: "In game since", font: .customFont(font: .sofia, style: .light, size: 16), textColor: .white, paragraphSpacing: 1, lineHeightMultiple: 1)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private (set) var imgCalendar: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .imgCalendar
        return imageView
    }()
    
    private (set) var dateLabel: UILabel = {
        let label = UILabel.createLabel(withText: "06.20.2024", font: .customFont(font: .sofia, style: .light, size: 16), textColor: .white, paragraphSpacing: 1, lineHeightMultiple: 1)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var editNameBtn: UIButton = {
        let button = UIButton()
        button.configureButton(withTitle: "Edit name", font: .customFont(font: .joti, style: .regular, size: 20), titleColor: .cDarkRed, normalImage: .btnActivity, highlightedImage: .btnActivityTapped)
        return button
    }()
    
    private(set) lazy var editPhotoBtn: UIButton = {
        let button = UIButton()
        button.configureButton(withTitle: "Edit photo", font: .customFont(font: .joti, style: .regular, size: 20), titleColor: .cDarkRed, normalImage: .btnActivity, highlightedImage: .btnActivityTapped)
        return button
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.delegate = self
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private (set) var achiLabel: UILabel = {
        let label = UILabel.createLabel(withText: "Achievements", font: .customFont(font: .joti, style: .regular, size: 28), textColor: .cLightYellow, paragraphSpacing: 1, lineHeightMultiple: 1)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private (set) var achiOneView: CustomAchiView = {
        let view = CustomAchiView(frame: .zero, image: .imgAchivOne, titleText: "Tiger\nEnthusiast", subTitleText: "Answer 10 questions\ncorrectly")
        return view
    }()
    
    private (set) var achiTwoView: CustomAchiView = {
        let view = CustomAchiView(frame: .zero, image: .imgAchiTwo, titleText: "Tiger\nExpert", subTitleText: "Answer 50 questions\ncorrectly")
        return view
    }()
    
    private (set) var achiThreeView: CustomAchiView = {
        let view = CustomAchiView(frame: .zero, image: .imgAchiThree, titleText: "Tiger\nMaster", subTitleText: "Answer 100 questions\ncorrectly")
        return view
    }()
    
    private (set) var achiFourView: CustomAchiView = {
        let view = CustomAchiView(frame: .zero, image: .imgAchiFour, titleText: "Stealthy\nHunter", subTitleText: "Answer 10 questions\ncorrectly in a row\nwithout making a\nmistake")
        return view
    }()
    
    private (set) var achiFiveView: CustomAchiView = {
        let view = CustomAchiView(frame: .zero, image: .imgAchiFive, titleText: "Tiger\nTracker", subTitleText: "Complete quizzes on all\nten tiger subspecies")
        return view
    }()
    
    private (set) var achiSixView: CustomAchiView = {
        let view = CustomAchiView(frame: .zero, image: .imgAchiSix, titleText: "Knowledge\nHoarder", subTitleText: "Accumulate 1000 points\nin the game")
        return view
    }()
    
    private (set) var achiSevenView: CustomAchiView = {
        let view = CustomAchiView(frame: .zero, image: .imgAchiSeven, titleText: "Tiger\nGuardian", subTitleText: "Collect all achievements")
        return view
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
        saveUserName()
        displayFirstLaunchDate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
           
           [bgImage, contScoreView, scrollView, editNameBtn, editPhotoBtn] .forEach(addSubview(_:))
           contScoreView.addSubview(imgPoints)
           contScoreView.addSubview(scoreLabel)
           
           scrollView.addSubview(contentView)
           
           [titleLabel, containerProfile, achiLabel, achiOneView, achiTwoView, achiThreeView, achiFourView, achiFiveView, achiSixView, achiSevenView].forEach(contentView.addSubview(_:))
           
           [imgBgCointainer, imgUserProfile, titleProfileLabel,  imgCalendar, inGameLabel, dateLabel] .forEach(containerProfile.addSubview(_:))
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
           
           scrollView.snp.makeConstraints { make in
               make.top.equalTo(contScoreView.snp.bottom).offset(20)
               make.left.right.equalToSuperview()
               make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-36)
           }
           
           contentView.snp.makeConstraints { make in
               make.edges.equalTo(scrollView)
               make.width.equalTo(scrollView)
           }
           
           titleLabel.snp.makeConstraints { make in
               make.centerX.equalToSuperview()
               make.top.equalToSuperview().offset(20)
           }
           
           containerProfile.snp.makeConstraints { make in
               make.height.equalTo(316)
               make.width.equalTo(354)
               make.top.equalTo(titleLabel.snp.bottom).offset(24)
               make.left.right.equalToSuperview().inset(24)
           }
           
           imgBgCointainer.snp.makeConstraints { make in
               make.edges.equalToSuperview()
           }
           
           imgUserProfile.snp.makeConstraints { make in
               make.top.equalToSuperview().offset(24)
               make.centerX.equalToSuperview()
               make.size.equalTo(112)
           }
           
           titleProfileLabel.snp.makeConstraints { make in
               make.top.equalTo(imgUserProfile.snp.bottom).offset(24)
               make.centerX.equalToSuperview()
           }
           
           imgCalendar.snp.makeConstraints { make in
               make.top.equalTo(titleProfileLabel.snp.bottom).offset(4)
               make.centerX.equalToSuperview().offset(24)
           }
           
           inGameLabel.snp.makeConstraints { make in
               make.centerY.equalTo(imgCalendar)
               make.right.equalTo(imgCalendar.snp.left).offset(-12)
           }
           
           dateLabel.snp.makeConstraints { make in
               make.centerY.equalTo(imgCalendar)
               make.left.equalTo(imgCalendar.snp.right).offset(4)
           }
           
           editNameBtn.snp.makeConstraints { make in
               make.height.equalTo(44)
               make.width.equalTo(140)
               make.left.equalTo(containerProfile.snp.left).offset(20)
               make.top.equalTo(imgCalendar.snp.bottom).offset(24)
           }
           
           editPhotoBtn.snp.makeConstraints { make in
               make.height.equalTo(44)
               make.width.equalTo(140)
               make.right.equalTo(containerProfile.snp.right).offset(-20)
               make.top.equalTo(imgCalendar.snp.bottom).offset(24)
           }
           
           achiLabel.snp.makeConstraints { make in
               make.top.equalTo(containerProfile.snp.bottom).offset(24)
               make.centerX.equalToSuperview()
           }
           
           achiOneView.snp.makeConstraints { make in
               make.top.equalTo(achiLabel.snp.bottom).offset(24)
               make.centerX.equalToSuperview().offset(-92)
               make.height.equalTo(306)
               make.width.equalTo(168)
           }
           
           achiTwoView.snp.makeConstraints { make in
               make.top.equalTo(achiLabel.snp.bottom).offset(24)
               make.centerX.equalToSuperview().offset(96)
               make.height.equalTo(306)
               make.width.equalTo(168)
           }
           
           achiThreeView.snp.makeConstraints { make in
               make.top.equalTo(achiOneView.snp.bottom).offset(16)
               make.centerX.equalToSuperview().offset(-92)
               make.height.equalTo(306)
               make.width.equalTo(168)
           }
           
           achiFourView.snp.makeConstraints { make in
               make.top.equalTo(achiTwoView.snp.bottom).offset(16)
               make.centerX.equalToSuperview().offset(96)
               make.height.equalTo(306)
               make.width.equalTo(168)
           }
           
           achiFiveView.snp.makeConstraints { make in
               make.top.equalTo(achiThreeView.snp.bottom).offset(16)
               make.centerX.equalToSuperview().offset(-92)
               make.height.equalTo(306)
               make.width.equalTo(168)
           }
           
           achiSixView.snp.makeConstraints { make in
               make.top.equalTo(achiFourView.snp.bottom).offset(16)
               make.centerX.equalToSuperview().offset(96)
               make.height.equalTo(306)
               make.width.equalTo(168)
           }
           
           achiSevenView.snp.makeConstraints { make in
               make.top.equalTo(achiFiveView.snp.bottom).offset(16)
               make.centerX.equalToSuperview().offset(-92)
               make.height.equalTo(306)
               make.width.equalTo(168)
               make.bottom.equalToSuperview().offset(-16)
           }
       }
    private func saveUserName() {
        if let savedUserName = UserDef.shared.userName {
            titleProfileLabel.text = savedUserName
        }
    }
    
    private func displayFirstLaunchDate() {
        if let firstLaunchDate = UserDef.shared.firstLaunchDate {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.yyyy"
            dateLabel.text = dateFormatter.string(from: firstLaunchDate)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // Получаем границы видимой области scrollView
        let scrollViewBounds = scrollView.bounds
        
        // Получаем фреймы кнопок относительно scrollView
        let editNameBtnFrame = convert(editNameBtn.frame, to: scrollView)
        let editPhotoBtnFrame = convert(editPhotoBtn.frame, to: scrollView)
        
        // Проверяем, выходит ли верхняя часть фрейма за границы видимой области scrollView
        let editNameBtnTopVisible = scrollViewBounds.contains(CGPoint(x: editNameBtnFrame.minX, y: editNameBtnFrame.minY))
        let editPhotoBtnTopVisible = scrollViewBounds.contains(CGPoint(x: editPhotoBtnFrame.minX, y: editPhotoBtnFrame.minY))
        
        // Скрываем кнопки, если их верхняя часть выходит за границы видимой области
        editNameBtn.isHidden = !editNameBtnTopVisible
        editPhotoBtn.isHidden = !editPhotoBtnTopVisible
    }

}

