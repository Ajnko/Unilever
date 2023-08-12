//
//  Model.swift
//  Unilever
//
//  Created by Abdulbosid Jalilov on 27/05/23.
//

import Foundation

//MARK: - HomeViewController CollectionView Data
struct DataModel {
    
    let price   : String
    let image   : String
    let product : String
    
}

struct Data {
    static let data: [DataModel] = [
        
        DataModel(price: "9.0$", image: "", product: "Soap"),
        DataModel(price: "9.0$", image: "", product: "Soap"),
        DataModel(price: "9.0$", image: "", product: "Soap"),
        DataModel(price: "9.0$", image: "", product: "Soap"),
        DataModel(price: "9.0$", image: "", product: "Soap"),
        DataModel(price: "9.0$", image: "", product: "Soap"),
        DataModel(price: "9.0$", image: "", product: "Soap"),
        DataModel(price: "9.0$", image: "", product: "Soap"),
        DataModel(price: "9.0$", image: "", product: "Soap"),
        DataModel(price: "9.0$", image: "", product: "Soap"),
        DataModel(price: "9.0$", image: "", product: "Soap"),
        DataModel(price: "9.0$", image: "", product: "Soap"),
        DataModel(price: "9.0$", image: "", product: "Soap"),
        DataModel(price: "9.0$", image: "", product: "Soap"),
        DataModel(price: "9.0$", image: "", product: "Soap"),
        DataModel(price: "9.0$", image: "", product: "Soap"),
        DataModel(price: "9.0$", image: "", product: "Soap"),
        DataModel(price: "9.0$", image: "", product: "Soap")

    ]
}

//MARK: - Header Categories Model

struct CategoriesDataModel {
    let categories: String
}

struct CatgoriesData {
    static let data: [CategoriesDataModel] = [
        
        CategoriesDataModel(categories: "Offers"),
        CategoriesDataModel(categories: "Recommended"),
        CategoriesDataModel(categories: "Popular")
        
    ]
}


