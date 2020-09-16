//
//  LiftOfferReviewVC.swift
//  CarShare
//
//  Created by Stephen Learmonth on 16/09/2020.
//  Copyright © 2020 Stephen Learmonth. All rights reserved.
//

import UIKit

class LiftOfferReviewVC: UIViewController {

    // MARK: - Properties
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Lift Offer Review:"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = .white
        return label
    }()
    
    var group: String = ""
    var driver: String = ""
    
    private lazy var tableView = UITableView()
    
    private let cellID = "LiftOfferReviewTVC"
    
    private let acceptLiftButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Accept Lift", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGreen
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(handleAcceptLift), for: .touchUpInside)
        button.setHeight(height: 50)
        button.layer.cornerRadius = 5
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: - Helper Function
    
    private func configureUI() {
        
        view.backgroundColor = .black
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor,
                          paddingTop: 40, paddingLeft: 32)
        
        tableView.rowHeight = 50
        tableView.register(LiftOfferReviewTVC.self, forCellReuseIdentifier: cellID)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .black
        tableView.setHeight(height: 200)
        view.addSubview(tableView)
        tableView.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor,
                         paddingTop: 8, paddingLeft: 32, paddingRight: 32)
        
        view.addSubview(acceptLiftButton)
        acceptLiftButton.anchor(top: tableView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 16, paddingLeft: 32, paddingRight: 32)
    }
    
    // MARK: - Selectors
    
    @objc func handleAcceptLift() {
        let controller = LiftOfferAccepted()
        controller.modalPresentationStyle = .fullScreen
        controller.driver = driver
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension LiftOfferReviewVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        return
    }
}

extension LiftOfferReviewVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! LiftOfferReviewTVC
        switch indexPath.row {
        case 0:
            cell.titleLabel.text = "Driver"
            cell.valueLabel.text = driver
        case 1:
                cell.titleLabel.text = "Level"
                cell.valueLabel.text = "Silver"
        case 2:
                cell.titleLabel.text = "Cost"
                cell.valueLabel.text = "(no fee, or cost £0.90, etc)"
        case 3:
                cell.titleLabel.text = "Group"
                cell.valueLabel.text = group
        default:
            cell.titleLabel.text = ""
            cell.valueLabel.text = ""
        }
        return cell
    }
    
    
}
