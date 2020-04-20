//
//  DetailViewController.swift
//  MVP-Test
//
//  Created by Александр Омельчук on 20.04.2020.
//  Copyright © 2020 Александр Омельчук. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var presenter: DetailViewPresenterProtocol!

    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setComment()
    }


}

extension DetailViewController: DetailViewProtocol {
    func setComment(comment: Comment?) {
        self.textLabel.text = comment?.body
    }
}
