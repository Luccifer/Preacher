//
//  LaunchPresenter.swift
//  toskana
//
//  Created by Gleb Karpushkin on 15/05/2019.
//  Copyright © 2019 Eyerise. All rights reserved.
//

import UIKit.UIColor

class LaunchPresenter: LaunchModuleInput, LaunchViewOutput, LaunchInteractorOutput{

    weak var view: LaunchViewInput!
    var interactor: LaunchInteractorInput!
    var router: LaunchRouterInput!

    let s = Style("s").strikethroughStyle(.single, .normal).strikethroughColor(UIColor(hex: 0xDC143C), .normal)
    let r = Style("r").foregroundColor(.red)
    
    func viewIsReady() {

    }
}
