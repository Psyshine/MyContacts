//
//  Location.swift
//  MyContacts
//
//  Created by Andry Pro on 04.03.2020.
//  Copyright © 2020 Andry Pro. All rights reserved.
//

struct Location: Codable {
    let city, state, country: String
    
    init?(json: [String: Any]) {
        guard
        let city = json["city"] as? String,
        let state = json["state"] as? String,
        let country = json["country"] as? String
            else {
                return nil
        }
        self.city = city
        self.state = state
        self.country = country
    }
}
