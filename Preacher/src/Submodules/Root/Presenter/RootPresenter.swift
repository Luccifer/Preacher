//
//  RootPresenter.swift
//  toskana
//
//  Created by Gleb Karpushkin on 15/05/2019.
//  Copyright © 2019 Eyerise. All rights reserved.
//

class RootPresenter: RootModuleInput, RootViewOutput, RootInteractorOutput{

    weak var view: RootViewInput!
    var interactor: RootInteractorInput!
    var router: RootRouterInput!

    func viewIsReady() {

    }
}
