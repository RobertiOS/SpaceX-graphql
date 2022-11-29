//
//  DetailViewController.swift
//  FruitsGraphQL
//
//  Created by Robert on 11/28/22.
//

import UIKit
import Combine

class DetailViewController: UIViewController {
    let viewModel: DetailViewModelRepresentable
    var cancellable: AnyCancellable?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let activity = UIActivityIndicatorView()
        activity.startAnimating()
        navigationItem.titleView = activity
    }
    
    init(viewModel: DetailViewModelRepresentable) {
        self.viewModel = viewModel
        super.init(nibName: "DetailViewController", bundle: nil)
        cancellable = viewModel.launchSubject.sink { completion in
            print(completion)
        } receiveValue: { launch in
            self.navigationItem.titleView = nil
            self.title = launch.site
            self.navigationItem.title = launch.site
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
