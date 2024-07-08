//
//  HomeQuizVC.swift

import Foundation
import UIKit

class HomeQuizVC: UIViewController {
    
    
    private var contentView: HomeQuizView {
        view as? HomeQuizView ?? HomeQuizView()
    }
    
//    private var tigers: [AirplaneModel.Airplane] = []
    private var currentQuestionIndex = 0
//    private var variants: [AirplaneModel.Airplane.Quiz.Question.Variant] = []
    private var selectedIndexPath: IndexPath? {
        didSet {
//            updateAnswerButtonState()
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    private func tappedButtons() {
        contentView.btnBack.addTarget(self, action: #selector(goBack), for: .touchUpInside)

    }
    
    @objc private func goBack() {
        navigationController?.popViewController(animated: true)
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
}
