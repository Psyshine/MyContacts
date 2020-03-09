//
//  PhoneViewController.swift
//  MyContacts
//
//  Created by Andry Pro on 06.03.2020.
//  Copyright © 2020 Andry Pro. All rights reserved.
//

import UIKit

class PhoneViewController: UIViewController {

    @IBOutlet weak var phoneLabel: UILabel!
  
    let phone = NetworkManager.shared.arrayOfUsers
  
    
    
    override func viewWillAppear(_ animated: Bool) {
        print(phone)
        print(UserViewController.userCount)
        setupUI()
    }
    
    func setupUI() {
        
    }
   
}
