//
//  FirstViewController.swift
//  DemoAppTest
//
//  Created by Ramya Ramzz on 4/16/24.
//

import Foundation
import UIKit


class FirstViewController: UIViewController {

        override func viewDidLoad() {
            super.viewDidLoad()
            // Setup UI elements
            let titleLabel = UILabel()
            titleLabel.text = "TabaPay Security Logs"
            titleLabel.textAlignment = .center
            titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(titleLabel)
            
            let enterButton = UIButton(type: .system)
            enterButton.setTitle("Enter", for: .normal)
            enterButton.addTarget(self, action: #selector(enterButtonTapped), for: .touchUpInside)
            enterButton.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(enterButton)
            
            NSLayoutConstraint.activate([
                titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
                enterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                enterButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20)
            ])
        }
        
        @objc func enterButtonTapped() {
            // Navigate to Building Logs screen
            let buildingLogsVC = BuildingLogsViewController()
            navigationController?.pushViewController(buildingLogsVC, animated: true)
        }
    }
    

