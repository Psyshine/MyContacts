//
//  ViewController.swift
//  MyContacts
//
//  Created by Andry Pro on 04.03.2020.
//  Copyright © 2020 Andry Pro. All rights reserved.
//

import UIKit


class UserViewController: UIViewController {

    @IBOutlet weak var userImage: UIImageView!
   
    @IBOutlet weak var previousButton: UIBarButtonItem!
    @IBOutlet weak var nextButton: UIBarButtonItem!
    
   static var userCount = 0
    var users: [User]?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        userImage.layer.cornerRadius = userImage.bounds.height / 2
        NetworkManager.shared.getUsers { (userInfo) in
            self.users = userInfo
            self.setUserPhoto()
        }
       
    }

    @IBAction func previousButtonPressed(_ sender: Any) {
    }
    @IBAction func nextButtonPressed(_ sender: Any) {
        UserViewController.userCount += 1
        print(UserViewController.userCount)
        setUserPhoto()
    }
    
}

extension UserViewController {
    func setUserPhoto() {
        guard let url = users?[UserViewController.userCount].picture.large else { return }
        guard let stringUrl = URL(string: url) else { return }
        URLSession.shared.dataTask(with: stringUrl) { (data, _, _) in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.userImage.image = image
                }
            }
        }.resume()
            
        }
    }


