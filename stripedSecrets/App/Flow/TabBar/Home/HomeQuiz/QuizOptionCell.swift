//
//  QuizOptionCell.swift

import UIKit
import SnapKit

class QuizOptionCell: UICollectionViewCell {
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 12
        return view
      }()
    
    private(set) var optionLabel: UILabel = {
        let label = UILabel()
        label.font = .customFont(font: .sofia, style: .light, size: 12)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let imageView: UIImageView = {
          let imageView = UIImageView()
          imageView.contentMode = .scaleAspectFill
          imageView.layer.cornerRadius = 12
          imageView.clipsToBounds = true
          return imageView
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
        contentView.addSubview(containerView)
        contentView.backgroundColor = .clear
        [imageView, optionLabel].forEach(containerView.addSubview(_:))
    }
     
    private func setupConstraints() {
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
                   make.edges.equalToSuperview()
        }
        
        optionLabel.snp.makeConstraints { make in
            make.bottom.equalTo(contentView.snp.bottom).offset(-12.autoSize)
            make.left.right.bottom.equalToSuperview().inset(12.autoSize)
            make.height.equalTo(42.autoSize)
        }
    }
    
    func configure(with variant: TigerModel.Tiger.Quiz.Question.Variant, at index: Int) {
         optionLabel.text = variant.text
         switch index {
         case 0:
             imageView.image = .imgCellOne
         case 1:
             imageView.image = .imgCellThree
         case 2:
             imageView.image = .imgCellTwo
         case 3:
             imageView.image = .imgCellFour
         default:
             imageView.image = nil
         }
         contentView.backgroundColor = .clear
     }
    
    
    func configure(with variant: TigerModel.Tiger.Quiz.Question.Variant) {
           optionLabel.text = variant.text
           contentView.backgroundColor = .clear
       }
       
       func setSelected(_ selected: Bool) {
           containerView.layer.borderColor = selected ? UIColor.cLightYellow.cgColor : UIColor.clear.cgColor
           containerView.layer.borderWidth = 2
           containerView.layer.shadowColor = selected ? UIColor.cLightYellow.cgColor : UIColor.clear.cgColor
           containerView.layer.shadowOpacity = 1
           containerView.layer.shadowRadius = 7.8
           containerView.layer.shadowOffset = CGSize(width: 0, height: 0)
       }
    
       func setCorrect(_ correct: Bool) {
           containerView.layer.borderColor = correct ? UIColor.cGreen.cgColor : UIColor.cLightRed.cgColor
           containerView.layer.borderWidth = 2
           containerView.layer.shadowColor = correct ? UIColor.green.cgColor : UIColor.red.cgColor
           containerView.layer.shadowOpacity = 1
           containerView.layer.shadowRadius = 12.4
           containerView.layer.shadowOffset = CGSize(width: 0, height: 0)
       }
}
