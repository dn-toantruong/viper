//
//  ThumbnailsEntity.swift
//  Viper
//
//  Created by ToanTV on 1/15/19.
//  Copyright © 2019 Asian Tech Co., Ltd. All rights reserved.
//

import Foundation
import ObjectMapper

final class ThumbnailsEntity: Mappable {

    var normal: Path = Path()
    var medium: Path = Path()
    var high: Path = Path()
    var standard: Path = Path()
    var maxres: Path = Path()

    init() {}

    required init?(map: Map) {}

    func mapping(map: Map) {
        normal <- map["default"]
        medium <- map["medium"]
        high <- map["high"]
        standard <- map["standard"]
        maxres <- map["maxres"]
    }
}

final class Path: Mappable {

    var url: String = ""
    var width: Int = 0
    var height: Int = 0

    init() {}

    required init(map: Map) {}

    func mapping(map: Map) {
        url <- map["url"]
        width <- map["width"]
        height <- map["height"]
    }
}
