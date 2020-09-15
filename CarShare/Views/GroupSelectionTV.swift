//
//  GroupSelectionView.swift
//  CarShare
//
//  Created by Stephen Learmonth on 14/09/2020.
//  Copyright © 2020 Stephen Learmonth. All rights reserved.
//

import UIKit

class GroupSelectionTV: UITableView {
    
    // MARK: - Properties
    
    private let cellID = "GroupSelectionTableViewCell"

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        backgroundColor = .black
        setHeight(height: 450)
        setWidth(width: 300)
        register(GroupSelectionTableViewCell.self, forCellReuseIdentifier: cellID)
        rowHeight = 60
        dataSource = self
        delegate = self
        tableFooterView = UIView()
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GroupSelectionTV: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        return
    }
}

extension GroupSelectionTV: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! GroupSelectionTableViewCell
        cell.groupSelectionLabel.text = "None"
        cell.groupSelectionImageView.image = UIImage(named: "Tick")
        
        return cell
    }
}
