//
//  HomeViewController.swift
//  SoleekLabTask
//
//  Created by Ahmed Adel on 5/23/19.
//  Copyright © 2019 Ahmed Adel. All rights reserved.
//

import UIKit
import Firebase


struct Country:Decodable {
    let name:String
}

class HomeViewController: UITableViewController {
    
    var countries1 = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello To home")
        
        parseCountries()
    }
    
    func parseCountries(){
        let url = "https://restcountries.eu/rest/v2"
        let urlObj = URL(string: url)
        
        URLSession.shared.dataTask(with: urlObj!){(data,response,error) in
            do {
                let countries = try JSONDecoder().decode([Country].self, from: data!)
                for country in countries{
                    //print(country.name)
                    self.countries1.append(country.name)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            catch{
                print("An error")
            }
        }.resume()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countries1.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for:indexPath)
        let country = self.countries1[indexPath.row]
        cell.textLabel?.text = country
        return cell
    }
    
    
    @IBAction func logOutTapped(_ sender: UIButton)
    {
//        let firebaseAuth = Auth.auth()
//        do {
//            try firebaseAuth.signOut()
//        } catch let signOutError as NSError {
//            print ("Error signing out: %@", signOutError)
//        }
        
//        try! Auth.auth().signOut()
//
//        if let storyboard = self.storyboard {
//            let vc = storyboard.instantiateViewController(withIdentifier: "loginViewController") as! UINavigationController
//            self.present(vc, animated: false, completion: nil)
//        }
//        print("You are logged out")
    }
    
    
    
 
    
}
