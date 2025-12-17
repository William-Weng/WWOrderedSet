// MARK: - 有順序的Set集合

import Foundation

public struct WWOrderedSet<Element: Hashable> {
    
    public init(orderedSet: NSMutableOrderedSet = NSMutableOrderedSet()) {
        self.orderedSet = orderedSet
    }
    
    private var orderedSet = NSMutableOrderedSet()
    
    public var count: Int { orderedSet.count }                              /// 元素數量
    public var array: [Element] { orderedSet.array as? [Element] ?? [] }    /// 元素陣列 (直接複製)
    public var first: Element? { firstObject() }                            /// 第一個元素
    public var last: Element? { lastObject() }                              /// 最後一個元素
    public var popFirst: Element? { popFirstObject() }                      /// 彈出第一個元素
    public var popLast: Element? { popLastObject() }                        /// 彈出最後一個元素
}

// MARK: - 公開函數
public extension WWOrderedSet {
    
    /// 取得內容元素值 => orderedSet[0]
    /// - Parameter index: Int
    /// - Returns: Element
    subscript(index: Int) -> Element { object(at: index) }
    
    /// 安全取得內容元素值 => orderedSet[safe: 0]
    /// - Parameter index: Int
    /// - Returns: Element?
    subscript(safe index: Int) -> Element? {
        if (index < 0) { return nil }
        return (index < count) ? object(at: index) : nil
    }
}

// MARK: - 公開函數
public extension WWOrderedSet {
    
    /// 增加內容元素
    /// - Parameter element: Element
    /// - Returns: 內容元素數量
    @discardableResult
    func add(_ element: Element) -> Int {
        orderedSet.add(element)
        return count
    }
    
    /// 刪除內容元素
    /// - Parameter element: Element
    /// - Returns: 內容元素數量
    @discardableResult
    func remove(_ element: Element) -> Int {
        orderedSet.remove(element)
        return count
    }
    
    /// 刪除某個位置的內容元素
    /// - Parameter index: Int
    /// - Returns: 內容元素數量
    @discardableResult
    func remove(at index: Int) -> Int {
        orderedSet.removeObject(at: index)
        return count
    }
    
    /// 移除所有元素
    /// - Returns: 內容元素數量
    @discardableResult
    func removeAll() -> Int {
        orderedSet.removeAllObjects()
        return count
    }
    
    /// 取得某個元素
    /// - Parameter index: Int
    /// - Returns: Element
    func object(at index: Int) -> Element {
        return orderedSet.object(at: index) as! Element
    }
    
    /// 是否有包含該元素
    /// - Parameter element: Element
    /// - Returns: Bool
    func contains(_ element: Element) -> Bool {
        return orderedSet.contains(element)
    }
    
    /// 尋找元素在哪個位置
    /// - Parameter object: Element
    /// - Returns: Int
    func index(of object: Element) -> Int? {
        let index = orderedSet.index(of: object)
        return (index != NSNotFound) ? index : nil
    }
}

// MARK: - 小工具
private extension WWOrderedSet {
    
    /// 取得第一個元素
    /// - Returns: Element?
    func firstObject() -> Element? {
        return orderedSet.firstObject as! Element?
    }
    
    /// 取得最後一個元素
    /// - Returns: Element
    func lastObject() -> Element? {
        return orderedSet.lastObject as! Element?
    }
    
    /// 彈出第一個元素
    /// - Returns: Element?
    func popFirstObject() -> Element? {
        
        guard let element = firstObject() else { return nil }
        
        remove(element)
        return element
    }
    
    /// 彈出最後一個元素
    /// - Returns: Element?
    func popLastObject() -> Element? {
        
        guard let element = lastObject() else { return nil }
        
        remove(element)
        return element
    }
}
