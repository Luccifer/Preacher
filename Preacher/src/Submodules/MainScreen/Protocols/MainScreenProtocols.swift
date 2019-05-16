//
//  MainScreenMainScreenProtocols.swift
//  toskana
//
//  Created by Gleb Karpushkin on 16/05/2019.
//  Copyright © 2019 Eyerise. All rights reserved.
//

protocol MainScreenViewInput: class {

    func setupInitialState()
}

protocol MainScreenViewOutput {

    func viewIsReady()
}

protocol MainScreenModuleInput: class {

}

protocol MainScreenInteractorInput {

}

protocol MainScreenInteractorOutput: class {

}

protocol MainScreenRouterInput {

}
