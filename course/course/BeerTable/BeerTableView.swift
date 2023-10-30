import UIKit
import Foundation

final class BeerTableView: UIView {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = tableManager as! any UITableViewDataSource
        return tableView
    }()
    
    private lazy var tableManager = BeerTableManager()
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: [BeerDTO]) {
        tableManager.beerData = viewModel
        tableView.reloadData()
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
