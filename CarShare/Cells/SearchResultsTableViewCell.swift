//
//  SearchResultsTableViewCell.swift
//  CarShare
//
//  Created by Stephen Learmonth on 15/09/2020.
//  Copyright © 2020 Stephen Learmonth. All rights reserved.
//

import UIKit

class SearchResultsTableViewCell: UITableViewCell {


    var groupColumn: UILabel = {
        let label = UILabel()
        label.text = "Group"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .yellow
        label.layer.borderColor = UIColor.lightGray.cgColor
        label.layer.borderWidth = 2
        return label
    }()

    var driverColumn: UILabel = {
        let label = UILabel()
        label.text = "Driver"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .yellow
        label.layer.borderColor = UIColor.lightGray.cgColor
        label.layer.borderWidth = 2

        return label
    }()

    var timeColumn: UILabel = {
        let label = UILabel()
        label.text = "Time"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .yellow
        label.layer.borderColor = UIColor.lightGray.cgColor
        label.layer.borderWidth = 2

        return label
    }()

    var etcColumn: UILabel = {
        let label = UILabel()
        label.text = "etc"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .yellow
        label.layer.borderColor = UIColor.lightGray.cgColor
        label.layer.borderWidth = 2

        return label
    }()

    var notesColumn: UILabel = {
        let label = UILabel()
        label.text = "Notes"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .yellow
        label.layer.borderColor = UIColor.lightGray.cgColor
        label.layer.borderWidth = 2

        return label
    }()


    // MARK: - LifeCycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helper Function
    
    private func configureUI() {
        
        let stackView = UIStackView(arrangedSubviews: [groupColumn,
                                                       driverColumn,
                                                       timeColumn,
                                                       etcColumn,
                                                       notesColumn])
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.distribution = .fillEqually
        
        self.addSubview(stackView)
        stackView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor,
                         paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
}
