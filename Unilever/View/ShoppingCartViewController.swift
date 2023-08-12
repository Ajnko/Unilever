//
//  ShoppingCartViewController.swift
//  Unilever
//
//  Created by Abdulbosid Jalilov on 01/08/23.
//

import UIKit
import SnapKit

class ShoppingCartViewController: UIViewController {
    
    let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "Shopping Cart"
        label.font = .boldSystemFont(ofSize: 30)
        return label
    }()
    
    let backButton: UIButton = {
       let button = UIButton()
        button.tintColor = .black
        button.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        return button
    }()
    
    let productListTableView: UITableView = {
       let tableview = UITableView()
        tableview.rowHeight = 105
        tableview.register(ShoppingCartTableViewCell.self, forCellReuseIdentifier: ShoppingCartTableViewCell.identifier)
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Shopping Cart"
        view.backgroundColor = #colorLiteral(red: 0.9616631866, green: 0.9566976428, blue: 0.9782937169, alpha: 1)
        setupUI()
        
    }
    
    func setupUI(){
        
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.snp.centerY).multipliedBy(0.15)
        }
        
        view.addSubview(backButton)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.snp.centerY).multipliedBy(0.1)
            make.left.equalTo(view.snp.left).offset(15)
            make.width.equalTo(view.snp.width).multipliedBy(0.1)
            make.height.equalTo(view.snp.height).multipliedBy(0.1)
        }
        
        view.addSubview(productListTableView)
        productListTableView.delegate = self
        productListTableView.dataSource = self
        productListTableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(view.snp.height).multipliedBy(0.4)
        }
    }
    
    
    
    @objc func backButtonTapped(){
        dismiss(animated: true)
    }

}

extension ShoppingCartViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingCartTableViewCell.identifier, for: indexPath) as! ShoppingCartTableViewCell
        cell.selectionStyle = .none
        return cell
    }
    
//    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//        return .delete
//    }
//
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            tableView.beginUpdates()
//            model.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//            tableView.endUpdates()
//        }
//    }
    
}

