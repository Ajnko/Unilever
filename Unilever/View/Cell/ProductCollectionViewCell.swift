//
//  ProductCollectionViewCell.swift
//  Unilever
//
//  Created by Abdulbosid Jalilov on 23/05/23.
//

import UIKit
import SnapKit

class ProductCollectionViewCell: UICollectionViewCell {
    static let identifier = "ProductCollectionViewCell"
    
    var count: Float = 0
    var itemCount: Int = 0
    
    let itemImageView: UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "soap")
        return image
    }()
    
    let itemNameLabel: UILabel = {
       let label = UILabel()
        label.text = "Item Name"
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    let priceLabel: UILabel = {
       let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        return label
    }()
    
    let itemCountLabel: UILabel = {
       let label = UILabel()
        return label
    }()
    
    let plusButton: UIButton = {
       let button = UIButton()
        button.tintColor = #colorLiteral(red: 0.06433682889, green: 0.05462097377, blue: 0.609393239, alpha: 1)
        button.layer.borderColor = #colorLiteral(red: 0.06433682889, green: 0.05462097377, blue: 0.609393239, alpha: 1)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 2
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        return button
    }()
    
    let minusButton: UIButton = {
       let button = UIButton()
        button.tintColor = #colorLiteral(red: 0.06433682889, green: 0.05462097377, blue: 0.609393239, alpha: 1)
        button.layer.borderColor = #colorLiteral(red: 0.06433682889, green: 0.05462097377, blue: 0.609393239, alpha: 1)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 2
        button.setImage(UIImage(systemName: "minus"), for: .normal)
        return button
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initView(){
        self.addSubview(itemImageView)
        itemImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.snp.top).offset(10)
            make.width.equalTo(self.snp.width).multipliedBy(0.8)
            make.height.equalTo(self.snp.height).multipliedBy(0.6)
        }
        
        self.addSubview(itemNameLabel)
        itemNameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(itemImageView.snp.bottom).offset(5)
        }
        
        self.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(itemNameLabel.snp.bottom).offset(10)
            make.left.equalTo(self.snp.left).offset(10)
        }
        
        self.addSubview(itemCountLabel)
        itemCountLabel.isHidden = true
        itemCountLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(5)
            make.left.equalTo(priceLabel.snp.left)
        }
        
        self.addSubview(plusButton)
        plusButton.isUserInteractionEnabled = true
        plusButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        plusButton.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.top)
            make.right.equalTo(self.snp.right).offset(-10)
            make.width.equalTo(self.snp.width).multipliedBy(0.3)
            make.height.equalTo(self.snp.height).multipliedBy(0.15)
        }
        
        self.addSubview(minusButton)
        minusButton.isHidden = true
        minusButton.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
        minusButton.snp.makeConstraints { make in
            make.top.equalTo(plusButton.snp.top)
            make.right.equalTo(plusButton.snp.left).offset(-5)
            make.width.equalTo(plusButton.snp.width)
            make.height.equalTo(plusButton.snp.height)
        }
    }
    
    @objc func plusButtonTapped(){
        count += 9
        itemCount += 1
        priceLabel.text = "\(count)$"
        itemCountLabel.isHidden = false
        itemCountLabel.text = "\(itemCount)"
        minusButton.isHidden = false
        
    }
    
    @objc func minusButtonTapped(){
        itemCount -= 1
        count -= 9
        priceLabel.text = "\(count)$"
        itemCountLabel.text = "\(itemCount)"
        
        if itemCount == 0 {
            minusButton.isHidden = true
            priceLabel.text = "9.0$"
        }
    }
    
    func updateUI(with model: DataModel){
        itemNameLabel.text = model.product
        priceLabel.text = model.price
    }
}
