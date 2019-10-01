//
//  Person.swift
//  Api_Call_Alamofire
//
//  Created by Meruert Amambayeva on 9/29/19.
//  Copyright © 2019 Meruert Amambayeva. All rights reserved.
//

import Foundation


struct Person{
    
    let birthYear: String
    let eyeColor: String
    let gender: String
    private let homeWorld: String
    let hairColor: String
    let height: String
    let mass: String
    let name: String
    let skinColor: String
    
    init?(json: JSON) {
        guard let birthYear = json["birth_year"] as? String,
        let eyeColor = json["eye_color"] as? String,
        let gender = json["gender"] as? String,
        let hairColor = json["hair_color"] as? String,
        let height = json["height"] as? String,
        let homeWorld = json["homeworld"] as? String,
        let mass = json["mass"] as? String,
        let name = json["name"] as? String,
        let skinColor = json["skin_color"]
        as? String
            else{
                return nil
        }
        
        self.homeWorld = homeWorld
        self.birthYear = birthYear
        self.eyeColor = eyeColor
        self.gender = gender
        self.hairColor = hairColor
        self.height = height
        self.mass = mass
        self.name = name
        self.skinColor = skinColor
        
    }
    func homeworld(_ completion: @escaping (String) -> Void) {
        Service.shared.getHomeworld(homeworldLink: homeWorld) { (homeworld) in
            completion(homeworld)
        }
    }
}
