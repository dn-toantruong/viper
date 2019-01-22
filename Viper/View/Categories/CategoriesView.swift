//
//  CategoriesView.swift
//  Viper
//
//  Created by ToanTV on 1/15/19.
//  Copyright © 2019 Asian Tech Co., Ltd. All rights reserved.
//

import Foundation

protocol CategoriesView: class {
    func updateList()
    var eventHandler: CategoriesEventHandler? { get set }
}

protocol CategoriesEventHandler {
    func getCategoriesList()
    func getCategory(indexPath: IndexPath) -> ItemEntity
    func getCountCategoriesList(section: Int) -> Int
}
