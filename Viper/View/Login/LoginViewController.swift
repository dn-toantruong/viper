//
//  LoginViewController.swift
//  Viper
//
//  Created by ToanTV on 1/11/19.
//  Copyright © 2019 Asian Tech Co., Ltd. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController, LoginView {

    // MARK: - LoginView implementation
    var eventHandler: LoginEventHandler?

    // MARK: - Properties
    @IBOutlet weak var alertLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    // MARK: - Override functions
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func showNameError() {
        alertLabel.text = "abc"
        print("abc")
    }

    func showPassError() {
        alertLabel.text = "123"
        print("123")
    }

    @IBAction func textFieldEditingChanged(_ sender: UITextField) {}

    @IBAction func loginButtonTouchInside(_ sender: UIButton) {
        let userName = usernameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        eventHandler?.needValidate(name: userName, pass: password)
    }
}
