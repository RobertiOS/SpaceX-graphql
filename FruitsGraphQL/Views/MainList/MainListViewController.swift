//
//  MainListViewController.swift
//  FruitsGraphQL
//
//  Created by Robert on 11/22/22.
//

import UIKit

class MainListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        setUI()
    }
    
    private func setUI() {
        title = "Countries"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reusableCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reusableCell")!
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = "Test"
        cell.contentConfiguration = contentConfiguration
        return cell
    }


}

