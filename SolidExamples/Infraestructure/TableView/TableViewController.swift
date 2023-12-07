
import UIKit
import App

class TableViewController: UITableViewController {
    private let viewModel: TableViewControllerViewModel
    
    init(viewModel: TableViewControllerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

