//
//  ViewController.swift
//  SwipeBackDemo
//
//  Created by Vincent Cubit on 11/14/21.
//


import UIKit


final class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // MARK: Other solution
        
        
        /*
         Uncomment self.addSwipeBack() and make the storyboard's navigationController only a default UINavigationController to test this solution
         */
        // Call function from extension
        // self.addSwipeBack()
        
        
    }


}


// Use this extension to make accessible in any file you want


extension UIViewController {
    func addSwipeBack() {
        // Add and configure gesture
        let swipeBackGesture = UISwipeGestureRecognizer(target: self,
                                                        action: #selector(self.swipeBack(gesture:)))
        swipeBackGesture.direction = .right
        self.view.addGestureRecognizer(swipeBackGesture)
    }


    // Handle gesture
    @objc func swipeBack(gesture: UISwipeGestureRecognizer) {
        self.navigationController?.popViewController(animated: true)
    }


}

