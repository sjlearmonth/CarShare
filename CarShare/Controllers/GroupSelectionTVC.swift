//
//  GroupSelectionTVC.swift
//  CarShare
//
//  Created by Stephen Learmonth on 15/09/2020.
//  Copyright © 2020 Stephen Learmonth. All rights reserved.
//

import UIKit

protocol GroupSelectionDelegate: class {
    func fetchSelectedGroup(selectedGroup: String)
}

class GroupSelectionTVC: UITableViewController {

    // MARK: - Properties
    
    private let cellID = "GroupSelectionTableViewCell"
    
    private let groupNames = ["None", "All", "College", "Gym", "My Village", "Running Club", "Work"]
    private var groupTicks = [UIImage](repeating: UIImage(), count: 6)
    private var currentlySelectedRow: Int = 0
    
    weak var delegate: GroupSelectionDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 40
        tableView.backgroundColor = .black
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(GroupSelectionTableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.tableFooterView = UIView()
        
        groupTicks[currentlySelectedRow] = UIImage(named: "Tick")!
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 6
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! GroupSelectionTableViewCell

        cell.groupSelectionLabel.text = groupNames[indexPath.row]
        cell.groupSelectionImageView.image = groupTicks[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        groupTicks[currentlySelectedRow] = UIImage()
        groupTicks[indexPath.row] = UIImage(named: "Tick")!
        currentlySelectedRow = indexPath.row
        tableView.reloadData()
        navigationController?.popViewController(animated: true)
        delegate?.fetchSelectedGroup(selectedGroup: groupNames[indexPath.row])
    }
    
}
