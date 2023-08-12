//
//  CollectionViewCell.swift
//  Unilever
//
//  Created by Abdulbosid Jalilov on 05/07/23.
//

import UIKit
import SnapKit

class CollectionViewCell: UICollectionViewCell {
    static let identifier = "Cell"
    
    let sectionNameLabel: UILabel = {
       let label = UILabel()
        label.text = "Health Care"
        label.textColor = #colorLiteral(red: 0.06433682889, green: 0.05462097377, blue: 0.609393239, alpha: 1)
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
        self.addSubview(sectionNameLabel)
        sectionNameLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
}
