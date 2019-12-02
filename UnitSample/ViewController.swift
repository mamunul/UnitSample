//
//  ViewController.swift
//  UnitSample
//
//  Created by New User on 26/11/19.
//  Copyright © 2019 New User. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let coreDataManager = CoreDataManager()
    var httpClient:HttpClient?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        httpClient = HttpClient(session: URLSession.shared)
        guard let url = URL(string: "https://www.zerotoappstore.com/") else {return}
        
        httpClient?.get(url: url) { (data, error) in
            print(data)
        }
    }
    
    @IBAction func insertUser(){
        var user = UserModel(name: "Mobin", age: 18, country: "BD")
        let cricketActivity = ActivityModel(name: "Cricket", playersNumber: 11)
        let tennisActivity = ActivityModel(name: "Tennis", playersNumber: 2)
        user.activities = [cricketActivity,tennisActivity]
        coreDataManager.insertUser(userData: user)
    }
    
    @IBAction func readUser(){
        coreDataManager.readUser()
    }
    
    
}

