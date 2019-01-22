//
//  ItemEntity.swift
//  Viper
//
//  Created by ToanTV on 1/15/19.
//  Copyright © 2019 Asian Tech Co., Ltd. All rights reserved.
//

import Foundation
import ObjectMapper

final class ItemEntity: Mappable {

    var kind: String = ""
    var etag: String = ""
    var id: String = ""
    var snippet: SnippetEntity = SnippetEntity()

    init() {}

    required init?(map: Map) { }

    func mapping(map: Map) {
        kind <- map["kind"]
        etag <- map["etag"]
        id <- map["id"]
        snippet <- map["snippet"]
    }
}
