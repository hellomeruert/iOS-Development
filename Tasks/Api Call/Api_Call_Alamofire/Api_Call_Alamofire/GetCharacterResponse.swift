//
//  GetCharactersResponse.swift
//  Api_Call_Alamofire
//
//  Created by Meruert Amambayeva on 9/29/19.
//  Copyright © 2019 Meruert Amambayeva. All rights reserved.
//

import Foundation

struct getCharacterResponse{
    
    let characters: [Person]
    init(json: JSON) throws{
        guard let results = json["results"] as? [JSON] else {throw ServiceError.badService }
        let characters = results.map{
            Person(json: $0) }.compactMap{$0}
        self.characters = characters
        }
    }

