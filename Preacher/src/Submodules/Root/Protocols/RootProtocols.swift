//
//  RootRootProtocols.swift
//  toskana
//
//  Created by Gleb Karpushkin on 15/05/2019.
//  Copyright © 2019 Eyerise. All rights reserved.
//

protocol RootViewInput: class {

    func setupInitialState()
}

protocol RootViewOutput {

    func viewIsReady()
}

protocol RootModuleInput: class {

}

protocol RootInteractorInput {

}

protocol RootInteractorOutput: class {

}

protocol RootRouterInput {

}
