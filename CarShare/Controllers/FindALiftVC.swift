//
//  FindALiftVC.swift
//  CarShare
//
//  Created by Stephen Learmonth on 11/09/2020.
//  Copyright © 2020 Stephen Learmonth. All rights reserved.
//

import UIKit

class FindALiftVC: UIViewController {

    // MARK: - Properties
    
    private lazy var startingPointTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .clear
        tf.textColor = .white
        tf.font = UIFont.systemFont(ofSize: 18)
        tf.attributedPlaceholder = NSAttributedString(string: "Starting Point", attributes: [NSAttributedString.Key.foregroundColor : UIColor.init(red: 0.25, green: 0.25, blue: 0.25, alpha: 1)])
        tf.addTarget(self, action: #selector(clearStartingPointTextField), for: .editingDidBegin)
        return tf
    }()
    
    private let destinationTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .clear
        tf.textColor = .white
        tf.font = UIFont.systemFont(ofSize: 18)
        tf.attributedPlaceholder = NSAttributedString(string: "Destination", attributes: [NSAttributedString.Key.foregroundColor : UIColor.init(red: 0.25, green: 0.25, blue: 0.25, alpha: 1)])
        tf.addTarget(self, action: #selector(clearDestinationTextField), for: .editingDidBegin)
        return tf
    }()
    
    private let dateAndTimeTextField: UITextField = {
        let tf = UITextField()
        tf.textColor = .white
        tf.font = UIFont.systemFont(ofSize: 18)
        tf.attributedPlaceholder = NSAttributedString(string: "Enter date and time", attributes: [NSAttributedString.Key.foregroundColor : UIColor.init(red: 0.25, green: 0.25, blue: 0.25, alpha: 1)])
        tf.addTarget(self, action: #selector(clearDateAndTimeTextField), for: .editingDidBegin)
        return tf
    }()
    
    private let groupLabel: UILabel = {
        let label = UILabel()
        label.text = "Group"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18)
        label.backgroundColor = .clear
        return label
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()

    }

    // MARK: - Selectors
    
    @objc func clearStartingPointTextField() {
        startingPointTextField.text = ""
        print("DEBUG: got here 1")
    }

    @objc func clearDestinationTextField() {
        destinationTextField.text = ""
    }

    @objc func clearDateAndTimeTextField() {
        
    }
    
    // MARK: Helper Functions
    
    private func configureUI() {
        
        view.backgroundColor = .black
        
        let stackView = UIStackView(arrangedSubviews: [startingPointTextField,
                                                       destinationTextField,
                                                       dateAndTimeTextField,
                                                       groupLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 12
        
        view.addSubview(stackView)
        stackView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                         left: view.leftAnchor,
                         right: view.rightAnchor,
                         paddingTop: 32, paddingLeft: 16, paddingRight: 16, height: 200)
        
        view.addSubview(dateAndTimeView)
        
        
    }
    
//    @objc private func createCustomTextField(target: Any?,placeholder: String, selector: Selector) -> UITextField {
//        let tf = UITextField()
//        tf.backgroundColor = .clear
//        tf.textColor = .white
//        tf.font = UIFont.systemFont(ofSize: 18)
//        tf.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.init(red: 0.25, green: 0.25, blue: 0.25, alpha: 1)])
//        tf.addTarget(self, action: #selector(selector), for: .editingDidBegin)
//
//        return tf
//
//    }
}
