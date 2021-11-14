//
//  CustomNavigationController.swift
//  SwipeBackDemo
//
//  Created by Vincent Cubit on 11/14/21.
//


import UIKit


// Code for this file:
// https://stackoverflow.com/questions/32914006/swipe-to-go-back-only-works-on-edge-of-screen


class CustomNavigationController: UINavigationController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFullWidthBackGesture()
    }
    
    
    private lazy var fullWidthBackGestureRecognizer = UIPanGestureRecognizer()

    
    private func setupFullWidthBackGesture() {
        // The trick here is to wire up our full-width `fullWidthBackGestureRecognizer` to execute the same handler as
        // the system `interactivePopGestureRecognizer`. That's done by assigning the same "targets" (effectively
        // object and selector) of the system one to our gesture recognizer.
        guard
            let interactivePopGestureRecognizer = interactivePopGestureRecognizer,
            let targets = interactivePopGestureRecognizer.value(forKey: "targets")
        else {
            return
        }

        
        fullWidthBackGestureRecognizer.setValue(targets, forKey: "targets")
        fullWidthBackGestureRecognizer.delegate = self
        self.view.addGestureRecognizer(fullWidthBackGestureRecognizer)
        
        
    }
    
    
}


extension CustomNavigationController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        let isSystemSwipeToBackEnabled = interactivePopGestureRecognizer?.isEnabled == true
        let isThereStackedViewControllers = viewControllers.count > 1
        return isSystemSwipeToBackEnabled && isThereStackedViewControllers
    }
}

