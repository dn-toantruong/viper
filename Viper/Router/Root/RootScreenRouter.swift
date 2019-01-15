//
//  RootScreenRouter.swift
//  Viper
//
//  Created by Dao Nguyen V. on 10/2/18.
//  Copyright © 2018 Asian Tech Co., Ltd. All rights reserved.
//

import UIKit
import SVProgressHUD

final class RootScreenRouter: ScreenRouter {

  enum Screen: String {
    case tabbar = "Tabbar"
    case login = "Login"
  }

  weak var window: UIWindow? {
    didSet {
      viewController = window?.rootViewController
    }
  }

  weak var viewController: UIViewController?

  func showScreen(_ screen: Screen) {
    switch screen {
    case .tabbar:
      let target = tabbarController()
      window?.rootViewController = target
    case .login:
      let login = loginController()
      window?.rootViewController = login
    }
  }

  // MARK: - init tabbar
  private func tabbarController() -> TabbarController {
    // init
    let tabbarController = TabbarController()
    let router = TabbarScreenRouter()
    // reference
    router.viewController = tabbarController
    router.configDefaultTabbarController()

    return tabbarController
  }

  private func loginController() -> LoginViewController {
    let vc = LoginViewController()
    let presenter = LoginPresenter()
    vc.eventHandler = presenter
    let router = LoginScreenRouter()
    router.viewController = vc
    let entity = LoginLocalEntity()
    let interactor = LoginInteractor()
    interactor.entity = entity
    presenter.view = vc
    presenter.router = router
    presenter.interactor = interactor
    return vc
  }

}
