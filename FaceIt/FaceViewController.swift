//
//  ViewController.swift
//  FaceIt
//
//  Created by ZhangChuanhui on 7/9/17.
//  Copyright © 2017 ZhangChuanhui. All rights reserved.
//

import UIKit

class FaceViewController: UIViewController {
    
    // Mark: Modal
    
    var expression = FacialExpression(eyes: .Closed, eyeBrows: .Furrowed, mouth: .Frown) {
        didSet {
            updateUI() // Modal changed, so update UI
        }
    }
    
    // Mark: View
    
    @IBOutlet weak var faceView: FaceView! {
        didSet {
            faceView.addGestureRecognizer(UIPinchGestureRecognizer(
                target: faceView, action: #selector(FaceView.changeScale(_:))
            ))
            
            let happierSwipeGestureRecognizer = UISwipeGestureRecognizer(
                target: self, action: #selector(FaceViewController.increaseHappiness)
            )
            happierSwipeGestureRecognizer.direction = .up
            faceView.addGestureRecognizer(happierSwipeGestureRecognizer)
            
            let sadderSwipeGestureRecognizer = UISwipeGestureRecognizer(
                target: self, action: #selector(FaceViewController.decreaseHappiness)
            )
            sadderSwipeGestureRecognizer.direction = .down
            faceView.addGestureRecognizer(sadderSwipeGestureRecognizer)
            
            faceView.addGestureRecognizer(UITapGestureRecognizer(
                target: self, action: #selector(FaceViewController.toggleEyes(_:)))
            )
            
            let doubleTapGestureRecognier = UITapGestureRecognizer(target: faceView, action: #selector(FaceView.changeColor(_:)))
            doubleTapGestureRecognier.numberOfTapsRequired = 2
            faceView.addGestureRecognizer(doubleTapGestureRecognier)
            
            updateUI()
        }
    }
    
    @objc
    func toggleEyes(_ recognizer: UITapGestureRecognizer) {
        if recognizer.state == .ended {
            switch expression.eyes {
            case .Open: expression.eyes = .Closed
            case .Closed: expression.eyes = .Open
            case .Squinting: break
            }
        }
    }
    
    // Mark: Gesture handlers
    
    @objc
    func increaseHappiness() {
        expression.mouth = expression.mouth.happierMouth()
    }
    
    @objc
    func decreaseHappiness() {
        expression.mouth = expression.mouth.sadderMouth()
    }
    
    private var mouthCurvatures = [FacialExpression.Mouth.Frown:-1.0,.Grin: 0.5,.Smile:1.0,.Smirk:-0.5,.Neural:0.0]
    private var eyeBrowTilts = [FacialExpression.EyeBrows.Relaxed:0.5,.Furrowed:-0.5,.Normal:0.0]
    
    private func updateUI() {
        if faceView != nil {
            switch expression.eyes {
            case .Open:
                faceView.eyesOpen = true
            case .Closed:
                faceView.eyesOpen = false
            case .Squinting:
                faceView.eyesOpen = false
            }
            
            faceView.mouthCurvature = mouthCurvatures[expression.mouth] ?? 0.0
            faceView.eyeBrowTilt = eyeBrowTilts[expression.eyeBrows] ?? 0.0
        }
    }
}

