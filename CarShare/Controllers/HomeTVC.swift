//
//  HomeTVC.swift
//  CarShare
//
//  Created by Stephen Learmonth on 08/09/2020.
//  Copyright © 2020 Stephen Learmonth. All rights reserved.
//

import UIKit

class HomeTVC: UITableViewController {
    
    // MARK: - Properties


    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 45
        tableView.tableHeaderView = HeaderView(frame: .init(x: 0, y: 0, width: view.frame.width, height: 250))
        tableView.tableFooterView = FooterView(frame: .init(x: 0, y: 0, width: view.frame.width, height: 100))
    }
    
    // MARK: - Helper Functions
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}
