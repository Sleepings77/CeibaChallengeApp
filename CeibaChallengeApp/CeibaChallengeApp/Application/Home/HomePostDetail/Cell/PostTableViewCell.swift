//
//  PostTableViewCell.swift
//  CeibaChallengeApp
//
//  Created by Matias Castillo on 25/08/2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet private weak var titleLabel  : UILabel!
    @IBOutlet private weak var bodyLabel   : UILabel!
    
    static let identifier = "PostTableViewCell"
    
    static func getNib() -> UINib {
        return UINib(nibName: "PostTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        applyShadow()
    }
    
    func configure(with post: UserPost) {
        titleLabel.text = post.title
        bodyLabel.text = post.body
    }
    
}
