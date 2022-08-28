//
//  ShadowView.swift
//  CeibaChallengeApp
//
//  Created by Matias Castillo on 27/08/2022.
//

import UIKit

extension UIView {
    
    func applyShadow() {
        layer.masksToBounds = true
        layer.shadowRadius = 4.0
        layer.shadowOpacity = 0.30
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 3)
    }
    
}

