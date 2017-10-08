//
//  TimePoint.swift
//  EonilTimePoint
//
//  Created by Hoon H. on 2017/10/08.
//
//

///
/// A series of globally unique and ordered key.
///
/// - Key resolution & key space is infinite. You can spawn
///   `TimePoint` infinitely as long as memory allows.
///
public struct TimePoint: Hashable, Comparable, CustomDebugStringConvertible {
    private let impl: TimePointImpl
    internal init(impl: TimePointImpl) {
        self.impl = impl
    }
    public var hashValue: Int {
        return impl.hashValue
    }
    public var debugDescription: String {
        return impl.debugDescription
    }
    public static func == (_ a: TimePoint, _ b: TimePoint) -> Bool {
        return a.impl == b.impl
    }
    public static func < (_ a: TimePoint, _ b: TimePoint) -> Bool {
        return a.impl < b.impl
    }
}

