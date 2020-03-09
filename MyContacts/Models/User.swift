//
//  User.swift
//  MyContacts
//
//  Created by Andry Pro on 04.03.2020.
//  Copyright © 2020 Andry Pro. All rights reserved.
//

struct User: Codable {
    let name: Name
    let location: Location
    let email: String
    let phone, cell: String
    let picture: Picture
}

