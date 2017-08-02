//
//  ViewController.swift
//  ActionOverlayDemo
//
//  Created by Modeso-5 on 8/1/17.
//  Copyright © 2017 Modeso. All rights reserved.
//

import UIKit
import MActionOverlay

class ViewController: UIViewController {

    @IBOutlet weak var actionButton: ActionButton!
    var x: CGFloat!
    let transition = OverlayTransition()
    var actionButtonOrigin: CGPoint!
    
    @IBOutlet weak var grayView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        actionButton.parentViewController = self
        actionButton.targetView = grayView
        actionButton.transitionDelegate = self
        actionButton.overlayViewDelegate = self
        actionButton.overlayButtonsNumber = 3
        actionButton.overlayButtonsIds = [1, 2, 3]
        actionButton.overlayButtonsImages = ["camera-icon", "share-icon", "cloud-icon", "share-icon", "cloud-icon"]
        
    }
    func test(gesture: UIGestureRecognizer) {
        print("buttonClicked")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
}
extension ViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.startingPoint = self.grayView.center
        transition.overlayViewColor = actionButton.backgroundColor!
        return transition
    }
}
extension ViewController: OverlayViewDelegate {
    func showActionButton() {
        actionButton.showActionButton()
    }
    func buttonClicked(id: Int) {
        print("buttonID\(id)")
    }
}
