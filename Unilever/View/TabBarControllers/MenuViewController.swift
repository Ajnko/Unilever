//
//  MenuViewController.swift
//  Unilever
//
//  Created by Abdulbosid Jalilov on 16/05/23.
//

import UIKit
import SnapKit

class MenuViewController: UIViewController {
    
    let menuTableView: UITableView = {
       let tableview = UITableView()
        tableview.rowHeight = 50
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Menu"
        initView()
    }
    
    func initView(){
        view.addSubview(menuTableView)
        menuTableView.delegate = self
        menuTableView.dataSource = self
        menuTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        //MARK: - HeaderView for TableView
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 200))
        header.backgroundColor = .systemBackground
        menuTableView.tableHeaderView = header
        
        
    }

}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.tintColor = .black
        cell.textLabel?.text = "home"
        cell.imageView?.image = UIImage(systemName: "house")
        return cell
    }

}
