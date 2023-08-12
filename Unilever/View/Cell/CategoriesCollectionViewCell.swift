//
//  CategoriesCollectionViewCell.swift
//  Unilever
//
//  Created by Abdulbosid Jalilov on 08/06/23.
//

import UIKit
import SnapKit

class CategoriesCollectionViewCell: UICollectionViewCell {
    static let identifier = "CategoriesCollectionViewCell"
    
    let categoriesNameLabel: UILabel = {
       let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
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
        self.addSubview(categoriesNameLabel)
        categoriesNameLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    func updateUI(with model: CategoriesModel) {
        categoriesNameLabel.text = model.categories
    }
}
