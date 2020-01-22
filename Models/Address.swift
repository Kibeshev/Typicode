//
//  Address.swift
//  Typicode
//
//  Created by Кирилл Кибешев on 22.01.2020.
//  Copyright © 2020 Кирилл Кибешев. All rights reserved.
//

import Foundation

struct Address: Codable {
    let street: String?
    let suite: String?
    let city: String?
    let zipcode: String?
    let geo: Geo?
}
