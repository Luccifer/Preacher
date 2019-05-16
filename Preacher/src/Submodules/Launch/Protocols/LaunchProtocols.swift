//
//  LaunchLaunchProtocols.swift
//  toskana
//
//  Created by Gleb Karpushkin on 15/05/2019.
//  Copyright © 2019 Eyerise. All rights reserved.
//

protocol LaunchViewInput: class {

    func setupInitialState()
}

protocol LaunchViewOutput {

    var s: Style {get}
    var r: Style {get}
    
    func viewIsReady()
}

protocol LaunchModuleInput: class {

}

protocol LaunchInteractorInput {

}

protocol LaunchInteractorOutput: class {

}

protocol LaunchRouterInput {

}
