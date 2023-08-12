//
//  HeaderCollectionViewCell.swift
//  Unilever
//
//  Created by Abdulbosid Jalilov on 29/05/23.
//

import UIKit
import SnapKit

class HeaderCollectionViewCell: UICollectionViewCell {
    static let identifier = "HeaderCollectionViewCell"
    
    
    private let categoriesLabel: UILabel = {
       let label = UILabel()
        label.text = "Offers"
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
    
    private func initView(){
        self.addSubview(categoriesLabel)
        categoriesLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    func updateUI(with model: CategoriesDataModel) {
        categoriesLabel.text = model.categories
    }
}
