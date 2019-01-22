//
//  HttpCategoriesService.swift
//  Viper
//
//  Created by ToanTV on 1/15/19.
//  Copyright © 2019 Asian Tech Co., Ltd. All rights reserved.
//

import Foundation

protocol HttpCategoriesServiceProtocol {
    func getCategoriesList(completion: @escaping Completion) throws -> RequestHandler
    typealias Completion = (Result<CategoriesEntity>) -> Void
}

final class HttpCategoriesService: HttpCategoriesServiceProtocol {

    private let client: HttpClient

    init(client: HttpClient = DefaultHttpClient()) {
        self.client = client
    }

    func getCategoriesList(completion: @escaping HttpCategoriesService.Completion) throws -> RequestHandler {
        let router = HttpCategoriesServiceRouter.getCategoriesList
        return try client.request(router).responseJSON(completionHandler: { (res) in
            switch res.result {
            case .success(let json):
                guard let json = json as? [String: Any], let categories = CategoriesEntity(JSON: json) else {
                    return
                }
                completion(.success(categories))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}
