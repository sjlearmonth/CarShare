//
//  SearchResultsTV.swift
//  CarShare
//
//  Created by Stephen Learmonth on 15/09/2020.
//  Copyright © 2020 Stephen Learmonth. All rights reserved.
//

import UIKit

protocol SearchResultsDelegate: class {
    func fetchSelectedRowData(rowData: [String:String])
}

class SearchResultsTV: UITableView {

    // MARK: - Properties
    
    private let cellID = "SearchResultsTableViewCell"
    
    private let exampleResults = [["Group" : "Work", "Driver" : "Louise", "Time" : "2pm", "etc" : "-",                               "Notes" : "-"],
                                  ["Group" : "My Village", "Driver" : "Mark", "Time" : "1:45pm", "etc" : "-", "Notes" : "-"],
                                  ["Group" : "Gym", "Driver" : "Lucy", "Time" : "1pm", "etc" : "-","Notes" : "-"]
                                  ]
        
    weak var searchResultsDelegate: SearchResultsDelegate?
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        backgroundColor = .lightGray
        setHeight(height: 100)
        setWidth(width: 365)
        register(SearchResultsTableViewCell.self, forCellReuseIdentifier: cellID)
        rowHeight = 25
        dataSource = self
        delegate = self
        let footerView = UIView()
        footerView.setHeight(height: 0)
        footerView.setWidth(width: 365)
        tableFooterView = footerView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SearchResultsTV: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row > 0 {
            searchResultsDelegate?.fetchSelectedRowData(rowData: exampleResults[indexPath.row - 1])
            
        }
        
        return
    }
    
    override func numberOfRows(inSection section: Int) -> Int {
        return 4
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

extension SearchResultsTV: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! SearchResultsTableViewCell
        
        var rowTextColor = UIColor()
        var rowBackgroundColor = UIColor()
        var groupRowText = ""
        var driverRowText = ""
        var timeRowText = ""
        var etcRowText = ""
        var notesRowText = ""
        
        if indexPath.row == 0 {

            rowTextColor = .black
            rowBackgroundColor = .yellow
            groupRowText = "Group"
            driverRowText = "Driver"
            timeRowText = "Time"
            etcRowText = "etc"
            notesRowText = "Notes"

        } else {

            rowTextColor = .white
            rowBackgroundColor = .black
            
            groupRowText = exampleResults[indexPath.row - 1]["Group"]!
            driverRowText = exampleResults[indexPath.row - 1]["Driver"]!
            timeRowText = exampleResults[indexPath.row - 1]["Time"]!
            etcRowText = exampleResults[indexPath.row - 1]["etc"]!
            notesRowText = exampleResults[indexPath.row - 1]["Notes"]!

        }
        
        cell.groupColumn.textColor = rowTextColor
        cell.groupColumn.backgroundColor = rowBackgroundColor
        cell.groupColumn.text = groupRowText
        
        cell.driverColumn.textColor = rowTextColor
        cell.driverColumn.backgroundColor = rowBackgroundColor
        cell.driverColumn.text = driverRowText

        cell.timeColumn.textColor = rowTextColor
        cell.timeColumn.backgroundColor = rowBackgroundColor
        cell.timeColumn.text = timeRowText

        cell.etcColumn.textColor = rowTextColor
        cell.etcColumn.backgroundColor = rowBackgroundColor
        cell.etcColumn.text = etcRowText

        cell.notesColumn.textColor = rowTextColor
        cell.notesColumn.backgroundColor = rowBackgroundColor
        cell.notesColumn.text = notesRowText

        return cell
    }
    

}
