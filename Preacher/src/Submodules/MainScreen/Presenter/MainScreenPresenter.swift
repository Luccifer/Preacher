//
//  MainScreenPresenter.swift
//  toskana
//
//  Created by Gleb Karpushkin on 16/05/2019.
//  Copyright © 2019 Eyerise. All rights reserved.
//

class MainScreenPresenter: MainScreenModuleInput, MainScreenViewOutput, MainScreenInteractorOutput{

    weak var view: MainScreenViewInput!
    var interactor: MainScreenInteractorInput!
    var router: MainScreenRouterInput!

    func viewIsReady() {

    }
}
