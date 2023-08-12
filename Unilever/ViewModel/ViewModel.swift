//
//  ViewModel.swift
//  Unilever
//
//  Created by Abdulbosid Jalilov on 27/05/23.
//

import Foundation

class ViewModel {
    
    let data = Data.data
    let categoriesData = CatgoriesData.data
    
    func getCategoriesCount() -> Int {
        return categoriesData.count
    }
    
    func getDataCount() -> Int {
        return data.count
    }
    
    func getProductData(index: Int) -> DataModel {
        let price = data[index].price
        let image = data[index].image
        let product = data[index].product
        
        let result = DataModel(price: price, image: image, product: product)
        
        return result
    }
    
    func getCategoriesData(index: Int) -> CategoriesDataModel {
        let categories = categoriesData[index].categories
        
        let result = CategoriesDataModel(categories: categories)
        
        return result
    }
    
    
}
