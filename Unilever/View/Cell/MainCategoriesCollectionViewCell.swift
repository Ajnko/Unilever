//
//  MainCategoriesCollectionViewCell.swift
//  Unilever
//
//  Created by Abdulbosid Jalilov on 06/07/23.
//

import UIKit
import SnapKit

class MainCategoriesCollectionViewCell: UICollectionViewCell {
    static let identifier = "Cell"
    
    let viewModel = CategoriesViewModel()
    
    let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "Toothpaste"
        label.font = .boldSystemFont(ofSize: 30)
        return label
    }()
    
    let allProductCountLabel: UILabel = {
       let label = UILabel()
        label.text = "(0)"
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = #colorLiteral(red: 0.06433682889, green: 0.05462097377, blue: 0.609393239, alpha: 1)
        return label
    }()
    
    let seeAllButton: UIButton = {
       let button = UIButton()
        button.setTitle("See all", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.06433682889, green: 0.05462097377, blue: 0.609393239, alpha: 1), for: .normal)
        return button
    }()
    
    let goodsCollectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .horizontal
        
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionview.backgroundColor = #colorLiteral(red: 0.9616631866, green: 0.9566976428, blue: 0.9782937169, alpha: 1)
        collectionview.register(CategoriesProductCollectionViewCell.self, forCellWithReuseIdentifier: CategoriesProductCollectionViewCell.identifier)
        return collectionview
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initView(){
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(5)
            make.left.equalTo(self.snp.left).offset(5)
        }
        
        self.addSubview(allProductCountLabel)
        allProductCountLabel.text = "(\(viewModel.getProductCount()))"
        allProductCountLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(12)
            make.right.equalTo(self.snp.right).offset(-10)
        }
        
        self.addSubview(seeAllButton)
        seeAllButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.top)
            make.right.equalTo(allProductCountLabel.snp.left).offset(2)
            make.width.equalTo(self.snp.width).multipliedBy(0.2)
            make.height.equalTo(self.snp.height).multipliedBy(0.1)
        }
        
        self.addSubview(goodsCollectionView)
        goodsCollectionView.delegate = self
        goodsCollectionView.dataSource = self
        goodsCollectionView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.width.equalToSuperview()
            make.height.equalTo(self.snp.height).multipliedBy(0.85)
        }
    }
    
    @objc func showAllProducts(){
        print("tapped")
    }
    
}

extension MainCategoriesCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getProductCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesProductCollectionViewCell.identifier, for: indexPath) as! CategoriesProductCollectionViewCell
        cell.layer.cornerRadius = 10
        cell.backgroundColor = .white
        cell.updateUI(with: viewModel.getProduct(index: indexPath.item))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.frame.width) / 2, height: (self.frame.height) / 1.2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 0, right: 5)
    }
}
