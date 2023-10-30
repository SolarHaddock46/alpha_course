import UIKit

final class BeerTableViewController: UIViewController {
    
    private lazy var contentView: BeerTableView = {
        let view = BeerTableView()
        return view
    }()
    
    private let service = BeerService()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        service.fetchBeer { beers in
            DispatchQueue.main.async {
                contentView.configure(with: beers)
            }
        }
    }
}
