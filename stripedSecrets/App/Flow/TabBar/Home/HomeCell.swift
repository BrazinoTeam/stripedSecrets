//
//  HomeCell.swift
import Foundation
import UIKit
import SnapKit

protocol HomeCellDelegate: AnyObject {
    func infoButtonTapped(at indexPath: IndexPath)
    func quizButtonTapped(at indexPath: IndexPath)
}

class HomeCell: UICollectionViewCell {
    
    static let reuseId = String(describing: HomeCell.self)
    
    weak var delegate: HomeCellDelegate?
    var indexPath: IndexPath?

    private(set) lazy var tigerView: UIView = {
        let view = UIView()
        view.backgroundColor = .cDarkRed
        view.layer.cornerRadius = 12
        return view
    }()
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel.createLabel(withText: "tiger", font: .customFont(font: .joti, style: .regular, size: 28), textColor: .cLightYellow, paragraphSpacing: 0, lineHeightMultiple: 0.96)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var achiImg: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    
    private(set) lazy var infoBtn: UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(.btnInfoHome, for: .normal)
        btn.addTarget(self, action: #selector(infoBtnTapped), for: .touchUpInside)
        return btn
    }()
    
    private(set) lazy var quizBtn: UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(.btnQuizHome, for: .normal)
        btn.addTarget(self, action: #selector(quizBtnTapped), for: .touchUpInside)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func infoBtnTapped() {
        guard let indexPath = indexPath else { return }
        delegate?.infoButtonTapped(at: indexPath)
    }
    
    @objc private func quizBtnTapped() {
        guard let indexPath = indexPath else { return }
        delegate?.quizButtonTapped(at: indexPath)
    }
    
    func setupUI() {
        backgroundColor = .clear
        contentView.addSubview(tigerView)
        contentView.backgroundColor = .clear
        [achiImg, titleLabel, infoBtn, quizBtn].forEach(tigerView.addSubview(_:))
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        achiImg.image = nil
    }
    
    private func setupConstraints() {
        tigerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.right.equalToSuperview().inset(10)
        }
        
        achiImg.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
        }

        infoBtn.snp.makeConstraints { make in
            make.top.equalTo(achiImg.snp.bottom).offset(32)
            make.left.right.equalToSuperview().inset(12)
        }
        
        quizBtn.snp.makeConstraints { make in
            make.top.equalTo(infoBtn.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(12)
        }
    }
}
