//
//  LoginView.swift
//  Viper
//
//  Created by ToanTV on 1/14/19.
//  Copyright © 2019 Asian Tech Co., Ltd. All rights reserved.
//

import Foundation

protocol LoginView: class {
    func showNameError()
    func showPassError()
    var eventHandler: LoginEventHandler? { get set }
}

protocol LoginEventHandler {
    func needValidate(name: String, pass: String) // when touch up ok btn
}
