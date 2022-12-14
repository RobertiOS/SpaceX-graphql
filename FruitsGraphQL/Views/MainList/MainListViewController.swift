//
//  MainListViewController.swift
//  FruitsGraphQL
//
//  Created by Robert on 11/22/22.
//

import UIKit
import Combine

class MainListViewController: UITableViewController {
    let viewModel: MainListViewModelRepresentable

    enum Section: CaseIterable {
        case main
    }

    private let searchController = UISearchController()

    typealias DataSource = UITableViewDiffableDataSource<Section, Launch>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Launch>

    var dataSource: DataSource?

    init(viewModel: MainListViewModelRepresentable) {
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
        title = "Launches"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reusableCell")
        tableView.prefetchDataSource = self
        setUpDataSource()
        setUpSearchController()
    }

    private func setUpSearchController() {
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        searchController.searchBar.placeholder = NSLocalizedString("place_holder_search_bar", comment: "place holder text on a search bar")
    }

    func setUpDataSource() {
        dataSource = DataSource(tableView: tableView) { tableView, _, itemIdentifier -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: "reusableCell")
            var contentConfiguration = cell?.defaultContentConfiguration()
            contentConfiguration?.text = itemIdentifier.fragments.launchDetails.site
            contentConfiguration?.secondaryText = itemIdentifier.fragments.launchDetails.id
            cell?.contentConfiguration = contentConfiguration
            return cell
        }

    }

    func applySnapshot(items: [Launch]) {
        var snapShot = Snapshot()
        snapShot.appendSections(Section.allCases)
        snapShot.appendItems(items)
        dataSource?.apply(snapShot, animatingDifferences: true)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.presentDetailView(index: indexPath.row)
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
        let alert = UIAlertController(title: "Error", message: "\(completion)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        present(alert, animated: true)
    }

}

extension MainListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        viewModel.search(text: searchController.searchBar.text)
    }
}

extension MainListViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        viewModel.loadMoreLaunches()
        debugPrint(indexPaths)
    }
}

extension Launch: Hashable {

    public static func == (lhs: Launch, rhs: Launch) -> Bool {
        lhs.id == rhs.id
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(fragments.launchDetails.id)
    }

}
