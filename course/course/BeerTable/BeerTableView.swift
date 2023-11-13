import UIKit
import Foundation

protocol BeerTableViewDelegate {
    func didSelectRow(_ beerModel: BeerDTO)
}

final class BeerTableView: UIView {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = tableManager
        tableView.delegate = tableManager
        return tableView
    }()
    
    private lazy var tableManager = BeerTableManager()
    var delegate: BeerTableViewDelegate?
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        addSubviews()
        makeConstraints()
        tableManager.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: [BeerDTO]) {
        tableManager.beerData = viewModel
        tableView.reloadData()
    }
    
}

extension BeerTableView: BeerTableManagerDelegate {
    func didSelectRow(_ beerModel: BeerDTO) {
        delegate?.didSelectRow(beerModel)
    }

}


private extension BeerTableView {
    func addSubviews() {
        [tableView].forEach {
            self.addSubview($0)
        }
    }
    func makeConstraints() {
        [tableView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor),
            tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
}
