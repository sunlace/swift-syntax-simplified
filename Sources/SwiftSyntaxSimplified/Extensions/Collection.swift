extension Collection {

    var onlyIfNotEmpty: Self? {
        return isEmpty ? nil : self
    }
}

extension Collection where Indices: BidirectionalCollection {
    
    func mapWithIsLast<T>(_ transform: ((element: Iterator.Element, isLast: Bool)) throws -> T) rethrows -> [T] {

        return try zip(self, indices).map { element, index in
            let isLast = index == indices.last

            return try transform((element, isLast))
        }
    }
}
