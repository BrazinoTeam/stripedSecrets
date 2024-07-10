//
//  BonusVC.swift

import Foundation
import UIKit
import SnapKit

class BonusVC: UIViewController {
    
    private var fullScreenView: UIView?
    private var bonusPoints: [Int] = [100, 200, 300, 400, 500, 600, 1000, 1200, 1500]
    private var isTime: Bool = true

    private var contentView: BonusView {
        view as? BonusView ?? BonusView()
    }
    
    override func loadView() {
        view = BonusView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtonActions()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        goDailyScreen()
        configureLabel()
    }
    
    private func configureLabel() {
        contentView.scoreLabel.text = "\(UserDef.shared.scorePoints)"
    }
    
    
    private func setupButtonActions() {
        for button in contentView.buttons {
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        }
        contentView.btnBonus.addTarget(self, action: #selector(bonusTapped) , for: .touchUpInside)
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        for button in contentView.buttons {
            button.layer.shadowColor = UIColor.clear.cgColor
            button.layer.shadowOpacity = 0
            button.layer.shadowRadius = 0
            button.layer.shadowOffset = CGSize(width: 0, height: 0)
        }
        
        sender.layer.shadowColor = UIColor.black.withAlphaComponent(0.7).cgColor
        sender.layer.shadowOpacity = 1
        sender.layer.shadowRadius = 12
        sender.layer.shadowOffset = CGSize(width: 0, height: 16)
        print("Button \(sender.tag) tapped")
        contentView.btnBonus.configureButton(withTitle: "Get Bonus", font: .customFont(font: .joti, style: .regular, size: 24), titleColor: .cDarkRed, normalImage: .btnActivity, highlightedImage: .btnActivityTapped)
        contentView.btnBonus.isEnabled = true

    }
    
    @objc private func bonusTapped() {
        let randomBonus = bonusPoints.randomElement() ?? 0
        UserDef.shared.scorePoints += randomBonus
        presentModalView(points: randomBonus)
    }
    
    private func presentModalView(points: Int) {
        if fullScreenView == nil {
            fullScreenView = UIView(frame: self.view.bounds)
            fullScreenView!.backgroundColor = .black.withAlphaComponent(0.85)
            fullScreenView!.alpha = 0
            
            let viewContainer = UIView()
            viewContainer.backgroundColor = .clear
            viewContainer.layer.borderWidth = 1
            viewContainer.layer.borderColor = UIColor.cLightYellow.cgColor
            viewContainer.layer.cornerRadius = 16
            fullScreenView!.addSubview(viewContainer)
            
            let bgImage = UIImageView(image: .contModel)
            bgImage.contentMode = .scaleToFill
            bgImage.clipsToBounds = true
            viewContainer.addSubview(bgImage)
            
            let titleLabel = UILabel.createLabel(withText: "Congratilations!", font: .customFont(font: .joti, style: .regular, size: 28), textColor: .cLightYellow, paragraphSpacing: 0, lineHeightMultiple: 1)
            titleLabel.numberOfLines = 0
            titleLabel.textAlignment = .center
            viewContainer.addSubview(titleLabel)
            
            let imageBonusView = UIImageView(image: .imgPointsBonus)
            imageBonusView.contentMode = .scaleAspectFit
            viewContainer.addSubview(imageBonusView)
            
            let subTitleLabelView = UILabel.createLabel(withText: "You won today", font: .customFont(font: .sofia, style: .light, size: 16), textColor: .white, paragraphSpacing: 0, lineHeightMultiple: 1.17)
            subTitleLabelView.numberOfLines = 0
            subTitleLabelView.textAlignment = .center
            viewContainer.addSubview(subTitleLabelView)
            
            let pointsLabel = UILabel.createLabel(withText: "+ \(points) Points", font: .customFont(font: .joti, style: .regular, size: 20), textColor: .white, paragraphSpacing: 0, lineHeightMultiple: 1.17)
            pointsLabel.numberOfLines = 0
            pointsLabel.textAlignment = .center
            viewContainer.addSubview(pointsLabel)

            let thanksBtn = UIButton()
            thanksBtn.configureButton(withTitle: "OK", font: .customFont(font: .joti, style: .regular, size: 24), titleColor: .cDarkRed, normalImage: .btnActivity, highlightedImage: .btnActivityTapped)
            thanksBtn.addTarget(self, action: #selector(tappedCloseBuy), for: .touchUpInside)
            fullScreenView!.addSubview(thanksBtn)
            
            viewContainer.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.centerY.equalToSuperview()
                make.height.equalTo(512)
                make.width.equalTo(312)
            }
            
            bgImage.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
            
            titleLabel.snp.makeConstraints { make in
                make.centerX.equalTo(imageBonusView)
                make.top.equalToSuperview().offset(36)
            }
            
            imageBonusView.snp.makeConstraints { make in
                make.centerX.equalTo(viewContainer)
                make.top.equalTo(titleLabel.snp.bottom).offset(16)
                make.size.equalTo(248)
            }
            
            subTitleLabelView.snp.makeConstraints { make in
                make.centerX.equalTo(imageBonusView)
                make.top.equalTo(imageBonusView.snp.bottom).offset(16)
            }
            
            pointsLabel.snp.makeConstraints { make in
                make.centerX.equalTo(imageBonusView)
                make.top.equalTo(subTitleLabelView.snp.bottom).offset(8)
            }
        
            thanksBtn.snp.makeConstraints { make in
                make.top.equalTo(pointsLabel.snp.bottom).offset(16)
                make.centerX.equalToSuperview()
                make.width.equalTo(260)
                make.height.equalTo(52)
            }
            
            self.view.addSubview(fullScreenView!)
        }
        UIView.animate(withDuration: 0.5, animations: {
            self.fullScreenView!.alpha = 1
        })
    }
    
    @objc func tappedCloseBuy() {
        UserDef.shared.lastBonusDate = Date()
        UIView.animate(withDuration: 0.5, animations: {
            self.fullScreenView?.alpha = 0
        }) { _ in
            self.fullScreenView?.removeFromSuperview()
            self.fullScreenView = nil
            self.goDailyScreen()
            self.configureLabel()
        }
    }
}

extension BonusVC {
    
    func goDailyScreen() {
        if let lastVisitDate = UserDef.shared.lastBonusDate {
            let calendar = Calendar.current
            if let hours = calendar.dateComponents([.hour], from: lastVisitDate, to: Date()).hour, hours < 24 {
                isTime = true
                contentView.timerView.isHidden = false
                startCountdownTimer()
            } else {
                isTime = false
                contentView.timerView.isHidden = true
            }
        }
    }
    
    private func createAttributedString(text: String) -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.paragraphSpacing = 0
        paragraphStyle.lineHeightMultiple = 1.03
        
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.customFont(font: .joti, style: .regular, size: 64),
            .foregroundColor: UIColor.cLightYellow,
            .paragraphStyle: paragraphStyle
        ]
        
        return NSAttributedString(string: text, attributes: attributes)
    }
    
    func startCountdownTimer() {
        let calendar = Calendar.current
        
        guard let lastVisitDate = UserDef.shared.lastBonusDate,
              let targetDate = calendar.date(byAdding: .day, value: 1, to: lastVisitDate) else {
            return
        }
        
        let now = Date()
        if now < targetDate {
            let timeRemaining = calendar.dateComponents([.hour, .minute, .second], from: now, to: targetDate)
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
                guard let self = self else {
                    timer.invalidate()
                    return
                }
                
                let now = Date()
                if now >= targetDate {
                    UserDefaults.standard.set(now, forKey: "LastVisitDate")
                    self.dismiss(animated: true, completion: nil)
                    timer.invalidate()
                } else {
                    let timeRemaining = calendar.dateComponents([.hour, .minute, .second], from: now, to: targetDate)
                    let timeString = String(format: "%02d:%02d:%02d", timeRemaining.hour ?? 0, timeRemaining.minute ?? 0, timeRemaining.second ?? 0)
                    self.contentView.otherCountLabel.attributedText = self.createAttributedString(text: timeString)
                }
            }
        } else {
            UserDefaults.standard.set(now, forKey: "LastVisitDate")
        }
    }
    
}

