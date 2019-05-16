//
//  LaunchViewController.swift
//  toskana
//
//  Created by Gleb Karpushkin on 15/05/2019.
//  Copyright © 2019 Eyerise. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController, LaunchViewInput {
    
    @IBOutlet weak var mainLabel: UILabel!
    
    var output: LaunchViewOutput!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        LaunchModuleConfigurator().configureModuleForViewInput(self)
        output.viewIsReady()
        setupInitialState()
    }
    
    // MARK: LaunchViewInput
    func setupInitialState() {
        showEasterEgg()
    }
}

extension LaunchViewController {
    
    private func showEasterEgg() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            UIView.animate(withDuration: 0.1, animations: { [weak self] in
                self?.showReaper()
            }) { [weak self] (_) in
                self?.showPreacher()
            }
        }
    }
    
    private func showReaper() {
        mainLabel.attributedText = "<s>Preacher</s>\n<r>Reaper</r>".style(tags: [output.s,output.r]).attributedString
    }
    
    private func showPreacher() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
            UIView.animate(withDuration: 0.1) { [weak self] in
                self?.mainLabel.attributedText = "Preacher".attributedString
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: { [weak self] in
                    self?.moveToMainScreen()
                })
            }
        }
    }
    
    private func moveToMainScreen() {
        let mainSB = UIStoryboard(name: "MainScreen", bundle: nil)
        let mainVC = mainSB.instantiateViewController(withIdentifier: "MainScreenViewController")
        self.navigationController?.setViewControllers([mainVC], animated: false)
    }
}
