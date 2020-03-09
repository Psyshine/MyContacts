//
//  Name.swift
//  MyContacts
//
//  Created by Andry Pro on 04.03.2020.
//  Copyright © 2020 Andry Pro. All rights reserved.
//

struct Name: Codable {
    let first, last, title: String

    init?(json: [String: Any]) {
        guard
        let first = json["first"] as? String,
        let last = json["last"] as? String,
        let title = json["title"] as? String
            else {
                return nil
        }
        self.first = first
        self.last = last
        self.title = title
    }
}

