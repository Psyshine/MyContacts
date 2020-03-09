//
//  NetworkManager.swift
//  MyContacts
//
//  Created by Andry Pro on 04.03.2020.
//  Copyright © 2020 Andry Pro. All rights reserved.
//

import Alamofire
class NetworkManager {
    
   static let shared = NetworkManager()
   var arrayOfUsers = [User]()
    
  
    let url = "https://randomuser.me/api/?results=2"
    
    func getUsers(_ completion: @escaping ([User]) -> Void) {
    var recivedUsers = [User]()
    AF.request(url).validate().responseJSON { dataResponse in
        switch dataResponse.result {
        case .success(let value):
            guard let jsonData = value as? [String:Any] else { return }
            guard let users = jsonData["results"] as? [[String:Any]] else {return }
            for user in users {
                let name = user["name"] as! [String: Any]
                guard let userName = Name(json: name) else { return }
                let location = user["location"] as! [String: Any]
                guard let userLocation = Location(json: location) else { return }
                let picture = user["picture"] as! [String:Any]
                guard let userPicture = Picture(json: picture) else { return }
                let userEmail = user["email"] as! String
                let userPhone = user["phone"] as! String
                let userCell = user["cell"] as! String
              
                let userInfo = User(name: userName,
                                location: userLocation,
                                email: userEmail,
                                phone: userPhone,
                                cell: userCell,
                                picture: userPicture)
                recivedUsers.append(userInfo)
               
            }
           
             completion(recivedUsers)
        case .failure(let error):
            print(error)
        }
    }
       
        
    }
}
//            for names in users {
//                let names = names["name"] as! [String: Any]
//                guard let userName = Name(json: names) else { return }
//
//                let locations = names["location"] as! [String: Any]
