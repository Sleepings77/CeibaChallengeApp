//
//  UserDetailTableViewCell.swift
//  CeibaChallengeApp
//
//  Created by Matias Castillo on 25/08/2022.
//

import UIKit

protocol PublicationTappedDelegate: AnyObject {
    func publicationTapped(with user: User)
}

class UserDetailTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var nameLabel  : UILabel!
    @IBOutlet private weak var phoneLabel : UILabel!
    @IBOutlet private weak var emailLabel : UILabel!
    
    private var user: User?
    
    static let identifier = "UserDetailTableViewCell"
    
    static func getNib() -> UINib {
        return UINib(nibName: "UserDetailTableViewCell", bundle: nil)
    }
    
    weak var delegate: PublicationTappedDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        applyShadow()
    }
    
    func configure(with user: User) {
        nameLabel.text = user.name
        phoneLabel.text = user.phone
        emailLabel.text = user.email
        self.user = user
    }
    
    @IBAction private func publicationPressed() {
        guard let user = user else { return }
        delegate?.publicationTapped(with: user)
    }
    
}
