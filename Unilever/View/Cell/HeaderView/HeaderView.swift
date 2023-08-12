//
//  HeaderView.swift
//  Unilever
//
//  Created by Abdulbosid Jalilov on 23/05/23.
//

import UIKit
import SnapKit

class HeaderView: UICollectionReusableView {
    static let identifier = "HeaderView"
    
    var productImages = ["soap", "toothpaste"]
    
    //MARK: - Scroll View
    
    private let scrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.backgroundColor = .red
        return scrollView
    }()
    
    //MARK: - Products Image View
    
    private let productsImage: UIImageView = {
       let image = UIImageView()
        image.backgroundColor = .blue
        return image
    }()
    
    //MARK: - Page Control
    private let pageControl: UIPageControl = {
       let pageControl = UIPageControl()
        pageControl.numberOfPages = 5
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .gray
        pageControl.backgroundColor = #colorLiteral(red: 0.9616631866, green: 0.9566976428, blue: 0.9782937169, alpha: 1)
        return pageControl
    }()
    
    //MARK: - CollectionView
    
    private let collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = #colorLiteral(red: 0.9616631866, green: 0.9566976428, blue: 0.9782937169, alpha: 1)
        collectionView.register(HeaderCollectionViewCell.self, forCellWithReuseIdentifier: HeaderCollectionViewCell.identifier)
        return collectionView
    }()
    
    let viewModel = ViewModel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func initView(){
        
        self.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(self.snp.height).multipliedBy(0.65)
        }
        
        if scrollView.subviews.count == 2 {
            configureScrollView()
        }
        
        self.addSubview(pageControl)
        pageControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(scrollView.snp.bottom).offset(5)
            make.width.equalTo(self.snp.width).multipliedBy(0.4)
            make.height.equalTo(self.snp.height).multipliedBy(0.08)
        }
        
        self.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(pageControl.snp.bottom).offset(10)
            make.width.equalToSuperview()
            make.height.equalTo(self.snp.height).multipliedBy(0.2)
        }
    }
    
    private func configureScrollView(){
        scrollView.contentSize = CGSize(width: self.frame.size.width, height: scrollView.frame.size.height)
        scrollView.isPagingEnabled = true
        let colors: [UIColor] = [
            .systemRed,
            .blue,
            .brown,
            .green
        ]
        for x in 0..<5 {
            
            let pages = UIView(frame: CGRect(x: CGFloat(x) * self.frame.size.width, y: 0, width: self.frame.size.width, height: scrollView.frame.size.height))
            pages.backgroundColor = colors[x]
            scrollView.addSubview(pages)
        }
    }
    
    
}

extension HeaderView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getCategoriesCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeaderCollectionViewCell.identifier, for: indexPath) as! HeaderCollectionViewCell
        cell.layer.borderWidth = 2
        cell.layer.borderColor = #colorLiteral(red: 0.06433682889, green: 0.05462097377, blue: 0.609393239, alpha: 1)
        cell.layer.cornerRadius = 20
        cell.backgroundColor = .systemBackground
        cell.updateUI(with: viewModel.getCategoriesData(index: indexPath.row))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.item {
        case 0:
            return CGSize(width: (self.frame.width) / 4, height: (self.frame.height) / 7)
        case 1:
            return CGSize(width: (self.frame.width) / 2, height: (self.frame.height) / 7)
        case 2:
            return CGSize(width: (self.frame.width) / 3, height: (self.frame.height) / 7)
        default:
            return CGSize(width: (self.frame.width) / 2, height: (self.frame.height) / 7)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 0, right: 5)
    }
}
