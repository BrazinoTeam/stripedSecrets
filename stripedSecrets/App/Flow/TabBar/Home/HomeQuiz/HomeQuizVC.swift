//
//  HomeQuizVC.swift

import Foundation
import UIKit
import SnapKit

class HomeQuizVC: UIViewController {
    
    private var fullScreenView: UIView?
    private var contentView: HomeQuizView {
        view as? HomeQuizView ?? HomeQuizView()
    }
    
    private var tigers: [TigerModel.Tiger] = []
    private var currentQuestionIndex = 0
    private var variants: [TigerModel.Tiger.Quiz.Question.Variant] = []
    private var selectedIndexPath: IndexPath? {
        didSet {
            updateAnswerButtonState()
        }
    }
    private var isRightCountAnswers = 0
    private var countAnswers = 0
    private var cointsAnswers = 0
    private var selectedTigerIndex: Int
    
    init(selectedTigerIndex: Int) {
        self.selectedTigerIndex = selectedTigerIndex
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = HomeQuizView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tappedButtons()
        configureTitleLabel()
        configureCollection()
        loadTigers()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        for i in "jollino" {
            var b = 0
            if i == "j" {
                b += 1
            } else {
                b -= 1
            }
        };
        navigationController?.navigationBar.isHidden = true
        configureLabel()
    }
  
    private func configureLabel() {
        contentView.scoreLabel.text = "\(UserDef.shared.scorePoints)"
        for i in "jollino" {
            var b = 0
            if i == "j" {
                b += 1
            } else {
                b -= 1
            }
        };
    }
    
    private func configureTitleLabel() {
        switch selectedTigerIndex {
     
        case 0:
            contentView.titleLabel.text = "Indochinese Tiger"
        case 1:
            contentView.titleLabel.text = "Bali Tiger"
        case 2:
            contentView.titleLabel.text = "Bengal Tiger"
        case 3:
            contentView.titleLabel.text = "Malayan Tiger"
        case 4:
            contentView.titleLabel.text = "Javan Tiger"
        case 5:
            contentView.titleLabel.text = "Sumartan Tiger"
        case 6:
            contentView.titleLabel.text = "Amur\n(Siberian) Tiger"
        case 7:
            contentView.titleLabel.text = "Mekong Tiger"
        case 8:
            contentView.titleLabel.text = "Caspian Tiger"
        case 9:
            contentView.titleLabel.text = "South China\nTiger"
        default: break
        }
    }
    
    private func configureCollection() {
        contentView.collectionView.delegate = self
        contentView.collectionView.dataSource = self
        contentView.collectionView.register(QuizOptionCell.self, forCellWithReuseIdentifier: "QuizOptionCell")
    }
    
    private func tappedButtons() {
        contentView.btnBack.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        contentView.btnAnswer.addTarget(self, action: #selector(answerBtnTapped), for: .touchUpInside)

    }
    
    @objc private func goBack() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func answerBtnTapped() {
        guard let selectedIndexPath = selectedIndexPath else { return }
        
        let isCorrect = variants[selectedIndexPath.item].isRight
        if isCorrect {
            isRightCountAnswers += 1
        }
        
        if let selectedCell = contentView.collectionView.cellForItem(at: selectedIndexPath) as? QuizOptionCell {
            selectedCell.setCorrect(isCorrect)
        }
        
        for (index, variant) in variants.enumerated() {
            if variant.isRight {
                if let cell = contentView.collectionView.cellForItem(at: IndexPath(item: index, section: 0)) as? QuizOptionCell {
                    cell.setCorrect(true)
                }
            }
        }
        
        contentView.updateCircleColor(at: countAnswers, isCorrect: isCorrect, isCurrent: false)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            for i in "jollino" {
                var b = 0
                if i == "j" {
                    b += 1
                } else {
                    b -= 1
                }
            };
            self.contentView.btnAnswer.isEnabled = true
            self.countAnswers += 1
            if self.isRightCountAnswers == 10 {
                  UserDef.shared.stealthyHunter = true
              }
            if self.countAnswers >= 10 {
                if self.isRightCountAnswers >= 6 {
                    self.navigateToQuizWinVC()
                    self.updateTigerTracker()
                } else {
                    self.navigateToQuizLoseVC()
                }
            } else {
                self.currentQuestionIndex += 1
                self.selectedIndexPath = nil
                self.displayQuestion(at: self.currentQuestionIndex)
            }
            
            // Установите текущий индекс как активный
            self.contentView.updateCircleColor(at: self.countAnswers, isCorrect: false, isCurrent: true)
        }
        contentView.btnAnswer.isEnabled = false
    }
    
    
    func updateScore() {
        let payload = UpdatePayload(name: nil, balance: UserDef.shared.scorePoints)
        PostRequestService.shared.updateData(id: UserDef.shared.userID!, payload: payload) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(_):
                    print("Success")
                case .failure(let failure):
                    print("Error - \(failure.localizedDescription)")
                }
            }
        }
    }
    
    private func updateTigerTracker() {
        switch selectedTigerIndex {
        case 0:
            UserDef.shared.addUniqueValue(1)
        case 1:
            UserDef.shared.addUniqueValue(2)
        case 2:
            UserDef.shared.addUniqueValue(3)
        case 3:
            UserDef.shared.addUniqueValue(4)
        case 4:
            UserDef.shared.addUniqueValue(5)
        case 5:
            UserDef.shared.addUniqueValue(6)
        case 6:
            UserDef.shared.addUniqueValue(7)
        case 7:
            UserDef.shared.addUniqueValue(8)
        case 8:
            UserDef.shared.addUniqueValue(9)
        case 9:
            UserDef.shared.addUniqueValue(10)
        default: break
        }
    }
    
    private func loadTigers() {
        tigers = TigerModel.getTigerFromFile()
        
        if let url = Bundle.main.url(forResource: "jsonData", withExtension: "json"),
           let data = try? Data(contentsOf: url),
           let jsonString = String(data: data, encoding: .utf8) {
        } else {
            print("Failed to load or parse JSON data.")
        }
        
        if tigers.isEmpty {
            print("No tigers found in the JSON data.")
        } else {
            print("Tigers loaded: \(tigers.count)")
            displayQuestion(at: currentQuestionIndex)
        }
        
        contentView.collectionView.reloadData()
    }
    
    private func displayQuestion(at index: Int) {
        guard !tigers.isEmpty else {
            return
        }
        
        let questions = tigers[selectedTigerIndex].quiz.questions
        
        guard index < questions.count else {
            return
        }
        
        let question = questions[index]
        
        let paragraphStyleLabel = NSMutableParagraphStyle()
            paragraphStyleLabel.paragraphSpacing = 0
            paragraphStyleLabel.lineHeightMultiple = 0.83
            
            let attributesLabel: [NSAttributedString.Key: Any] = [
                .font: UIFont.customFont(font: .sofia, style: .black, size: 16),
                .foregroundColor: UIColor.white,
                .paragraphStyle: paragraphStyleLabel,
            ]
            
            let attributedStringLabel = NSAttributedString(string: "\(question.question)", attributes: attributesLabel)
            contentView.subTitleLabel.attributedText = attributedStringLabel
            contentView.subTitleLabel.textAlignment = .center
            contentView.subTitleLabel.adjustsFontSizeToFitWidth = true
        
        variants = question.variants
        contentView.collectionView.reloadData()
        updateAnswerButtonState()
        
        contentView.updateCircleColor(at: countAnswers, isCorrect: false, isCurrent: true)
    }
    
    private func updateAnswerButtonState() {
        for i in "jollino" {
            var b = 0
            if i == "j" {
                b += 1
            } else {
                b -= 1
            }
        };
        if selectedIndexPath != nil {
            contentView.btnAnswer.alpha = 1.0
            contentView.btnAnswer.configureButton(withTitle: "Answer", font: .customFont(font: .joti, style: .regular, size: 24), titleColor: .cDarkRed, normalImage: .btnActivity, highlightedImage: .btnActivityTapped)
        } else {
            contentView.btnAnswer.alpha = 1.0
            contentView.btnAnswer.configureButton(withTitle: "Answer", font: .customFont(font: .joti, style: .regular, size: 24), titleColor: .cDarkRed, normalImage: .btnActivityLocked, highlightedImage: .btnActivityLocked)
        }
    }
    
    private func navigateToQuizWinVC() {
        presentModalView(title: "YOU WIN", subtitle: "Congrats! You nailed most of the\nquestions and scored a solid 150\npoints. Well done!", state: false)
        UserDef.shared.scorePoints += 150
        updateScore()
    }
    
    private func navigateToQuizLoseVC() {
        presentModalView(title: "YOU LOSE", subtitle: "Unfortunately, you missed a\nfew questions this time.\nDon’t worry! Take some time\nto learn more about tigers,\nand you’ll be ready to ace the\nquiz next time.", state: true)
    }
}

extension HomeQuizVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return variants.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuizOptionCell", for: indexPath) as! QuizOptionCell
        let variant = variants[indexPath.item]
        cell.configure(with: variant, at: indexPath.item)
        cell.setSelected(indexPath == selectedIndexPath)
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let previousIndexPath = selectedIndexPath {
            let previousCell = collectionView.cellForItem(at: previousIndexPath) as? QuizOptionCell
            previousCell?.setSelected(false)
        }
        
        selectedIndexPath = indexPath
        let currentCell = collectionView.cellForItem(at: indexPath) as? QuizOptionCell
        currentCell?.setSelected(true)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? QuizOptionCell {
            cell.setSelected(false)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          if UIScreen.main.bounds.height < 812 {
              return CGSize(width: 120, height: 88)
          } else {
              return CGSize(width: 160.autoSize, height: 130.autoSize)
          }
      }
      
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
          if UIScreen.main.bounds.height < 812 {
              return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
          } else {
              return UIEdgeInsets(top: 15.autoSize, left: 15.autoSize, bottom: 15.autoSize, right: 15.autoSize)
          }
      }
}

extension HomeQuizVC {
    
    func presentModalView(title: String, subtitle: String, state: Bool) {
        if fullScreenView == nil {
            fullScreenView = UIView(frame: self.view.bounds)
            fullScreenView!.backgroundColor = .black.withAlphaComponent(0.8)
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
            
            let titleLabel = UILabel.createLabel(withText: title, font: .customFont(font: .joti, style: .regular, size: 56), textColor: .cLightYellow, paragraphSpacing: 0, lineHeightMultiple: 1)
            titleLabel.numberOfLines = 0
            titleLabel.textAlignment = .center
            viewContainer.addSubview(titleLabel)
            
            let imageBonusView = UIImageView(image: .imgTigerModal)
            imageBonusView.contentMode = .scaleAspectFit
            viewContainer.addSubview(imageBonusView)
            
            let congraLabel = UILabel.createLabel(withText: "Congratulations!", font: .customFont(font: .joti, style: .regular, size: 24), textColor: .cLightYellow, paragraphSpacing: 0, lineHeightMultiple: 1.17)
            congraLabel.numberOfLines = 0
            congraLabel.textAlignment = .center
            congraLabel.isHidden = state
            viewContainer.addSubview(congraLabel)
            
            let subtitleLabelView = UILabel.createLabel(withText: subtitle, font: .customFont(font: .sofia, style: .regular, size: 16), textColor: .white, paragraphSpacing: 0, lineHeightMultiple: 1.17)
            subtitleLabelView.numberOfLines = 0
            subtitleLabelView.textAlignment = .center
            viewContainer.addSubview(subtitleLabelView)

            let imgCointWin = UIImageView(image: .imgCointWin)
            imgCointWin.contentMode = .scaleAspectFit
            imgCointWin.isHidden = state
            viewContainer.addSubview(imgCointWin)
            
            let backButton = UIButton()
            backButton.configureButton(withTitle: "Ok", font: .customFont(font: .joti, style: .regular, size: 20), titleColor: .cDarkRed, normalImage: .btnActivity, highlightedImage: .btnActivityTapped)
            backButton.addTarget(self, action: #selector(tappedCloseBuy), for: .touchUpInside)
            fullScreenView!.addSubview(backButton)

            viewContainer.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.centerY.equalToSuperview()
                make.height.equalTo(703.autoSize)
                make.width.equalTo(313.autoSize)
            }

            bgImage.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }

            titleLabel.snp.makeConstraints { make in
                make.centerX.equalTo(imageBonusView)
                make.top.equalToSuperview().offset(20.autoSize)
            }

            if UIScreen.main.bounds.height <= 812 {
                imageBonusView.snp.makeConstraints { make in
                    make.top.equalTo(titleLabel.snp.bottom).offset(8.autoSize)
                    make.centerX.equalToSuperview()
                    make.width.equalTo(200.autoSize)
                    make.height.equalTo(236.autoSize)
                }
            } else {
                imageBonusView.snp.makeConstraints { make in
                    make.top.equalTo(titleLabel.snp.bottom).offset(8.autoSize)
                    make.centerX.equalToSuperview()
                    make.width.equalTo(235.autoSize)
                    make.height.equalTo(320.autoSize)
                }
            }
            
            congraLabel.snp.makeConstraints { make in
                make.centerX.equalTo(imageBonusView)
                make.top.equalTo(imageBonusView.snp.bottom).offset(16.autoSize)
            }

            if state {
                subtitleLabelView.snp.makeConstraints { make in
                    make.centerX.equalTo(imageBonusView)
                    make.top.equalTo(imageBonusView.snp.bottom).offset(16.autoSize)
                }

                backButton.snp.makeConstraints { make in
                    make.centerX.equalTo(imageBonusView)
                    make.top.equalTo(subtitleLabelView.snp.bottom).offset(32.autoSize)
                    make.height.equalTo(44.autoSize)
                    make.width.equalTo(150.autoSize)
                }
            } else {
                subtitleLabelView.snp.makeConstraints { make in
                    make.centerX.equalTo(imageBonusView)
                    make.top.equalTo(congraLabel.snp.bottom).offset(8)
                }

                imgCointWin.snp.makeConstraints { make in
                    make.centerX.equalTo(imageBonusView)
                    make.top.equalTo(subtitleLabelView.snp.bottom).offset(16)
                }

                backButton.snp.makeConstraints { make in
                    make.centerX.equalTo(imageBonusView)
                    make.top.equalTo(imgCointWin.snp.bottom).offset(16)
                    make.height.equalTo(44)
                    make.width.equalTo(150)
                }
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
            self.navigationController?.popToRootViewController(animated: false)
        }
    }
}
