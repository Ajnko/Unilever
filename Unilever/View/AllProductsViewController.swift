//
//  AllProductsViewController.swift
//  Unilever
//
//  Created by Abdulbosid Jalilov on 08/07/23.
//

import UIKit
import SnapKit

class AllProductsViewController: UIViewController {
    
    let viewModel = CategoriesViewModel()
    
    let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "Toothpaste"
        label.font = .boldSystemFont(ofSize: 30)
        return label
    }()
    
    let backButton: UIButton = {
       let button = UIButton()
        button.tintColor = .black
        button.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        return button
    }()
    
    let productsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 10
        
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionview.backgroundColor = #colorLiteral(red: 0.9616631866, green: 0.9566976428, blue: 0.9782937169, alpha: 1)
        collectionview.register(CategoriesProductCollectionViewCell.self, forCellWithReuseIdentifier: CategoriesProductCollectionViewCell.identifier)
        return collectionview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9616631866, green: 0.9566976428, blue: 0.9782937169, alpha: 1)
        initView()
    }
    
    func initView(){
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.snp.centerY).multipliedBy(0.2)
        }
        
        view.addSubview(backButton)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        backButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.top)
            make.left.equalTo(view.snp.left).offset(15)
            make.width.equalTo(view.snp.width).multipliedBy(0.1)
            make.height.equalTo(view.snp.height).multipliedBy(0.1)
        }
        
        view.addSubview(productsCollectionView)
        productsCollectionView.delegate = self
        productsCollectionView.dataSource = self
        productsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(view.snp.height).multipliedBy(0.9)
        }
    }
    
    @objc func backButtonTapped(){
        dismiss(animated: true)
    }
    

}

extension AllProductsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getProductCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesProductCollectionViewCell.identifier, for: indexPath) as! CategoriesProductCollectionViewCell
        cell.backgroundColor = .white
        cell.updateUI(with: viewModel.getProduct(index: indexPath.item))
        return cell
    }
    
    //collectionview cell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width - 30) / 2, height: (view.frame.height) / 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}
