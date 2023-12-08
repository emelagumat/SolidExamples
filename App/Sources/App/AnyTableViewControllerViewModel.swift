
import Domain

public final class AnyTableViewControllerViewModel {
    private let dataSource: AnyDataSource
    private let coordinator: AnyTableViewControllerCoordinator
    
    public init(dataSource: AnyDataSource, coordinator: AnyTableViewControllerCoordinator) {
        self.dataSource = dataSource
        self.coordinator = coordinator
    }
}

public extension AnyTableViewControllerViewModel {
    func numberOfSections() -> Int {
        dataSource.getSections().count
    }
    
    func numberOfItems(in section: Int) -> Int {
        dataSource.getSections()[section].items.count
    }
    
    func item(atIndex index: Int, section: Int) -> AnyItemViewModel? {
        dataSource.getSections()[section].items[index] // safe!!
    }
    
    func section(at index: Int) -> AnySection? {
        dataSource.getSections()[index]
    }
}
