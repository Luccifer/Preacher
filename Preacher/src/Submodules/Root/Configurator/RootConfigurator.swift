//
//  RootConfigurator.swift
//  toskana
//
//  Created by Gleb Karpushkin on 15/05/2019.
//  Copyright © 2019 Eyerise. All rights reserved.
//

import UIKit

class RootModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(_ viewInput: UIViewController) {

        if let viewController = viewInput as? RootViewController {
            configure(viewController)
        }
    }

    private func configure(_ viewController: RootViewController) {

        let router = RootRouter()
        router.view = viewController

        let presenter = RootPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = RootInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
