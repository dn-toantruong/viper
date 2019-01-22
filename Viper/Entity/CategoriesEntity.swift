//
//  CategoriesEntity.swift
//  Viper
//
//  Created by ToanTV on 1/15/19.
//  Copyright © 2019 Asian Tech Co., Ltd. All rights reserved.
//

import Foundation
import ObjectMapper

final class CategoriesEntity: Mappable {

    var kind: String = ""
    var etag: String = ""
    var items: [ItemEntity] = []

    ///Playlist
    var nextPageToken: String = ""
    var pageInfo: PageInfoEntity = PageInfoEntity()

    init() {}

    required init?(map: Map) {}

    func mapping(map: Map) {
        kind <- map["kind"]
        etag <- map["etag"]
        items <- map["items"]
        nextPageToken <- map["nextPageToken"]
        pageInfo <- map["pageInfo"]
    }
}
