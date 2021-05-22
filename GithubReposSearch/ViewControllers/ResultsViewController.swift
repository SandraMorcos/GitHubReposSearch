//
//  ResultsViewController.swift
//  GithubReposSearch
//
//  Created by Sandra Morcos on 5/22/21.
//  Copyright © 2021 Sandra Morcos. All rights reserved.
//

import UIKit
import RxSwift

class ResultsViewController: UIViewController {

    private let disposeBag = DisposeBag()
    var viewModel: ResultsViewModel?
    
    @IBOutlet weak var resultsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultsTableView.register(UINib(nibName: "RepositoryTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: RepositoryTableViewCell.reuseIdentifier)
        resultsTableView.rowHeight = UITableView.automaticDimension
        viewModel?.dataSource
            .bind(to: resultsTableView
                .rx
                .items(cellIdentifier: RepositoryTableViewCell.reuseIdentifier,
                       cellType: RepositoryTableViewCell.self)) { row, repository, cell in
                        cell.setup(with: repository)
        }
        .disposed(by: disposeBag)        
        
        resultsTableView.rx
            .setDelegate(self)
            .disposed(by: disposeBag)
    }
    
    

}

extension ResultsViewController: UITableViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView.isNearBottomEdge() {
            viewModel?.fetchResults()
        }
    }
}
extension UIScrollView {
    func  isNearBottomEdge(edgeOffset: CGFloat = 20.0) -> Bool {
        self.contentOffset.y + self.frame.size.height + edgeOffset > self.contentSize.height
    }
}
