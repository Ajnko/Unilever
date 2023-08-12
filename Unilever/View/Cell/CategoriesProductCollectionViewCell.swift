//
//  CategoriesProductCollectionViewCell.swift
//  Unilever
//
//  Created by Abdulbosid Jalilov on 06/07/23.
//

import UIKit
import SnapKit

class CategoriesProductCollectionViewCell: UICollectionViewCell {
    static let identifier = "CategoriesProductCollectionViewCell"
    
    var count: Int = 0
    
    let itemsImageView: UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let itemNameLabel: UILabel = {
       let label = UILabel()
        label.text = "Colgate"
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    let addProductButton: UIButton = {
       let button = UIButton()
        button.layer.cornerRadius = 10
        button.layer.borderColor = #colorLiteral(red: 0.06433682889, green: 0.05462097377, blue: 0.609393239, alpha: 1)
        button.layer.borderWidth = 2
        button.tintColor = #colorLiteral(red: 0.06433682889, green: 0.05462097377, blue: 0.609393239, alpha: 1)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        return button
    }()
    
    let removeProductButton: UIButton = {
       let button = UIButton()
        button.layer.cornerRadius = 10
        button.layer.borderColor = #colorLiteral(red: 0.06433682889, green: 0.05462097377, blue: 0.609393239, alpha: 1)
        button.layer.borderWidth = 2
        button.tintColor = #colorLiteral(red: 0.06433682889, green: 0.05462097377, blue: 0.609393239, alpha: 1)
        button.setImage(UIImage(systemName: "minus"), for: .normal)
        return button
    }()
    
    let itemCountLabel: UILabel = {
       let label = UILabel()
        label.text = " "
        label.font = .boldSystemFont(ofSize: 15)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initView(){
        self.addSubview(itemsImageView)
        itemsImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.snp.top).offset(5)
            make.width.equalTo(self.snp.width).multipliedBy(0.8)
            make.height.equalTo(self.snp.height).multipliedBy(0.65)
        }
        
        self.addSubview(itemNameLabel)
        itemNameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(itemsImageView.snp.bottom).offset(5)
        }
        
        self.addSubview(addProductButton)
        addProductButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        addProductButton.snp.makeConstraints { make in
            make.top.equalTo(itemNameLabel.snp.bottom).offset(10)
            make.right.equalTo(self.snp.right).offset(-10)
            make.width.equalTo(self.snp.width).multipliedBy(0.2)
            make.height.equalTo(self.snp.height).multipliedBy(0.1)
        }
        
        self.addSubview(removeProductButton)
        removeProductButton.isHidden = true
        removeProductButton.addTarget(self, action: #selector(removeButtonTapped), for: .touchUpInside)
        removeProductButton.snp.makeConstraints { make in
            make.top.equalTo(addProductButton.snp.top)
            make.right.equalTo(addProductButton.snp.left).offset(-5)
            make.width.equalTo(addProductButton.snp.width)
            make.height.equalTo(addProductButton.snp.height)
        }
        
        self.addSubview(itemCountLabel)
        itemCountLabel.snp.makeConstraints { make in
            make.top.equalTo(itemNameLabel.snp.bottom).offset(12)
            make.left.equalTo(self.snp.left).offset(5)
        }
        
        
    }
    
    @objc func addButtonTapped(){
        count += 1
        itemCountLabel.text = "\(count)"
        removeProductButton.isHidden = false
    }
    
    @objc func removeButtonTapped(){
        count -= 1
        itemCountLabel.text = "\(count)"
        
        if count == 0 {
            removeProductButton.isHidden = true
            itemCountLabel.text = " "
        }
        
    }
    
    func updateUI(with model: ProductsModel) {
        self.itemsImageView.image = UIImage(named: model.image)
        self.itemNameLabel.text = model.name
    }
}
