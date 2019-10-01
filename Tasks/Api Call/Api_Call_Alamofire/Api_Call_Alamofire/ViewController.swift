//
//  ViewController.swift
//  Api_Call_Alamofire
//
//  Created by Meruert Amambayeva on 9/29/19.
//  Copyright © 2019 Meruert Amambayeva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView:UITableView!
    
    var characters = [Person]()
    

    @IBAction func getTapped() {
        print("GET")
        Service.shared.getCharacters { response in
            print(response)
            self.characters = response.characters
            self.tableView.reloadData()
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           guard segue.identifier == "PersonToInfo",
               let infoVC = segue.destination as? InfoVC,
               let person = sender as AnyObject as? Person
               else { return }
           infoVC.person = person
    }
    @IBOutlet weak var Photo: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Photo.image = UIImage(named: "images.png")
    }
}

extension ViewController:UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = characters[indexPath.row].name
        return cell
    }
    
    //access methods and variables
    
}
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "PersonToInfo", sender: characters[indexPath.row])
    }
    
}

