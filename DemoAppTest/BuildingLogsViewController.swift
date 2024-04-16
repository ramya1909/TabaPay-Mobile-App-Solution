//
//  BuildingLogsViewController.swift
//  DemoAppTest
//
//  Created by Ramya Ramzz on 4/16/24.
//

import Foundation

import UIKit


class BuildingLogsViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    //Created object logEntries for data recieved from API
    var logEntries: [DataModel] = []
    
    //Created TableView for diaplying data from API
    var tableView: UITableView!
 
        override func viewDidLoad() {
            super.viewDidLoad()
            
            //Setting up UI
            tableView = UITableView(frame: view.bounds, style: .plain)
            tableView.dataSource = self
            tableView.delegate = self
            view.addSubview(tableView)
    
            //Adding title and titlecolor
            title = "Building Logs"
            let red: CGFloat = 15 / 255.0
            let green: CGFloat = 7 / 255.0
            let blue: CGFloat = 142 / 255.0
            let TitleColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
            navigationController?.navigationBar.tintColor = TitleColor
            
            
            //Fethching data from the URL
            fetchData(from: "https://demos.sandbox.tabapay.net/small.txt")
        }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
    }
        
    //Function to fetch data from the URL
    func fetchData(from url: String) {
        
        //Checking for nil value in URL
        if let url = URL(string: url) {
            //Creating URLSession for the URL and requesting data
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data else { return }
                if let logString = String(data: data, encoding: .utf8) {
                    self.parseLogString(logString)
                    
                    //Updating the information on Main Thread when response us ready from the API
                    DispatchQueue.main.async {
                        self.tableView.reloadData() // Reload table view data
                    }
                }
            }.resume()
        }
    }
        
    //Parsing the data based on "," and populating in logEntries object
    func parseLogString(_ logString: String) {
        let lines = logString.components(separatedBy: .newlines)
        for line in lines {
            let components = line.components(separatedBy: ",")
            if components.count == 5 {
                let dataModel = DataModel(
                    type: components[0],
                    dateTime: components[1],
                    employeeNumber: components[2],
                    buildingName: components[3],
                    roomNumber: components[4]
                )
                logEntries.append(dataModel)
            }
        }
    }
    
    
    
    //Region for TableView
    
    //Number Of Rows in Section method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return logEntries.count
    }
    
    //Get Cell method
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //Setting up UITableViewCell for each log Entry
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let dataModel = logEntries[indexPath.row]
        
       
        //Updating the background colro of each cell
        let red: CGFloat = 5 / 255.0
        let green: CGFloat = 214 / 255.0
        let blue: CGFloat = 168 / 255.0
        let backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        cell.backgroundColor = backgroundColor
        
        //Populating text labels in teh cell with the Building Log information
        cell.textLabel?.numberOfLines = 0
               cell.textLabel?.text = "DateTime: \(dataModel.dateTime)\nEmpNo: \(dataModel.employeeNumber)"
        cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
      
        cell.detailTextLabel?.numberOfLines = 0
        cell.detailTextLabel?.text = "Building Name: \(dataModel.buildingName) - \nRoomNumber: \(dataModel.roomNumber)"
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 12)
        
        return cell
    }
    
    //DidSelectRow method
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //When any cell is selected in the list it navigate sto EmployeeViewController for displaying concerned Building logs based on the Employee ID
        let selectedLog = logEntries[indexPath.row]
        let employeeNumber = selectedLog.employeeNumber
        tableView.deselectRow(at: indexPath, animated: false)
        
        // after cell gets selected navigating to the EmployeeViewController
        let employeeDataVC = EmployeeViewController()
        employeeDataVC.employeeNumber = employeeNumber
        employeeDataVC.title = "Employee Data"
        
        //Navigating to EmployeeViewController as a Modal Dialogue Box
        present(employeeDataVC, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         //sets height of the cell
          return 100
      }

}
