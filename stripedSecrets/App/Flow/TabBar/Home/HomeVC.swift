//
//  HomeVC.swift
import Foundation
import UIKit

class HomeVC: UIViewController, HomeCellDelegate {
    
    var selectedIndexPath: IndexPath?
    private let titleLabelCell: [String] = ["Indochinese Tiger", "Bali Tiger", "Bengal Tiger", "Malayan Tiger", "Javan Tiger", "Sumartan Tiger", "Amur (Siberian) Tiger", "Mekong Tiger", "Caspian Tiger", "South China Tiger"]
    private let imageCell: [UIImage] = [.imgIndochineseTiger, .imgBaliTiger, .imgBengalTiger, .imgMalayanTiger, .imgJavanTiger, .imgSumartanTiger, .imgAmurTiger, .imgMekongTiger, .imgCaspianTiger, .imgSouthChinaTiger]
    
    private var contentView: HomeView {
        view as? HomeView ?? HomeView()
    }
    
    override func loadView() {
        view = HomeView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollection()
        tappedButtons()
    }

    private func configureCollection() {
        contentView.collectionView.delegate = self
        contentView.collectionView.dataSource = self
        contentView.collectionView.register(HomeCell.self, forCellWithReuseIdentifier: HomeCell.reuseId)
    }
    
    private func tappedButtons() {
        contentView.rightBtn.addTarget(self, action: #selector(rightBtnTapped), for: .touchUpInside)
        contentView.leftBtn.addTarget(self, action: #selector(leftBtnTapped), for: .touchUpInside)
    }
    
    @objc private func leftBtnTapped() {
        guard let currentIndexPath = contentView.collectionView.indexPathsForVisibleItems.first else {
            return
        }
        
        let previousItem = currentIndexPath.item - 1
        guard previousItem >= 0 else {
            return
        }
        
        let previousIndexPath = IndexPath(item: previousItem, section: currentIndexPath.section)
        contentView.collectionView.scrollToItem(at: previousIndexPath, at: .centeredHorizontally, animated: true)
    }

    @objc private func rightBtnTapped() {
        guard let currentIndexPath = contentView.collectionView.indexPathsForVisibleItems.first else {
            return
        }
        
        let nextItem = currentIndexPath.item + 1
        guard nextItem < titleLabelCell.count else {
            return
        }
        
        let nextIndexPath = IndexPath(item: nextItem, section: currentIndexPath.section)
        contentView.collectionView.scrollToItem(at: nextIndexPath, at: .centeredHorizontally, animated: true)
    }
    
    func infoButtonTapped(at indexPath: IndexPath) {
        let infoVC = HomeInfoVC()
        infoVC.countInfo = indexPath.item
        navigationController?.pushViewController(infoVC, animated: true)
    }
    
    func quizButtonTapped(at indexPath: IndexPath) {
        let quizVC = HomeQuizVC(selectedTigerIndex: indexPath.item)
        navigationController?.pushViewController(quizVC, animated: true)
    }
}

extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titleLabelCell.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell.reuseId, for: indexPath) as? HomeCell else {
            return UICollectionViewCell()
        }
        cell.titleLabel.text = titleLabelCell[indexPath.item]
        cell.achiImg.image = imageCell[indexPath.item]
        cell.indexPath = indexPath
        cell.delegate = self
        return cell
    }
}
