//
//  MainScreenViewController.swift
//  toskana
//
//  Created by Gleb Karpushkin on 16/05/2019.
//  Copyright © 2019 Eyerise. All rights reserved.
//

import UIKit
import AVFoundation

enum CanvasState {
    case cleared
    case dirty
}

class MainScreenViewController: UIViewController, MainScreenViewInput {
    
    @IBOutlet weak var canvasView: Canvas!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    var canvasState: CanvasState = .cleared
    
    var textToSpeak: String = """
Отче наш, сущий на небесах!
Да святится имя Твое, да приидет Царствие Твое;
да будет воля Твоя и на земле, как на небе;
Хлеб наш насущный дай нам на сей день;
И прости нам долги наши, как и мы прощаем должникам нашим;
И не введи нас в искушение, но избавь нас от лукавого.
"""
    
    let synth = AVSpeechSynthesizer()
    
    var output: MainScreenViewOutput!
    
    private var modelDataHandler: ModelDataHandler? =
        ModelDataHandler(modelFileInfo: MobileNet.modelInfo, labelsFileInfo: MobileNet.labelsInfo)
    
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
    
    @IBAction func actionSpeak(_ sender: AnyObject?) {
        speakPray()
    }
    
    func speakPray() {
        let myUtterance = AVSpeechUtterance(string: textToSpeak)
        myUtterance.voice = AVSpeechSynthesisVoice(language: "ru-RU")
        myUtterance.rate = 0.4
        
        synth.speak(myUtterance)
    }
    
    func brush() -> Brush? {
        return Brush()
    }
    
    private func setupCanvas() {
        canvasView.delegate = self
        canvasView.clipsToBounds = true
    }
    
    func canvas(_ canvas: Canvas, didUpdateDrawing drawing: Drawing, mergedImage image: UIImage?) {
        if canvasState == .cleared {
            canvasState = .dirty
            canvas.save()
        }
    }
    
    func canvas(_ canvas: Canvas, didSaveDrawing drawing: Drawing, mergedImage image: UIImage?) {
        if let img = image?.asJPGImage(1) {
            guard let pb = img.pixelBuffer(width: 224, height: 224) else {return}
            self.image.image = img
            let prediction = modelDataHandler?.runModel(onFrame: pb)
            guard let inferences = prediction?.inferences else {return}
            var score: Float = 0
            var name: String = String()
            for inference in inferences {
                if score <= inference.confidence {
                    score = inference.confidence
                    name = inference.label
                }
            }
            self.label.text = name
        }
        canvas.undo()
        canvas.clear()
        canvasState = .cleared
    }
}
