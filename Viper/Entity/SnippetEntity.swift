//
//  SnippetEntity.swift
//  Viper
//
//  Created by ToanTV on 1/15/19.
//  Copyright © 2019 Asian Tech Co., Ltd. All rights reserved.
//

import Foundation
import ObjectMapper

final class SnippetEntity: Mappable {

    var channelId: String = ""
    var title: String = ""
    var assignable: Bool = false

    /// Playlist
    var publishedAt: String = ""
    var description: String = ""
    var channelTitle: String = ""
    var thumbnails: ThumbnailsEntity = ThumbnailsEntity()

    init() {}

    required init?(map: Map) {}

    func mapping(map: Map) {
        channelId <- map["channelId"]
        title <- map["title"]
        assignable <- map["assignable"]
        publishedAt <- map["publishedAt"]
        description <- map["description"]
        channelTitle <- map["channelTitle"]
        thumbnails <- map["thumbnails"]
    }
}
