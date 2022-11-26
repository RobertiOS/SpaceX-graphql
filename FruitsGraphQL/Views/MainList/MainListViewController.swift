//
//  MainListViewController.swift
//  FruitsGraphQL
//
//  Created by Robert on 11/22/22.
//

import UIKit
import Combine

class MainListViewController: UITableViewController {
    typealias Launch = LaunchListQuery.Data.Launch.Launch
    let viewModel: MainListViewModelRepresentable

    enum Section: CaseIterable {
        case main
    }

    typealias DataSource = UITableViewDiffableDataSource<Section, Launch>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Launch>

    var dataSource: DataSource?

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
        viewModel.launchesListSubject.subscribe(self)
        
        setUI()
    }
    
    private func setUI() {
        title = "Fruits"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reusableCell")
        setUpDataSource()
    }
    
    func setUpDataSource() {
        dataSource = DataSource(tableView: tableView) { tableView, indexPath, itemIdentifier -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: "reusableCell")!
            var contentConfiguration = cell.defaultContentConfiguration()
            contentConfiguration.text = itemIdentifier.site
            contentConfiguration.secondaryText = itemIdentifier.id
            cell.contentConfiguration = contentConfiguration
            return cell
        }
        
    }
    
    func applySnapshot(items: [Launch]) {
        var snapShot = Snapshot()
        snapShot.appendSections(Section.allCases)
        snapShot.appendItems(items)
        dataSource?.apply(snapShot, animatingDifferences: true)
    }

}

extension MainListViewController: Subscriber {

    typealias Input = [Launch]
    typealias Failure = Error

    func receive(subscription: Subscription) {
        subscription.request(.max(1))
    }

    func receive(_ input: [Launch]) -> Subscribers.Demand {
        applySnapshot(items: input)
        return .max(1)
    }

    func receive(completion: Subscribers.Completion<Failure>) {
        let alert = UIAlertController(title: "Error", message: "\(completion)",preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        present(alert, animated: true)
    }

}

extension LaunchListQuery.Data.Launch.Launch: Hashable {
    public static func == (lhs: LaunchListQuery.Data.Launch.Launch, rhs: LaunchListQuery.Data.Launch.Launch) -> Bool {
        lhs.id == rhs.id
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

}

