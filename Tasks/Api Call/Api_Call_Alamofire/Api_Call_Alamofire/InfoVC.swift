//
//  infoVC.swift
//  Api_Call_Alamofire
//
//  Created by Meruert Amambayeva on 9/29/19.
//  Copyright © 2019 Meruert Amambayeva. All rights reserved.
//

import UIKit

class InfoVC: UIViewController {
 
    
    @IBOutlet weak var homeworld: UILabel!
    @IBOutlet weak var birthyear: UILabel!
    @IBOutlet weak var skincolor: UILabel!
    @IBOutlet weak var mass: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var haircolor: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var eyecolor: UILabel!
    
    var person: Person!
    override func viewDidLoad() {
        super.viewDidLoad()
   
        print(person)
        
        name.text = person.name
        birthyear.text = person.birthYear
        eyecolor.text = person.eyeColor
        gender.text = person.gender
        haircolor.text = person.hairColor
        height.text = person.height
        mass.text = person.mass
        skincolor.text = person.skinColor
        person.homeworld { (homeworld) in
            self.homeworld.text = homeworld
            
        }
        
    }

}
