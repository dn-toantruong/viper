//
//  CategoriesScreenRouter.swift
//  Viper
//
//  Created by ToanTV on 1/15/19.
//  Copyright © 2019 Asian Tech Co., Ltd. All rights reserved.
//

import UIKit

final class CategoriesScreenRouter: ScreenRouter {

    enum Screen: String {
        case menu = "Menu"
    }

    weak var viewController: UIViewController?

    func showScreen(_ screen: Screen) {
        switch screen {
        case .menu:
            print("Show screen moi ne!ß")
            break
        }
    }
}
