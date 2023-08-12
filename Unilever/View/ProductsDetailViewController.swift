//
//  ProductsDetailViewController.swift
//  Unilever
//
//  Created by Abdulbosid Jalilov on 12/07/23.
//

import UIKit
import SnapKit

protocol AddProductToShoppingCart {
    func addProductToBasketList(product: ProductsModel)
}

class ProductsDetailViewController: UIViewController {

    var delegate: AddProductToShoppingCart?
    
    var count: Int = 2
    var indexPathNumber: Int = 0
    
    let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "Product Details"
        label.font = .boldSystemFont(ofSize: 30)
        return label
    }()
    
    let backButton: UIButton = {
       let button = UIButton()
        button.tintColor = .black
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 20
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        return button
    }()
    
    let productImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let productNameLabel: UILabel = {
       let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        return label
    }()
    
    let productPriceLabel: UILabel = {
       let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        return label
    }()
    
    let forwardProductButton: UIButton = {
       let button = UIButton()
        button.tintColor = .black
        button.setImage(UIImage(systemName: "arrow.right.circle"), for: .normal)
        return button
    }()
    
    let backProductButton: UIButton = {
       let button = UIButton()
        button.tintColor = .black
        button.setImage(UIImage(systemName: "arrow.left.circle"), for: .normal)
        return button
    }()
    
    let tableView: UITableView = {
       let tableview = UITableView()
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableview
    }()
    
    let addBasketButton: UIButton = {
       let button = UIButton()
        button.setTitle("Add to Basket", for: .normal)
        button.tintColor = #colorLiteral(red: 0.06433682889, green: 0.05462097377, blue: 0.609393239, alpha: 1)
        button.setTitleColor(#colorLiteral(red: 0.06433682889, green: 0.05462097377, blue: 0.609393239, alpha: 1), for: .normal)
        button.layer.borderWidth = 2
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.layer.borderColor = #colorLiteral(red: 0.06433682889, green: 0.05462097377, blue: 0.609393239, alpha: 1)
        button.layer.cornerRadius = 35
        return button
    }()
    
    private let viewModel = CategoriesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        view.backgroundColor = #colorLiteral(red: 0.9616631866, green: 0.9566976428, blue: 0.9782937169, alpha: 1)
    }
    

    func setUI(){
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(view.snp.centerY).multipliedBy(0.2)
        }
        
        view.addSubview(backButton)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        backButton.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel.snp.centerY)
            make.left.equalTo(view.snp.left).offset(15)
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
        
        view.addSubview(productImageView)
        productImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.width.equalTo(view.snp.width).multipliedBy(0.6)
            make.height.equalTo(view.snp.height).multipliedBy(0.3)
        }
        
        view.addSubview(productNameLabel)
        productNameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(productImageView.snp.bottom).offset(5)
        }
        
        view.addSubview(productPriceLabel)
        productPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(productNameLabel.snp.top)
            make.left.equalTo(productNameLabel.snp.right).offset(5)
        }
        
        view.addSubview(forwardProductButton)
        forwardProductButton.addTarget(self, action: #selector(forwardTapped), for: .touchUpInside)
        forwardProductButton.snp.makeConstraints { make in
            make.top.equalTo(productImageView.snp.bottom).offset(15)
            make.right.equalTo(view.snp.right).offset(-10)
            make.width.equalTo(view.snp.width).multipliedBy(0.1)
            make.height.equalTo(view.snp.height).multipliedBy(0.05)
        }
        
        view.addSubview(backProductButton)
        backProductButton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        backProductButton.snp.makeConstraints { make in
            make.top.equalTo(forwardProductButton.snp.top)
            make.left.equalTo(view.snp.left).offset(10)
            make.width.equalTo(forwardProductButton.snp.width)
            make.height.equalTo(forwardProductButton.snp.height)
        }
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.snp.makeConstraints { make in
            make.centerX.width.equalToSuperview()
            make.top.equalTo(backProductButton.snp.bottom).offset(15)
            make.height.equalTo(view.snp.height).multipliedBy(0.3)
        }
        
        view.addSubview(addBasketButton)
        addBasketButton.addTarget(self, action: #selector(addBasket), for: .touchUpInside)
        addBasketButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(tableView.snp.bottom).offset(10)
            make.width.equalTo(view.snp.width).multipliedBy(0.9)
            make.height.equalTo(view.snp.height).multipliedBy(0.08)
        }
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateUI(with: viewModel.getProduct(index: 0))
    }
    
    func updateUI(with model: ProductsModel){
        productImageView.image = UIImage(named: model.image)
        productNameLabel.text = model.name
        productPriceLabel.text = model.price
    }
    
    @objc func backButtonTapped(){
        dismiss(animated: true)
    }
    
    @objc func forwardTapped(){
        indexPathNumber += 1
        updateUI(with: viewModel.getProduct(index: indexPathNumber))
        print(indexPathNumber)
    }
    
    @objc func backTapped(){
        if indexPathNumber > 0 {
            indexPathNumber -= 1
            updateUI(with: viewModel.getProduct(index: indexPathNumber))
            print(indexPathNumber)
        }
        
        else if indexPathNumber < 0 {
            backButton.isEnabled = false
        }
    }
    
    @objc func addBasket(){
        let vc = ShoppingCartViewController()
        vc.modalPresentationStyle = .fullScreen
        delegate?.addProductToBasketList(product: viewModel.getProduct(index: indexPathNumber))
        present(vc, animated: true)
    }
    
}

//MARK: - TableView Delegate and DataSorce

extension ProductsDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title = "Product Features"
        return title
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "welcome"
        cell.imageView?.image = UIImage(systemName: "record.circle.fill")
        cell.tintColor = .black
        cell.selectionStyle = .none
        return cell
    }
    
    
}
