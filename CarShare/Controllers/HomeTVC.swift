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
    
    let cellID = "HomeTableViewCell"
    
    private let titlelabels = ["Monthly Totals", "Total CO2 Saved", "Money Saved", "# Trips Taken", "Earned", "# Trips Taken", "# Trips Given"]
    private let valueLabels = ["", "0.247 tonnes", "£22.00", "7", "£4.80", "7", "2"]

    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 45
        tableView.backgroundColor = .black
        tableView.tableHeaderView = HeaderView(frame: .init(x: 0, y: 0, width: view.frame.width, height: 350))
        tableView.tableFooterView = FooterView(frame: .init(x: 0, y: 0, width: view.frame.width, height: 160))
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: cellID)
    }
    
    // MARK: - Helper Functions
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        6
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! HomeTableViewCell
        cell.titleLabel.text = titlelabels[indexPath.row]
        cell.valueLabel.text = valueLabels[indexPath.row]
        
        return cell
    }
}
