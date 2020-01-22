//
//  UserTableViewCell.swift
//  Typicode
//
//  Created by Кирилл Кибешев on 21.01.2020.
//  Copyright © 2020 Кирилл Кибешев. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    private var nameLabel = UILabel()
    private var phoneLabel = UILabel()

    init() {
        super.init(style: .default, reuseIdentifier: "userCell")

        self.addSubview(nameLabel)
        self.addSubview(phoneLabel)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true

        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8).isActive = true
        phoneLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        phoneLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(user: User) {
        nameLabel.text = user.name
        phoneLabel.text = user.phone
    }
}
