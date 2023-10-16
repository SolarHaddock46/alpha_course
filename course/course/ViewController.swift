//
//  ViewController.swift
//  course
//
//  Created by Владимир Мацнев on 06.10.2023.
//

import UIKit

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        let url: URL = URL(string: "https://api.punkapi.com/v2/beers")!
        URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            guard 
                let data = data,
                let response,
                error == nil
            else {
                return
            }
            let str = String(data: data, encoding: .utf8)
            print(str ?? "")
            print(data)
        }).resume()
    }


}

