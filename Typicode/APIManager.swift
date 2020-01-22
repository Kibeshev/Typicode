//
//  APIManager.swift
//  Typicode
//
//  Created by Кирилл Кибешев on 21.01.2020.
//  Copyright © 2020 Кирилл Кибешев. All rights reserved.
//
import Foundation
import UIKit

class UsersAPIManager {
    func getUsers(urlString: String, completion: @escaping ([User]?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                let decoder = JSONDecoder()
                if let rawResponse = try? decoder.decode([User].self, from: data) {
                    completion(rawResponse)
                    return
                }
            }
            completion(nil)
        }
        task.resume()
    }
}
