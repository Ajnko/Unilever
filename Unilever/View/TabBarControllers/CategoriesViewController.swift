//
//  CategoriesViewController.swift
//  Unilever
//
//  Created by Abdulbosid Jalilov on 16/05/23.
//

import UIKit
import SnapKit

class CategoriesViewController: UIViewController {
    
    let collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 10
        
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionview.backgroundColor = #colorLiteral(red: 0.9616631866, green: 0.9566976428, blue: 0.9782937169, alpha: 1)
        collectionview.register(MainCategoriesCollectionViewCell.self, forCellWithReuseIdentifier: MainCategoriesCollectionViewCell.identifier)
        collectionview.register(CategoriesHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CategoriesHeaderView.identifier)
        
        return collectionview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        title = "Categories"
    }
    
    func initView(){
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    @objc func showAllProducts(){
        let vc = AllProductsViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
}

extension CategoriesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCategoriesCollectionViewCell.identifier, for: indexPath) as! MainCategoriesCollectionViewCell
        cell.backgroundColor = #colorLiteral(red: 0.9616631866, green: 0.9566976428, blue: 0.9782937169, alpha: 1)
        cell.seeAllButton.addTarget(self, action: #selector(showAllProducts), for: .touchUpInside)
        return cell
    }
    
    //header
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CategoriesHeaderView.identifier, for: indexPath)
        header.backgroundColor = #colorLiteral(red: 0.9616631866, green: 0.9566976428, blue: 0.9782937169, alpha: 1)
        return header
    }
    
    //header size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: (collectionView.frame.height) / 2.5)
    }
    
    //cell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width) - 20 / 2, height: (view.frame.height) / 2.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
}
