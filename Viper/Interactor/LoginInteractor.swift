//
//  LoginInteractor.swift
//  Viper
//
//  Created by ToanTV on 1/14/19.
//  Copyright © 2019 Asian Tech Co., Ltd. All rights reserved.
//

import Foundation

protocol LoginInputInteractorProtocol {
    var entity: LoginEntity? { get set }
    func validate(name: String, pass: String, completion: CompletionHandler?)
    typealias CompletionHandler = (Bool) -> Void
}

protocol LoginOutputInteractorProtocol {
    func showNameError()
    func showPassError()
}

protocol LoginEntity {
    func validate(name: String, pass: String, completion: CompletionHandler?)
    typealias CompletionHandler = (Bool) -> Void
}

final class LoginLocalEntity: LoginEntity {
    func validate(name: String, pass: String, completion: LoginLocalEntity.CompletionHandler?) {
        if name == "a" && pass == "b" {
            completion?(true)
        } else {
            completion?(false)
        }
    }
}

final class LoginInteractor: LoginInputInteractorProtocol {

    func validate(name: String, pass: String, completion: LoginInteractor.CompletionHandler?) {
        entity?.validate(name: name, pass: pass, completion: completion)
    }

    var entity: LoginEntity?
}
