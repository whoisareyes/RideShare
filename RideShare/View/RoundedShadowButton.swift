//
//  RoundedShadowButton.swift
//  RideShare
//
//  Created by adolfo reyes on 1/22/18.
//  Copyright © 2018 adolfo reyes. All rights reserved.
//

import UIKit

class RoundedShadowButton: UIButton {
    
    var originalSize : CGRect?
    
    func setupView(){
        originalSize = self.frame
        self.layer.cornerRadius = 5.0
        self.layer.shadowRadius = 10
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize.zero
    }
    
    func animateButton(shouldLoad: Bool, withMessage message:String?){
        let spinner = UIActivityIndicatorView()
        spinner.activityIndicatorViewStyle = .white
        spinner.color = UIColor.darkGray
        spinner.alpha = 0.0
        spinner.hidesWhenStopped = true
        
        if shouldLoad{
            self.setTitle("", for: .normal)
            UIView.animate(withDuration: 0.2, animations: {self.layer.cornerRadius = self.frame.height / 2
                self.frame = CGRect(x: self.frame.midX + (self.frame.height / 2), y: self.frame.origin.y, width: self.frame.height, height: self.frame.height)
            },completion: { (finished) in
                if finished {
                    spinner.center = CGPoint(x: self.frame.width / 2 + 1 , y: self.frame.width / 2 + 1)
                    UIView.animate(withDuration: 0.2, animations: {
                        spinner.alpha = 1.0
                    })
                }
            })
        }
    }
}
