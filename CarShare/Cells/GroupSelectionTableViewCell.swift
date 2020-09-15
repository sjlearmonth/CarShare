//
//  GroupSelectionTableViewCell.swift
//  CarShare
//
//  Created by Stephen Learmonth on 14/09/2020.
//  Copyright © 2020 Stephen Learmonth. All rights reserved.
//

import UIKit

class GroupSelectionTableViewCell: UITableViewCell {

    // MARK: - Properties
    
    var groupSelectionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    var groupSelectionImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .clear
        iv.setHeight(height: 25)
        iv.setWidth(width: 25)
        iv.contentMode = .scaleAspectFill
        return iv
    }()

    // MARK: - LifeCycle
    
    override init(style: UITableViewCell.CellStyle , reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

         configureUI()
     }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helper Functions
    private func configureUI() {
        
        self.addSubview(groupSelectionLabel)
        groupSelectionLabel.centerY(inView: self)
        groupSelectionLabel.anchor(left: self.leftAnchor, paddingLeft: 12)
        
        self.addSubview(groupSelectionImageView)
        groupSelectionImageView.centerY(inView: self)
        groupSelectionImageView.anchor(right: self.rightAnchor, paddingRight: 12)
        
        self.backgroundColor = .black
        self.selectionStyle = .none
    }
}
