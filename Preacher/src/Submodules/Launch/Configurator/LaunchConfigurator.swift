//
//  LaunchConfigurator.swift
//  toskana
//
//  Created by Gleb Karpushkin on 15/05/2019.
//  Copyright © 2019 Eyerise. All rights reserved.
//

import UIKit

class LaunchModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(_ viewInput: UIViewController) {

        if let viewController = viewInput as? LaunchViewController {
            configure(viewController)
        }
    }

    private func configure(_ viewController: LaunchViewController) {

        let router = LaunchRouter()
        router.view = viewController

        let presenter = LaunchPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = LaunchInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
