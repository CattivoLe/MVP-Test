//
//  MainViewController.swift
//  MVP-Test
//
//  Created by Александр Омельчук on 20.04.2020.
//  Copyright © 2020 Александр Омельчук. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let cellIdentifire = "Cell"
    var presenter: MainViewPresenterProtocol!
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifire)
        tableView.delegate = self
        tableView.dataSource = self
    }


}

extension MainViewController: MainViewProtocol {
    func succes() {
        tableView.reloadData()
    }
    
    func failure(error: Error) {
        print(error)
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.comments?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifire, for: indexPath)
        let comment = presenter.comments?[indexPath.row]
        cell.textLabel?.text = comment?.name
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let comment = presenter.comments?[indexPath.row]
        let detailViewController = ModelBuilder.createDetailModul(comment: comment)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
