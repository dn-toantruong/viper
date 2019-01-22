//
//  HttpCategoriesServiceRouter.swift
//  Viper
//
//  Created by ToanTV on 1/16/19.
//  Copyright © 2019 Asian Tech Co., Ltd. All rights reserved.
//

import Foundation

enum HttpCategoriesServiceRouter: HttpServiceRouter {

    case getCategoriesList

    var endpoint: String {
        return "https://www.googleapis.com/youtube/v3"
    }

    var method: HTTPMethod {
        return .get
    }

    var path: String {
        switch self {
        case .getCategoriesList:
            return "/videoCategories"
        }
    }

    var parameters: Parameters? {
        return ["part": "snippet",
                "key": "AIzaSyCqclhOWo4H8FMN-Oqj8TVaMmMpaeJoRTc",
                "regionCode": "VN"]
    }

    var headers: [String: String]? {
        return nil
    }

    var encoding: ParameterEncoding {
        switch self {
        case .getCategoriesList:
            return URLEncoding.default
        }
    }
}
