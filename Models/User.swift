//
//  User.swift
//  Typicode
//
//  Created by Кирилл Кибешев on 22.01.2020.
//  Copyright © 2020 Кирилл Кибешев. All rights reserved.
//

import Foundation

struct User: Codable {
    let id: Int?
    let name: String?
    let username: String?
    let email: String?
    let phone: String?
    let website: String?
    let address: Address?
    let company: Company?
}
