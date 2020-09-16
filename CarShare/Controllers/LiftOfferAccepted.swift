//
//  LiftOfferAccepted.swift
//  CarShare
//
//  Created by Stephen Learmonth on 16/09/2020.
//  Copyright © 2020 Stephen Learmonth. All rights reserved.
//

import UIKit

class LiftOfferAccepted: UIViewController {

    // MARK: - Properties
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Lift Offer Accepted"
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textColor = .white
        label.backgroundColor = .clear
        label.textAlignment = .center
        return label
    }()
    
    var driver: String = String()
    
    private lazy var confirmLabel: UILabel = {
        let label = UILabel()
        label.text = "Your lift with \(driver) is confirmed"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .white
        label.backgroundColor = .clear
        label.textAlignment = .center
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "Time Until Lift (days/clock countdown)"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .white
        label.backgroundColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private let amendButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Amend", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGreen
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(handleAmend), for: .touchUpInside)
        button.setHeight(height: 50)
        button.layer.cornerRadius = 5
        return button
    }()

    private let messageDriverButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Message Driver", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGreen
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(handleMessageDriver), for: .touchUpInside)
        button.setHeight(height: 50)
        button.layer.cornerRadius = 5
        return button
    }()

    private let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGreen
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(handleCancel), for: .touchUpInside)
        button.setHeight(height: 50)
        button.layer.cornerRadius = 5
        return button
    }()

    private let findAnotherLiftButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Find Another Lift", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGreen
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(handleFindAnotherLift), for: .touchUpInside)
        button.setHeight(height: 50)
        button.layer.cornerRadius = 5
        return button
    }()

    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
     
    }
    
    // MARK: Helper Functions
    
    private func configureUI() {
        
        view.backgroundColor = .black
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)

        view.addSubview(confirmLabel)
        confirmLabel.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 16, paddingLeft: 32, paddingRight: 32)

        view.addSubview(timeLabel)
        timeLabel.anchor(top: confirmLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 16, paddingLeft: 32, paddingRight: 32)
        
        view.addSubview(amendButton)
        amendButton.anchor(top: timeLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 16, paddingLeft: 32, paddingRight: 32)

        view.addSubview(messageDriverButton)
        messageDriverButton.anchor(top: amendButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 16, paddingLeft: 32, paddingRight: 32)

        view.addSubview(cancelButton)
        cancelButton.anchor(top: messageDriverButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 16, paddingLeft: 32, paddingRight: 32)

        view.addSubview(findAnotherLiftButton)
        findAnotherLiftButton.anchor(top: cancelButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 16, paddingLeft: 32, paddingRight: 32)

    }
    
    // MARL: - Selectors
    
    @objc func handleAmend() {
        print("DEBUG: Amend button clicked")
    }
    
    @objc func handleMessageDriver() {
        print("DEBUG: Message Driver button clicked")
    }

    @objc func handleCancel() {
        print("DEBUG: Cancel button clicked")
    }

    @objc func handleFindAnotherLift() {
        print("DEBUG: Find Another Lift button clicked")
    }

}
