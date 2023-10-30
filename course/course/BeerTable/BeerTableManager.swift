import UIKit
import Foundation

final class BeerTableManager: NSObject {
    var beerData: [BeerDTO] = []
    
}

extension BeerTableManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beerData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let beer = beerData[indexPath.row]
        var cell = UITableViewCell()
        var configuration = cell.defaultContentConfiguration()
    //        configuration.image = UIImage(
        configuration.text = beer.name
        configuration.secondaryText = beer.tagline
        cell.contentConfiguration = configuration
        return cell
    }
}


