//
//  EmployeeViewController.swift
//  DemoAppTest
//
//  Created by Ramya Ramzz on 4/16/24.
//

import Foundation

import UIKit


class EmployeeViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
    
  
        //Created and storing employee number in a global property
        var employeeNumber: String = ""
    
       //Created object for log entries
        var employeeLogs: [DataModel] = []
    
      //Created TableView for displaying the data based on Employee number
        var tableView: UITableView!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            //updating the UI with Tableview and setting up the tableview basics
            tableView = UITableView(frame: view.bounds, style: .plain)
            tableView.dataSource = self
            tableView.delegate = self
            view.addSubview(tableView)
            
            //setting the title fo the modal dialogue box
            title = "Building Logs for \(employeeNumber)"
            
            //Setting title colro for the modal dialogue box
            let red: CGFloat = 15 / 255.0
            let green: CGFloat = 7 / 255.0
            let blue: CGFloat = 142 / 255.0
            let TitleColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
            navigationController?.navigationBar.tintColor = TitleColor
            
            //Based on employee number fetching data from teh API
            fetchEmployeeData()
        }
        
    func fetchEmployeeData() {
        //Base URL
        let urlString = "https://demos.sandbox.tabapay.net/small.txt"
        
        //Creating object for URL and checking if its nil
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
       //Creating URLSession task for API Call
        URLSession.shared.dataTask(with: url) { data, response, error in
            // Handle response
            guard let data = data, error == nil else {
                print("Error fetching data:", error?.localizedDescription ?? "Unknown error")
                return
            }
            
            //After recieving data from URL response parsing the data to readable format
            let logString = String(data: data, encoding: .utf8) ?? ""
            self.parseLogString(logString)
            
            //Updating tjhe Tableview by reloading with the response data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }.resume()
        }
        
        func parseLogString(_ logString: String) {
            //First we need to clear any exisiting entries
            employeeLogs.removeAll()
            
            //parsing splitting the log entries into readable lines
            let lines = logString.components(separatedBy: .newlines)
            
            //Using for block for iterating through each line and populating data based on employee number
            for line in lines {
                let components = line.components(separatedBy: ",")
                let empl = employeeNumber
                if components.count == 5 && components[2] == empl {
                    // Extract log entry properties from components
                    let dataModel = DataModel(
                        type: components[0],
                        dateTime: components[1],
                        employeeNumber: components[2],
                        buildingName: components[3],
                        roomNumber: components[4]
                    )
                    
                    //Updating teh log entry with each data entry of employee number
                    employeeLogs.append(dataModel)
                }
            }
        }
    
    
    //Region for TableView
    
    //Number of Rows in Section method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeeLogs.count
    }
    
    //Get Cell Method
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Initializing cell
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let dataModel = employeeLogs[indexPath.row]
        
        
        cell.textLabel?.text = "DateTime: \(dataModel.dateTime)"
        cell.detailTextLabel?.numberOfLines = 0
        cell.textLabel?.numberOfLines = 0
        cell.detailTextLabel?.text = "Building Name:\(dataModel.buildingName) - \nRoomNumber: \(dataModel.roomNumber)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       //deselecting the row os selected cell to remove color change
        tableView.deselectRow(at: indexPath, animated: false)
    }
    }
