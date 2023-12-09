
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
        viewModel.cellTypes.forEach { cell in
            tableView.register(
                cell,
                forCellReuseIdentifier: String(describing: cell)
            )
        }
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
            let item = viewModel.item(atIndex: indexPath.row, section: indexPath.section) as? AnyItemViewModel,
            let cell = tableView.dequeueReusableCell(withIdentifier: item.representableIdentifier) as? AnyTableViewCell
        else {
            assertionFailure("not found \(viewModel.item(atIndex: indexPath.row, section: indexPath.section)!.representableIdentifier)")
            return .init()
        }
        
        cell.configure(with: item)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        viewModel.section(at: section)?.title
    }
}
