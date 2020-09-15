//
//  SearchResultsVC.swift
//  CarShare
//
//  Created by Stephen Learmonth on 15/09/2020.
//  Copyright © 2020 Stephen Learmonth. All rights reserved.
//

import UIKit

class SearchResultsVC: UIViewController {

    // MARK: - Properties
    
    private let tableView = SearchResultsTV()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        tableView.centerY(inView: view)
        tableView.centerX(inView: view)
    }

}
