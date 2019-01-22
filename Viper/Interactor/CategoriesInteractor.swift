//
//  CategoriesInteractor.swift
//  Viper
//
//  Created by ToanTV on 1/15/19.
//  Copyright © 2019 Asian Tech Co., Ltd. All rights reserved.
//

import Foundation

protocol CategoriesInteractorProtocol {
    var http: HttpCategoriesService? { get set }
    func getCategoriesList(completion: CompletionHandler?) throws -> RequestHandler?
    typealias CompletionHandler = (Result<CategoriesEntity>) -> Void
    var categoriesEntity: CategoriesEntity? { get set }
}

final class CategoriesInteractor: CategoriesInteractorProtocol {

    var http: HttpCategoriesService?

    var categoriesEntity: CategoriesEntity?

    func getCategoriesList(completion: CompletionHandler?) throws -> RequestHandler? {
        return try http?.getCategoriesList(completion: { [weak self] (result) in
            guard let this = self else { return }
            switch result {
            case .success(let categories):
                completion?(.success(categories))
            case .failure(let error):
                completion?(.failure(error))
            }
        })

    }
}
