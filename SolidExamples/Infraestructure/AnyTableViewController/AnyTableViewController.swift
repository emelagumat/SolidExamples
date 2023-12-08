
import UIKit
import App
import Combine

class AnyTableViewController: UITableViewController {
    private let viewModel: AnyTableViewControllerViewModel
    private var cancellables = Set<AnyCancellable>()
    
    init(viewModel: AnyTableViewControllerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        tableView.register(AnySwitchTableViewCell.self, forCellReuseIdentifier: "AnySwitchTableViewCell")
        tableView.register(AnyIconTableViewCell.self, forCellReuseIdentifier: "AnyIconTableViewCell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - DataSource
extension AnyTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSections()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfItems(in: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let item = viewModel.item(atIndex: indexPath.row, section: indexPath.section),
            let cell = tableView.dequeueReusableCell(withIdentifier: item.representableIdentifier) as? AnyTableViewCell
        else { return .init() }
        
        cell.configure(with: item)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        viewModel.section(at: section)?.title
    }
}
