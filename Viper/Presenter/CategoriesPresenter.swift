//
//  CategoriesPresenter.swift
//  Viper
//
//  Created by ToanTV on 1/15/19.
//  Copyright © 2019 Asian Tech Co., Ltd. All rights reserved.
//

import Foundation

protocol CategoriesPresenterProtocol {

    var interactor: CategoriesInteractor? { get set }
    var view: CategoriesView? { get set }
    var router: CategoriesScreenRouter? { get set }
}

final class CategoriesPresenter: CategoriesPresenterProtocol {

    var interactor: CategoriesInteractor?
    var view: CategoriesView?
    var router: CategoriesScreenRouter?
    var getCategoriesRequest: RequestHandler?
    var categories: CategoriesEntity?
}

extension CategoriesPresenter: CategoriesEventHandler {

    func getCategoriesList() {
        do {
            getCategoriesRequest = try interactor?.getCategoriesList(completion: { [weak self] (result) in
                guard let this = self else { return }
                switch result {
                case .success(let categories):
                    this.categories = categories
                    this.view?.updateList()
                case .failure(let error):
                    break
                }
            })
        } catch {
            print("123")
        }
    }

    func getCategory(indexPath: IndexPath) -> ItemEntity {
        guard let category = categories?.items[indexPath.row] else {
            return ItemEntity()
        }
        return category
    }

    func getCountCategoriesList(section: Int) -> Int {
        return categories?.items.count ?? 0
    }

}
