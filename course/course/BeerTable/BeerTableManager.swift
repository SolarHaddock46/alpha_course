import UIKit
import Foundation


// MARK: - BeerTableManagerDelegate

protocol BeerTableManagerDelegate {
    func didSelectRow(_ beerModel: BeerDTO)
}

final class BeerTableManager: NSObject {
    var delegate: BeerTableManagerDelegate?
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

extension BeerTableManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.didSelectRow(beerData[indexPath.row])
    }
}


