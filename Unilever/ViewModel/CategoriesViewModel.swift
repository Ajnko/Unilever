//
//  CategoriesViewModel.swift
//  Unilever
//
//  Created by Abdulbosid Jalilov on 05/07/23.
//

import Foundation

class CategoriesViewModel {
    let categoriesData = DataCategories.data
    let productData = ProductData.data
    
    func getDataCount() -> Int {
        return categoriesData.count
    }
    
    func getProductCount() -> Int {
        return productData.count
    }
    
    func getData(index: Int) -> CategoriesModel {
        let categories = categoriesData[index].categories
        let result = CategoriesModel(categories: categories)
        
        return result
    }
    
    func getProduct(index: Int) -> ProductsModel {
        let name = productData[index].name
        let image = productData[index].image
        let price = productData[index].price
        
        let result = ProductsModel(name: name, image: image, price: price)
        return result
    }
}
