//
//  ViewController.swift
//  Typicode
//
//  Created by Кирилл Кибешев on 21.01.2020.
//  Copyright © 2020 Кирилл Кибешев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties

    private let manager = UsersAPIManager()
    private let tableView = UITableView()
    private var users: [User] = []

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        configureTableView()

        tableView.delegate = self
        tableView.dataSource = self
    }

    // MARK: - Private methods

    private func loadData() {
        let url = "https://jsonplaceholder.typicode.com/users"
        manager.getUsers(urlString: url, completion: { [weak self] users in
            guard let self = self else {
                return
            }
            DispatchQueue.main.async {
                self.users.append(contentsOf: users ?? [] )
                self.tableView.reloadData()
            }
        })

    }

    private func configureTableView() {

        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true

        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: "userCell")
    }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDelegate {

}

// MARK: - UITableViewDelegate

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UserTableViewCell()
        let user = self.users[indexPath.row]
        cell.configure(user: user)
        return cell
    }
}

