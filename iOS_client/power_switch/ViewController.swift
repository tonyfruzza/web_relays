//
//  ViewController.swift
//  power_switch
//
//  Created by Anthony Fruzza on 12/14/19.
//  Copyright © 2019 Anthony Fruzza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func showMessage(sender: UIButton) {
        print(sender.titleLabel?.text)
        let session = URLSession.shared
        let url = URL(string: "https://dc8pl6l9557au.cloudfront.net/v1/intermittent_on")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        var hw_id = "unknown"
        if sender.titleLabel?.text == "1 ON" {
            hw_id = "6QMBS_5"
        } else if sender.titleLabel?.text == "1 OFF" {
            hw_id = "6QMBS_6"
        } else if sender.titleLabel?.text == "2 OFF" {
            hw_id = "6QMBS_7"
        }else if sender.titleLabel?.text == "2 ON" {
            hw_id = "6QMBS_8"
        }else if sender.titleLabel?.text == "3 OFF" {
            hw_id = "6QMBS_3"
        }else if sender.titleLabel?.text == "3 ON" {
            hw_id = "6QMBS_4"
        }

        let parameters: [String: Any] = [
            "id": hw_id
        ]
        let jsonData = try? JSONSerialization.data(withJSONObject: parameters)
        request.httpBody = jsonData
        let task = session.dataTask(with: request) { data, response, error in
            print(data)
            print(response)
            print(error)
        }
        task.resume()
    }

}
