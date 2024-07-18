//
//  ProfileVC.swift

import Foundation
import UIKit
import SnapKit

class ProfileVC: UIViewController, UITextFieldDelegate {
    
    private let imagePicker = UIImagePickerController()
    private let memory = UserDef.shared
    private var fullScreenView: UIView?

    private var contentView: ProfileView {
        view as? ProfileView ?? ProfileView()
    }
    
    override func loadView() {
        view = ProfileView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerDelegate()
        buttonsActive()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureLabel()
        checkFotoLoad()
        achivementsCheck()
        updateAchivViews()
    }
    
    private func buttonsActive() {
        contentView.editNameBtn.addTarget(self, action: #selector(tappeUpdateName), for: .touchUpInside)
        contentView.editPhotoBtn.addTarget(self, action: #selector(goTakePhoto), for: .touchUpInside)

    }
    
    private func configureLabel() {
        contentView.scoreLabel.text = "\(UserDef.shared.scorePoints)"
        contentView.titleProfileLabel.text = "\(UserDef.shared.userName ?? "User Name")"
    }
    
    
    private func updateAchivViews() {
        contentView.achiOneView.alpha = memory.tigerEnthusiast ? 1 : 0.4
        contentView.achiTwoView.alpha = memory.tigerExpert ? 1 : 0.4
        contentView.achiThreeView.alpha = memory.tigerMaster ? 1 : 0.4
        contentView.achiFourView.alpha = memory.stealthyHunter ? 1 : 0.4
        contentView.achiFiveView.alpha = memory.tigerTracker ? 1 : 0.4
        contentView.achiSixView.alpha = memory.knowledgeHoarder ? 1 : 0.4
        contentView.achiSevenView.alpha = memory.tigerGuardian ? 1 : 0.4
    }
    
    private func achivementsCheck() {
        if memory.answerQuestions >= 10 {
            memory.tigerEnthusiast = true
        }
        if memory.answerQuestions >= 50 {
            memory.tigerExpert = true
        }
        if memory.answerQuestions >= 100 {
            memory.tigerMaster = true
        }
        if memory.scorePoints >= 1000 {
            memory.knowledgeHoarder = true
        }
    }
    
    private func pickerDelegate() {
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
    }
    
    private func checkFotoLoad() {
           if let userID = UserDef.shared.userID, let savedImage = contentView.imgUserProfile.getImageFromLocal(userID: String(userID)) {
               contentView.imgUserProfile.image = savedImage
           }
       }
    
    
    @objc func tappeUpdateName() {
        presentModalView()
    }
    
    @objc func goTakePhoto() {
        let alert = UIAlertController(title: "Pick Library", message: nil, preferredStyle: .actionSheet)
        
        let actionLibrary = UIAlertAction(title: "Photo Library", style: .default) { _ in
            self.imagePicker.sourceType = .photoLibrary
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        
        let actionCamera = UIAlertAction(title: "Camera", style: .default) { _ in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                self.imagePicker.sourceType = .camera
                self.present(self.imagePicker, animated: true, completion: nil)
            } else {
                print("Camera not available")
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(actionCamera)
        alert.addAction(actionLibrary)
        alert.addAction(cancel)
        
        present(alert, animated: true)
    }
    
    private func presentModalView() {
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
            
            let titleLabel = UILabel.createLabel(withText: "Edit Name", font: .customFont(font: .joti, style: .regular, size: 28), textColor: .cLightYellow, paragraphSpacing: 0, lineHeightMultiple: 1)
            titleLabel.numberOfLines = 0
            titleLabel.textAlignment = .center
            viewContainer.addSubview(titleLabel)
           
            let subTitleLabelView = UILabel.createLabel(withText: "What is your name", font: .customFont(font: .sofia, style: .light, size: 16), textColor: .white, paragraphSpacing: 0, lineHeightMultiple: 1.17)
            subTitleLabelView.numberOfLines = 0
            subTitleLabelView.textAlignment = .center
            viewContainer.addSubview(subTitleLabelView)
            
            let textField = UITextField()
            let font = UIFont.customFont(font: .sofia, style: .light, size: 16)
            
            let placeholderAttributes: [NSAttributedString.Key: Any] = [
                .font: font,
                .foregroundColor: UIColor.white
            ]
            
            let placeholderText = NSAttributedString(string: "Enter your name", attributes: placeholderAttributes)
            textField.attributedPlaceholder = placeholderText
            
    
            
            let textAttributes: [NSAttributedString.Key: Any] = [
                .font: font,
                .foregroundColor: UIColor.white,
            ]
            textField.font = UIFont.customFont(font: .sofia, style: .light, size: 16)
            textField.textColor = .white
            textField.backgroundColor = .black
            textField.textAlignment = .center
            textField.delegate = self
            textField.returnKeyType = .done
            textField.becomeFirstResponder()
            viewContainer.addSubview(textField)

            let thanksBtn = UIButton()
            thanksBtn.configureButton(withTitle: "OK", font: .customFont(font: .joti, style: .regular, size: 24), titleColor: .cDarkRed, normalImage: .btnActivity, highlightedImage: .btnActivityTapped)
            thanksBtn.addTarget(self, action: #selector(tappedCloseBuy), for: .touchUpInside)
            fullScreenView!.addSubview(thanksBtn)
            
            viewContainer.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.centerY.equalToSuperview().offset(-60)
                make.height.equalTo(296)
                make.width.equalTo(312)
            }
            
            bgImage.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
            
            titleLabel.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.top.equalToSuperview().offset(36)
            }
            
            subTitleLabelView.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.top.equalTo(titleLabel.snp.bottom).offset(26)
            }
            
            textField.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.top.equalTo(subTitleLabelView.snp.bottom).offset(26)
                make.height.equalTo(48)
                make.width.equalTo(260)
            }
        
            thanksBtn.snp.makeConstraints { make in
                make.top.equalTo(textField.snp.bottom).offset(32)
                make.centerX.equalToSuperview()
                make.width.equalTo(148)
                make.height.equalTo(44)
            }
            
            self.view.addSubview(fullScreenView!)
        }
        UIView.animate(withDuration: 0.5, animations: {
            self.fullScreenView!.alpha = 1
        })
    }
    
    @objc func tappedCloseBuy() {
        UIView.animate(withDuration: 0.5, animations: {
            self.fullScreenView?.alpha = 0
        }) { _ in
            self.fullScreenView?.removeFromSuperview()
            self.fullScreenView = nil
            self.contentView.titleProfileLabel.text = "\(UserDef.shared.userName ?? "User Name")"
        }
    }
    
    internal func textFieldDidEndEditing(_ textField: UITextField) {
        UserDef.shared.userName = textField.text
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print("Клавиатура спрятана")
        RatingService.shared.updateUser(userId: UserDef.shared.userID ?? 0, name: UserDef.shared.userName ?? "User# \(UserDef.shared.userID ?? 0)")
        return true
    }
}

extension ProfileVC: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            contentView.imgUserProfile.image = image
            if let userID = UserDef.shared.userID {
                contentView.imgUserProfile.saveImageToLocal(image: image, userID: String(userID))
            }
        }
        
        dismiss(animated: true, completion: nil)
    }

    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

extension ProfileVC: UINavigationControllerDelegate {
    
}

