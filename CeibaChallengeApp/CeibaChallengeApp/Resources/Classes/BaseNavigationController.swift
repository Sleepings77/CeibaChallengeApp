//
//  BaseNavigationController.swift
//  CeibaChallengeApp
//
//  Created by Matias Castillo on 27/08/2022.
//

import UIKit

final class BaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let textAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17),
                              NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationBar.titleTextAttributes = textAttributes
        navigationBar.tintColor = .white
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
    }
    
}
