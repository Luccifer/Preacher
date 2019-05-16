//
//  MainScreenViewController.swift
//  toskana
//
//  Created by Gleb Karpushkin on 16/05/2019.
//  Copyright © 2019 Eyerise. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController, MainScreenViewInput {
    
    @IBOutlet weak var canvasView: Canvas!
    
    var output: MainScreenViewOutput!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        MainScreenModuleConfigurator().configureModuleForViewInput(self)
        output.viewIsReady()
        setupInitialState()
    }
    
    // MARK: MainScreenViewInput
    func setupInitialState() {
        setupCanvas()
    }
    
}

extension MainScreenViewController: CanvasDelegate {
    
    func brush() -> Brush? {
       return Brush()
    }
    
    private func setupCanvas() {
        canvasView.delegate = self
        canvasView.layer.borderColor = UIColor(red: 0.22, green: 0.22, blue: 0.22, alpha: 0.8).cgColor
        canvasView.layer.borderWidth = 2.0
        canvasView.layer.cornerRadius = 5.0
        canvasView.clipsToBounds = true
    }
    
    func canvas(_ canvas: Canvas, didUpdateDrawing drawing: Drawing, mergedImage image: UIImage?) {
        canvas.save()
    }
    
    func canvas(_ canvas: Canvas, didSaveDrawing drawing: Drawing, mergedImage image: UIImage?) {
        if let pngImage = image?.asPNGImage() {
            
        }
    }
}


