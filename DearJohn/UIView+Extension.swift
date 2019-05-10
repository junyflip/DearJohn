//
//  UIView+Extension.swift
//  DearJohn
//
//  Created by Lahai on 5/9/19.
//  Copyright © 2019 lolo. All rights reserved.
//

import UIKit
extension UIView {
    func anchors(top:NSLayoutYAxisAnchor?, topPad: CGFloat, bottom: NSLayoutYAxisAnchor?, bottomPad: CGFloat, left:NSLayoutXAxisAnchor?, leftPad: CGFloat, right: NSLayoutXAxisAnchor?, rightPad: CGFloat) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            if #available(iOS 11.0, *){
                self.safeAreaLayoutGuide.topAnchor.constraint(equalTo: top, constant: topPad).isActive = true
            }else{
                self.topAnchor.constraint(equalTo: top, constant: topPad).isActive = true
            }
        }
        
        if let bottom = bottom {
            if #available(iOS 11.0, *){
                self.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: bottom, constant: bottomPad).isActive = true
            }else{
                self.bottomAnchor.constraint(equalTo: bottom, constant: bottomPad).isActive = true
            }
        }
        
        if let left = left {
            
            if #available(iOS 11.0, *){
                self.safeAreaLayoutGuide.leftAnchor.constraint(equalTo: left, constant: leftPad).isActive = true
            }else{
                self.leftAnchor.constraint(equalTo: left, constant: leftPad).isActive = true
            }
            
        }
        
        
        if let right = right {
            if #available(iOS 11.0, *){
                self.safeAreaLayoutGuide.rightAnchor.constraint(equalTo: right, constant: rightPad).isActive = true
            }else{
                self.rightAnchor.constraint(equalTo: right, constant: rightPad).isActive = true
            }
        }
    }
    
    
}


