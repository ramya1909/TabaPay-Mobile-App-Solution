//
//  ViewController.swift
//  DemoAppTest
//
//  Created by Ramya Ramzz on 4/16/24.
//

import UIKit

struct Data{
    
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let headingLabel = UILabel()
        headingLabel.text = "TabaPay Security Logs"
        headingLabel.textAlignment = .center
        
        let enterButton = UIButton()
        enterButton.setTitle("Enter", for: .normal)
        
        enterButton.addTarget(self, action: #selector(enterButtonTapped) , for: .touchUpInside)
    }
    
    @objc func enterButtonTapped()
    {
        let building = BuildingLogsViewController()
        navigationController?.pushViewController(building, animated: true)
    }


}

//class ViewModel:ObservableObject
//{
//    let Base_Url = "https://demos.sandbox.tabapay.net/small.txt"
//    func fetch()
//    {
//        guard let url = URL(string: Base_Url) else
//        {
//            return
//        }
////        
////        let task = URLSession.shared.dataTask(with: url) { [weak self] data,response,error in
////            guard let data = data, error == nil else
////            {
////                return
////            }
////            
////            do
////            {
////                let transaction = try JSONDecoder().decode([Transaction].self, from: data)
////                
////                DispatchQueue.main.async
////                {
////                    self?.transcations = transaction
////                }
////                
////            }
////            catch
////            {
////                print(error)
////            }
////        }
//    }
//}
//
