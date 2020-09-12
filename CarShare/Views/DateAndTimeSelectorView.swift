//
//  DateAndTimeSelectorVC.swift
//  CarShare
//
//  Created by Stephen Learmonth on 11/09/2020.
//  Copyright © 2020 Stephen Learmonth. All rights reserved.
//

import UIKit

protocol DateAndTimeDelegate: class {
    func readDateAndTimeSelected(date: Date, time: Date)
}

class DateAndTimeSelectorView: UIView {

    // MARK: - Properties
    
    weak var delegate: DateAndTimeDelegate?
    
    private lazy var dateSelector: UIDatePicker = {
        let dp = UIDatePicker()
        dp.datePickerMode = .date
        dp.preferredDatePickerStyle = .wheels
        dp.setHeight(height: 150)
        dp.timeZone = .current
        return dp
    }()
    
    private lazy var timeSelector: UIDatePicker = {
        let dp = UIDatePicker()
        dp.datePickerMode = .time
        dp.minuteInterval = 5
        dp.preferredDatePickerStyle = .wheels
        dp.setHeight(height: 150)
        return dp
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Set date and time"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18)
        label.backgroundColor = .clear
        return label
    }()
    
    private lazy var cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setHeight(height: 50)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.addTarget(self, action: #selector(handleCancelClicked), for: .touchUpInside)
        return button
    }()
    
    private lazy var setButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Set", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setHeight(height: 50)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.addTarget(self, action: #selector(handleSetClicked), for: .touchUpInside)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - selectors
        
    @objc func handleCancelClicked() {
        self.removeFromSuperview()
    }
    
    @objc func handleSetClicked() {
        delegate?.readDateAndTimeSelected(date: dateSelector.date, time: timeSelector.date)
        self.removeFromSuperview()
    }
    
    // MARK: - Helper Functions
    
    private func configureUI() {
        
        self.backgroundColor = .white
        
        self.addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, left: leftAnchor, paddingTop: 16, paddingLeft: 16)
        
        let stackView = UIStackView(arrangedSubviews: [dateSelector, timeSelector])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fill
        
        self.addSubview(stackView)
        stackView.centerY(inView: self)
        stackView.anchor(left: leftAnchor, right: rightAnchor, paddingLeft: 32, paddingRight: 32)
        
        self.addSubview(cancelButton)
        cancelButton.anchor(left: leftAnchor, bottom: bottomAnchor, paddingLeft: 16, paddingBottom: 16)
        
        self.addSubview(setButton)
        setButton.anchor(bottom: bottomAnchor, right: rightAnchor, paddingBottom: 16, paddingRight: 16)

    }

 

}
