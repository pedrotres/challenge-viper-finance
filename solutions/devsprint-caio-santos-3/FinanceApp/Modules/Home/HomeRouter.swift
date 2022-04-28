//
//  HomeRouter.swift
//  FinanceApp
//
//  Created by pedro tres on 26/04/22.
//

import Foundation
import UIKit

typealias HomeInterable = HomePresenterProtocol & HomeInteractorDelegate

final class HomeRouter: HomeRouterProtocol {
    
    static func createModule() -> UIViewController {
        let interactor = HomeInteractor()
        let router = HomeRouter()
        var presenter: HomeInterable = HomePresenter(
            interactor: interactor,
            router: router
        )
        let viewController: HomeViewController = HomeViewController(presenter: presenter)
        
        presenter.view = viewController
        interactor.presenter = presenter
        
        return viewController
    }
    
    func pushToUserProfile(navigation: UINavigationController) {
        navigation.present(UserProfileRouter.createModule(), animated: true)
    }
    
    func pushToActivityDetails(navigation: UINavigationController) {
        navigation.present(ActivityDetailsRouter.createModule(), animated: true)
    }
}
