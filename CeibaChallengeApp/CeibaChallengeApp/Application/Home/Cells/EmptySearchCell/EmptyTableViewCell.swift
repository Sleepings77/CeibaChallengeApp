//
//  EmptyTableViewCell.swift
//  CeibaChallengeApp
//
//  Created by Matias Castillo on 27/08/2022.
//

import UIKit

class EmptyTableViewCell: UITableViewCell {

    static let identifier = "EmptyTableViewCell"
    
    static func getNib() -> UINib {
        return UINib(nibName: "EmptyTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
