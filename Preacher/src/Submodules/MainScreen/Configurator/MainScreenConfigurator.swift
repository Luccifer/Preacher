//
//  MainScreenConfigurator.swift
//  toskana
//
//  Created by Gleb Karpushkin on 16/05/2019.
//  Copyright © 2019 Eyerise. All rights reserved.
//

import UIKit

class MainScreenModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(_ viewInput: UIViewController) {

        if let viewController = viewInput as? MainScreenViewController {
            configure(viewController)
        }
    }

    private func configure(_ viewController: MainScreenViewController) {

        let router = MainScreenRouter()
        router.view = viewController

        let presenter = MainScreenPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = MainScreenInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
