//
//  SearchResultsTV.swift
//  CarShare
//
//  Created by Stephen Learmonth on 15/09/2020.
//  Copyright © 2020 Stephen Learmonth. All rights reserved.
//

import UIKit

class SearchResultsTV: UITableView {

    // MARK: - Properties
    
    private let cellID = "SearchResultsTableViewCell"
    
    private let exampleResults = [[String]]()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        backgroundColor = .black
        setHeight(height: 175)
        setWidth(width: 365)
        register(SearchResultsTableViewCell.self, forCellReuseIdentifier: cellID)
        rowHeight = 25
        dataSource = self
        delegate = self
        tableFooterView = UIView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SearchResultsTV: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        return
    }
    
    override func numberOfRows(inSection section: Int) -> Int {
        1
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
        
        if indexPath.row == 0 {

            rowTextColor = .black
            rowBackgroundColor = .yellow

        } else {

            rowTextColor = .white
            rowBackgroundColor = .black

        }
        
        cell.groupColumn.textColor = rowTextColor
        cell.groupColumn.backgroundColor = rowBackgroundColor
        
        cell.driverColumn.textColor = rowTextColor
        cell.driverColumn.backgroundColor = rowBackgroundColor

        cell.timeColumn.textColor = rowTextColor
        cell.timeColumn.backgroundColor = rowBackgroundColor

        cell.etcColumn.textColor = rowTextColor
        cell.etcColumn.backgroundColor = rowBackgroundColor

        cell.notesColumn.textColor = rowTextColor
        cell.notesColumn.backgroundColor = rowBackgroundColor

        return cell
    }
    

}
