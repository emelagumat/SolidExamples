
public protocol AnySection {
    var title: String { get }
    var items: [AnyItemViewRepresentable] { get }
}

public struct DefaultAnySection: AnySection {
    public let title: String
    public let items: [AnyItemViewRepresentable]
    
    public init(title: String, items: [AnyItemViewRepresentable]) {
        self.title = title
        self.items = items
    }
}
