//
//  Service.swift
//  Api_Call_Alamofire
//
//  Created by Meruert Amambayeva on 9/29/19.
//  Copyright © 2019 Meruert Amambayeva. All rights reserved.
//

import Foundation
import Alamofire

typealias JSON = [String: Any]

class Service {
    
    static let shared = Service()
    private init() {}
    
    
   
    func getCharacters(success successBlock: @escaping (getCharacterResponse) -> Void) {
        AF.request("http://swapi.co/api/people/").responseJSON { response in
            guard let json = response.value as? JSON else { return }
            do {
                let getCharactersResponse = try getCharacterResponse(json: json)
                successBlock(getCharactersResponse)
            } catch {}
        }
    }
    
    func getHomeworld(homeworldLink: String, completion: @escaping (String) -> Void){
        AF.request(homeworldLink).responseJSON { (response) in
            guard let json = response.value as? JSON,
            let name = json["name"] as? String
            else {return}
            completion(name)
        }
        
    }

}


