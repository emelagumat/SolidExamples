
import UIKit
import App

class AnyTableViewController: UITableViewController {
    private let viewModel: AnyTableViewControllerViewModel
    
    init(viewModel: AnyTableViewControllerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
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
            let item = viewModel.item(atIndex: indexPath.row, section: indexPath.section)
        else { return .init() }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: item.identifier)
        
        return cell ?? .init()
    }
}
