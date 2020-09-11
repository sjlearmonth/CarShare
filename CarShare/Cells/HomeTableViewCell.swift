//
//  HomeTableViewCell.swift
//  CarShare
//
//  Created by Stephen Learmonth on 11/09/2020.
//  Copyright © 2020 Stephen Learmonth. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    // MARK: - Properties
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.backgroundColor = .clear
        return label
    }()
    
    var valueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.backgroundColor = .clear
        label.text = "valueLabel"
        return label
    }()

    // MARK: - Lifecycle
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helper Functions
    
    private func configureUI() {
     
        self.backgroundColor = .black
        
        self.addSubview(titleLabel)
        titleLabel.centerY(inView: self)
        titleLabel.anchor(left: leftAnchor, paddingLeft: 12)

        self.addSubview(valueLabel)
        valueLabel.centerY(inView: self)
        valueLabel.anchor(right: rightAnchor, paddingRight: 12)
    }
}
