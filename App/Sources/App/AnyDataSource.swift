
import Domain
import UIKit

public protocol AnyDataSource {
    func getSections() -> [AnySection]
    func getCellTypes() -> [UITableViewCell.Type]
}
