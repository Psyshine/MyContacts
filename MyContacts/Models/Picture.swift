//
//  Picture.swift
//  MyContacts
//
//  Created by Andry Pro on 04.03.2020.
//  Copyright © 2020 Andry Pro. All rights reserved.
//

struct Picture: Codable {
    let large: String
  
    init?(json: [String: Any]) {
           guard
           let large = json["large"] as? String
          
               else {
                   return nil
           }
           self.large = large
       }
}
