//
//  SearchResultsVC.swift
//  CarShare
//
//  Created by Stephen Learmonth on 15/09/2020.
//  Copyright © 2020 Stephen Learmonth. All rights reserved.
//

import UIKit

class SearchResultsVC: UIViewController {

    // MARK: - Properties
    
    private let tableView = SearchResultsTV()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Below you can see a simulated results list."
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .white
        return label
    }()

    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = """
        Please note: This is for illustrative purposes only
        and is not linked to live data. Users will be able
        to sort and filter the results before tapping on one
        to get more information.
        """
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()

    private let footerLabel: UILabel = {
        let label = UILabel()
        label.text = """
        Users will be able to click on each lift that is
        shown in the table above, when they do they
        will be taken to a new screen which shows
        details of that particular lift.
        """
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        tableView.searchResultsDelegate = self

        view.addSubview(tableView)
        tableView.centerY(inView: view)
        tableView.centerX(inView: view)
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 8, paddingLeft: 32, paddingRight: 32)
        
        view.addSubview(headerLabel)
        headerLabel.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 8, paddingLeft: 32, paddingRight: 32)
        
        view.addSubview(footerLabel)
        footerLabel.anchor(top: tableView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 8, paddingLeft: 32, paddingRight: 32)
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        view.alpha = 1.0
    }

}

extension SearchResultsVC: SearchResultsDelegate {
    func fetchSelectedRowData(rowData: [String : String]) {
        let controller = LiftOfferReviewVC()
        controller.modalPresentationStyle = .formSheet
//        controller.modalTransitionStyle = .
        controller.group = rowData["Group"] ?? ""
        controller.driver = rowData["Driver"] ?? ""
//        view.alpha = 0.0
        navigationController?.pushViewController(controller, animated: true)
    }
    

}
