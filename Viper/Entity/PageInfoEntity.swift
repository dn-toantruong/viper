//
//  PageInfoEntity.swift
//  Viper
//
//  Created by ToanTV on 1/15/19.
//  Copyright © 2019 Asian Tech Co., Ltd. All rights reserved.
//

import Foundation
import ObjectMapper

final class PageInfoEntity: Mappable {

    var totalResults: Int = 0
    var resultsPerPage: Int = 0

    init() {}

    required init?(map: Map) {}

    func mapping(map: Map) {
        totalResults <- map["totalResults"]
        resultsPerPage <- map["resultsPerPage"]
    }
}
