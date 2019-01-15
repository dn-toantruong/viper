//
//  User.swift
//  Viper
//
//  Created by ToanTV on 1/14/19.
//  Copyright © 2019 Asian Tech Co., Ltd. All rights reserved.
//

import Foundation

class User {

    var userName: String
    var password: String

    init(user: String, pass: String) {
        self.userName = user
        self.password = pass
    }
}
