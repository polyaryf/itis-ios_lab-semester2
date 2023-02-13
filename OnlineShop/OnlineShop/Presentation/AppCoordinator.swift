//
//  AppCoordinator.swift
//  OnlineShop
//
//  Created by Полина Рыфтина on 12.02.2023.
//

import UIKit
import Combine

class AppCoordinator {
    weak var window: UIWindow?
    static let shared: AppCoordinator = .init()
    
    var authorizationService: AuthorizationService = MockAuthorizationService.shared
    
    var cancellables: Set<AnyCancellable> = []
    
    func start() {
        authorizationService.isAuthorized
            .receive(on: DispatchQueue.main)
            .sink { [weak self] authorized in
                guard let self else { return }
                
                if authorized {
                    self.showAppContent()
                } else {
                    self.showAuthorization()
                }
            }
            .store(in: &cancellables)
    }
    
    func showAuthorization() {
        let controller = LoginViewController()
        let presenter = LoginPresenter()
        controller.presenter = presenter
        presenter.view = controller
        window?.rootViewController = controller
    }
    
    func showAppContent() {}
}
