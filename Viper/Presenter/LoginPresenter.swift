//
//  LoginPresenter.swift
//  Viper
//
//  Created by ToanTV on 1/11/19.
//  Copyright © 2019 Asian Tech Co., Ltd. All rights reserved.
//

import Foundation

protocol LoginPresenterProtocol {

    var view: LoginView? { get set }
    var router: LoginScreenRouter? { get set }
    var interactor: LoginInteractor? { get set }

}

final class LoginPresenter: LoginPresenterProtocol {

    weak var view: LoginView?
    var router: LoginScreenRouter?
    var interactor: LoginInteractor?
}

extension LoginPresenter: LoginEventHandler {

    func needValidate(name: String, pass: String) {
        interactor?.validate(name: name, pass: pass, completion: { [weak self] (result) in
            guard let this = self else { return }
            if result {
                this.router?.showScreen(.menu)
            } else {
                this.view?.showNameError()
            }
        })
    }
}
