//
//  RootViewController.swift
//  toskana
//
//  Created by Gleb Karpushkin on 15/05/2019.
//  Copyright © 2019 Eyerise. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, RootViewInput {

    var output: RootViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        RootModuleConfigurator().configureModuleForViewInput(self)
        output.viewIsReady()
    }


    // MARK: RootViewInput
    func setupInitialState() {
    }
}
