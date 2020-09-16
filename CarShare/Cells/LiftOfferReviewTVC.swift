//
//  LiftOfferReviewTVC.swift
//  CarShare
//
//  Created by Stephen Learmonth on 16/09/2020.
//  Copyright © 2020 Stephen Learmonth. All rights reserved.
//

import UIKit

class LiftOfferReviewTVC: UITableViewCell {

    // MARK: - Properties
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.backgroundColor = .clear
        label.textAlignment = .left
        return label
    }()
    
    var valueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        label.backgroundColor = .clear
        label.textAlignment = .right
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
        titleLabel.anchor(left: leftAnchor, paddingLeft: 0)

        self.addSubview(valueLabel)
        valueLabel.centerY(inView: self)
        valueLabel.anchor(right: rightAnchor, paddingRight: 0)
    }
}
