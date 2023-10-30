//
//  BeerTableViewControllerFactory.swift
//  course
//
//  Created by Владимир Мацнев on 30.10.2023.
//

import Foundation

final class BeerTableViewControllerFactory {
    func build() -> BeerTableViewController {
        let service = BeerService()
        let viewController = BeerTableViewController(service: service)
        return viewController
    }
}
