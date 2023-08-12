//
//  TabBarController.swift
//  Unilever
//
//  Created by Abdulbosid Jalilov on 16/05/23.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initTabBar()
        view.backgroundColor = .systemBackground
    }
    
    func initTabBar(){
        
        //MARK: - HomeViewController
        
        let home = HomeViewController()
        home.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        
        //MARK: - CategoriesViewController
        
        let categories = CategoriesViewController()
        categories.tabBarItem = UITabBarItem(title: "Categories", image: UIImage(systemName: "square.grid.2x2"), selectedImage: UIImage(systemName: "square.grid.2x2.fill"))
        
        //MARK: - ShoppingViewController
        
        let shopping = ShoppingViewController()
        shopping.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "basket"), selectedImage: UIImage(systemName: "basket.fill"))
        
        //MARK: - SearchViewController
        
        let search = SearchViewController()
        search.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass"))
        
        //MARK: - MenuViewController
        
        let menu = MenuViewController()
        menu.tabBarItem = UITabBarItem(title: "Menu", image: UIImage(systemName: "list.bullet"), selectedImage: UIImage(systemName: "list.bullet"))
        
        tabBar.tintColor = #colorLiteral(red: 0.06433682889, green: 0.05462097377, blue: 0.609393239, alpha: 1)
        tabBar.backgroundColor = .white
        tabBar.isTranslucent = false
        viewControllers = [home, categories, shopping, search, menu]
    }
    



}
