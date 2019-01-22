//
//  LoginScreenRouter.swift
//  Viper
//
//  Created by ToanTV on 1/11/19.
//  Copyright © 2019 Asian Tech Co., Ltd. All rights reserved.
//

import UIKit

final class LoginScreenRouter: ScreenRouter {

    enum Screen: String {
        case menu = "Menu"
    }

    weak var viewController: UIViewController?

    func showScreen(_ screen: Screen) {
        switch screen {
        case .menu:
            print("Show screen moi ne!ß")
            let vc = categoriesViewController()
            viewController?.navigationController?.pushViewController(vc, animated: true)
        }
    }

    private func categoriesViewController() -> CategoriesViewController {
        let vc = CategoriesViewController()
        let presenter = CategoriesPresenter()
        vc.eventHandler = presenter
        let router = CategoriesScreenRouter()
        router.viewController = vc
        let entity = CategoriesEntity()
        let interactor = CategoriesInteractor()
        interactor.categoriesEntity = entity
        interactor.http = HttpCategoriesService()
        presenter.view = vc
        presenter.router = router
        presenter.interactor = interactor
        return vc
    }
}
