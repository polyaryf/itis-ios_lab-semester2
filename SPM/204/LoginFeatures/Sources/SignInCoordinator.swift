//
//  SignInCoordinator.swift
//  
//
//  Created by Полина Рыфтина on 04.03.2023.
//

import UIKit

@available(iOS 16.0, *)

public class SignInCoordinator {
    
    public init(storyboard: UIStoryboard) {
        self.storyboard = storyboard
    }
    public var storyboard: UIStoryboard!

    private weak var navigationController: UINavigationController?

    @MainActor
    public func start() -> UIViewController {
        let controller: LoginViewController = storyboard.instantiateViewController(identifier: "LoginViewController")
       
        let presenter = LoginPresenter(
            view: controller,
            confirmSignIn: { [self] in
                showConfirmation()
            }
        )
        controller.presenter = presenter
        let navigationController = UINavigationController(rootViewController: controller)
        self.navigationController = navigationController
        return navigationController
    }

    private func showConfirmation() {
        let controller: ConfirmationController = storyboard.instantiateViewController(identifier: "ConfirmationController")
        controller.presenter = ConfirmationPresenter()
        navigationController?.pushViewController(controller, animated: true)
    }
}


