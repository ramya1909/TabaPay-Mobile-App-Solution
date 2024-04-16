//
//  HomePageViewController.swift
//  DemoAppTest
//
//  Created by Ramya Ramzz on 4/16/24.
//

import Foundation

import UIKit


class HomePageViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setting Up UI elements Title Label and Enter Button
        let titleLbl = UILabel()
        titleLbl.textAlignment = .center
        titleLbl.text = "TabaPay Security Logs"
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        titleLbl.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        view.addSubview(titleLbl)
        
        
        //Adding UIButton and setting background colro, titlecolro, font sizes
        let enterButton = UIButton(type: .system)
        enterButton.setTitle("Enter", for: .normal)
        let fontSize: CGFloat = 20
        enterButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: fontSize)
        let red: CGFloat = 15 / 255.0
        let green: CGFloat = 7 / 255.0
        let blue: CGFloat = 142 / 255.0

        let backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        enterButton.backgroundColor = backgroundColor
        
        let buttonPadding: CGFloat = 20 //adding padding between text and corners
        enterButton.contentEdgeInsets = UIEdgeInsets(top: buttonPadding, left: buttonPadding, bottom: buttonPadding, right: buttonPadding)

        enterButton.setTitleColor(UIColor.white, for: .normal)
        enterButton.layer.cornerRadius = 5
        enterButton.addTarget(self, action: #selector(enterButtonTapped), for: .touchUpInside)
        enterButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(enterButton)
        
        NSLayoutConstraint.activate([
            titleLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLbl.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            enterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            enterButton.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 40)
        ])
    }
    
    //Button Tapped event
    @objc func enterButtonTapped() {
        //When Enter Button is clicked it navigates to BuildingLogsViewController
        let buildingLogsVC = BuildingLogsViewController()
        navigationController?.pushViewController(buildingLogsVC, animated: true)
    }
    
}

