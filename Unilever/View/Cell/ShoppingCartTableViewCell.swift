//
//  ShoppingCartTableViewCell.swift
//  Unilever
//
//  Created by Abdulbosid Jalilov on 02/08/23.
//

import UIKit
import SnapKit

class ShoppingCartTableViewCell: UITableViewCell {
    static let identifier = "identifier"
    
    
    var itemCount: Int = 0
    
    let productImae: UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .red
        return image
    }()
    
    let productNameLabel: UILabel = {
       let label = UILabel()
        label.text = "Product Name"
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    let productpriceLabel: UILabel = {
        let label = UILabel()
        label.text = "4$"
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    let productCountLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    let addProductButton: UIButton = {
       let button = UIButton()
        button.tintColor = #colorLiteral(red: 0.06433682889, green: 0.05462097377, blue: 0.609393239, alpha: 1)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        return button
    }()
    
    let moveProductButton: UIButton = {
       let button = UIButton()
        button.tintColor = #colorLiteral(red: 0.06433682889, green: 0.05462097377, blue: 0.609393239, alpha: 1)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.setImage(UIImage(systemName: "minus"), for: .normal)
        return button
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initView()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        initView()
    }
    
    func initView(){
        self.addSubview(productImae)
        productImae.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(self.snp.left).offset(10)
            make.width.equalTo(self.snp.width).multipliedBy(0.4)
            make.height.equalTo(self.snp.height).multipliedBy(0.9)
        }
        
        self.addSubview(productNameLabel)
        productNameLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(15)
            make.left.equalTo(productImae.snp.right).offset(10)
        }
        
        self.addSubview(productpriceLabel)
        productpriceLabel.snp.makeConstraints { make in
            make.top.equalTo(productNameLabel.snp.bottom).offset(10)
            make.left.equalTo(productNameLabel.snp.left)
        }
        
        self.addSubview(productCountLabel)
        productCountLabel.snp.makeConstraints { make in
            make.top.equalTo(productpriceLabel.snp.top)
            make.left.equalTo(productpriceLabel.snp.right).offset(10)
        }
        
        self.addSubview(addProductButton)
        addProductButton.addTarget(self, action: #selector(addItemButtonTapped), for: .touchUpInside)
        addProductButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalTo(self.snp.right).offset(-10)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        
        self.addSubview(moveProductButton)
        moveProductButton.addTarget(self, action: #selector(removeItemButtonTapped), for: .touchUpInside)
        moveProductButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalTo(addProductButton.snp.left).offset(-10)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
    }
    
    func updateUI(with model: ProductsModel) {
        productImae.image = UIImage(named: model.image)
        productNameLabel.text = model.name
    }
    

    
    @objc func addItemButtonTapped(){
        itemCount += 1
        productCountLabel.text = "\(itemCount)"
        print("tapped")
    }
    
    
    @objc func removeItemButtonTapped(){
        itemCount -= 1
        productCountLabel.text = "\(itemCount)"
        print("tapped")
    }
    
    

}
