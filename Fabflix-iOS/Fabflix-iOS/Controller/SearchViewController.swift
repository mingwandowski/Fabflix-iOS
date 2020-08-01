//
//  SearchViewController.swift
//  Fabflix-iOS
//
//  Created by Zidan Li on 7/26/20.
//  Copyright © 2020 Haoming Gao. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    
    static let searchModel = SearchModel()
    var listMovieData: [ListMovieData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func searchPressed(_ sender: UIButton) {
        SearchViewController.searchModel.search(withTitle: searchTextField.text!)
        self.performSegue(withIdentifier: "toMovieListPage", sender: self)
    }
}
