//
//  CategoriesModel.swift
//  Unilever
//
//  Created by Abdulbosid Jalilov on 07/07/23.
//

import Foundation

struct CategoriesModel {
    let categories: String
}

struct DataCategories {
    static let data: [CategoriesModel] = [
    
        CategoriesModel(categories: "Cleaning"),
        CategoriesModel(categories: "One Care"),
        CategoriesModel(categories: "Second Care"),
        CategoriesModel(categories: "Cleaning"),
        CategoriesModel(categories: "Cleaning")
    ]
}

struct ProductsModel {
    let name   : String
    let image  : String
    let price  : String
}

struct ProductData {
    static let data: [ProductsModel] = [
        
        ProductsModel(name: "Colgate Galaxy", image: "toothpaste", price: "4.0$"),
        ProductsModel(name: "Colgate Galaxy", image: "toothpaste", price: "5.0$"),
        ProductsModel(name: "Colgate Galaxy", image: "toothpaste", price: "6.0$"),
        ProductsModel(name: "Colgate Galaxy", image: "toothpaste", price: "7.0$"),
        ProductsModel(name: "Colgate Galaxy", image: "toothpaste", price: "8.0$"),
        ProductsModel(name: "Colgate Galaxy", image: "toothpaste", price: "9.0$"),
        ProductsModel(name: "Colgate Galaxy", image: "toothpaste", price: "10.0$"),
        ProductsModel(name: "Colgate Galaxy", image: "toothpaste", price: "11.0$"),
        ProductsModel(name: "Colgate Galaxy", image: "toothpaste", price: "12.0$")
        
    ]
}
