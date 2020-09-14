//
//  GroupSelectionView.swift
//  CarShare
//
//  Created by Stephen Learmonth on 14/09/2020.
//  Copyright © 2020 Stephen Learmonth. All rights reserved.
//

import UIKit

class GroupSelectionView: UITableView {
    
    // MARK: - Properties
    
    private let cellID = "GroupSelectionTableViewCell"

    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        backgroundColor = .red
        setHeight(height: 450)
        setWidth(width: 300)
        register(GroupSelectionTableViewCell.self, forCellReuseIdentifier: cellID)
        rowHeight = 60
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func numberOfRows(inSection section: Int) -> Int {
        return 6
    }
    
    override func cellForRow(at indexPath: IndexPath) -> UITableViewCell? {
        let cell = self.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! GroupSelectionTableViewCell
        cell.groupSelectionLabel.text = "None"
        cell.groupSelectionImageView.image = UIImage(named: "Tick")
        return cell
    }
    

}
