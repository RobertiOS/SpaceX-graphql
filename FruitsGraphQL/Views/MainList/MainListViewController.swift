//
//  MainListViewController.swift
//  FruitsGraphQL
//
//  Created by Robert on 11/22/22.
//

import UIKit
import Combine

class MainListViewController: UITableViewController {
    let viewModel: MainListViewModel
    var fruits: [AllFruitsQuery.Data.Fruit] = []

    init(viewModel: MainListViewModel) {
        self.viewModel = viewModel
        super.init(style: .plain)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.foodListSubject.subscribe(self)
        setUI()
    }
    
    private func setUI() {
        title = "Fruits"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reusableCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fruits.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reusableCell")!
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = fruits[indexPath.row].fruitName
        cell.contentConfiguration = contentConfiguration
        return cell
    }

}

extension MainListViewController: Subscriber {

    typealias Input = [AllFruitsQuery.Data.Fruit]
    typealias Failure = Error

    func receive(subscription: Subscription) {
        subscription.request(.max(1))
    }

    func receive(_ input: [AllFruitsQuery.Data.Fruit]) -> Subscribers.Demand {
        fruits = input
        tableView.reloadData()
        return .max(1)
    }

    func receive(completion: Subscribers.Completion<Failure>) {
        let alert = UIAlertController()
        alert.title = "Error"
        alert.message = "\(completion)"
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        self.present(alert, animated: true)
    }

}

