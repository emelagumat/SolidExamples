
public protocol AnySection {
    var title: String { get }
    var items: [AnyItemViewModel] { get }
}

public struct DefaultAnySection: AnySection {
    public let title: String
    public let items: [AnyItemViewModel]
    
    public init(title: String, items: [AnyItemViewModel]) {
        self.title = title
        self.items = items
    }
}
