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
    
    private lazy var startingPointTextField = createCustomTextField(target: self, placeholder: "Starting Point", selector: #selector(clearStartingPointTextField), event: .editingDidBegin)
    
    private lazy var destinationTextField = createCustomTextField(target: self, placeholder: "Destination", selector: #selector(clearDestinationTextField), event: .editingDidBegin)
    
    private lazy var dateAndTimeTextField = createCustomTextField(target: self, placeholder: "12/09/2020 15:01 hrs", selector: #selector(clearDateAndTimeTextField), event: .allEditingEvents)
    
    private lazy var dateAndTime: DateAndTimeSelectorView = {
        let dt = DateAndTimeSelectorView()
        dt.setWidth(width: 350)
        dt.setHeight(height: 450)
        return dt
    }()
    
    private let groupLabel: UILabel = {
        let label = UILabel()
        label.text = "Group"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18)
        label.backgroundColor = .clear
        return label
    }()
    
    private lazy var selectedGroupLabel: UILabel = {
        let label = UILabel()
        label.text = "None"
        label.textColor = .white
        label.backgroundColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 18)
        label.setHeight(height: 50)
        label.setWidth(width: 200)
        label.isUserInteractionEnabled = true
        
        var tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tap.numberOfTapsRequired = 1
        tap.numberOfTouchesRequired = 1
        
        label.addGestureRecognizer(tap)
        
        return label
    }()
    
    private lazy var groupSelectionView = GroupSelectionView()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        dateAndTime.delegate = self
    }

    // MARK: - Selectors
    
    @objc func clearStartingPointTextField() {
        startingPointTextField.text = ""
    }

    @objc func clearDestinationTextField() {
        destinationTextField.text = ""
    }

    @objc func clearDateAndTimeTextField() {
        dateAndTimeTextField.text = ""
        view.addSubview(dateAndTime)
        dateAndTime.centerY(inView: view)
        dateAndTime.centerX(inView: view)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        view.addSubview(groupSelectionView)
        groupSelectionView.centerY(inView: view)
        groupSelectionView.centerX(inView: view)
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

        view.addSubview(selectedGroupLabel)
        selectedGroupLabel.anchor(top: stackView.bottomAnchor, left: view.leftAnchor,
                                  paddingTop: 18, paddingLeft: 24)
    }
    
    @objc private func createCustomTextField(target: Any?,placeholder: String, selector: Selector, event: UIControl.Event) -> UITextField {
        let tf = UITextField()
        tf.backgroundColor = .clear
        tf.textColor = .white
        tf.font = UIFont.systemFont(ofSize: 18)
        tf.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.init(red: 0.25, green: 0.25, blue: 0.25, alpha: 1)])
        tf.addTarget(self, action: selector, for: event)
        return tf
    }
}

extension FindALiftVC: DateAndTimeDelegate {
    func readDateAndTimeSelected(date: Date, time: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_GB")
        dateFormatter.setLocalizedDateFormatFromTemplate("dd/MM/YYYY")
        let dateString = dateFormatter.string(from: date)
        dateFormatter.setLocalizedDateFormatFromTemplate("HH:mm")
        let timeString = dateFormatter.string(from: time)
        let dataAndTimeString = dateString + ", " + timeString + " hrs"
        dateAndTimeTextField.text = dataAndTimeString

    }
    

}
