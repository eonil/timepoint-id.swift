//
//  Tests.swift
//  Tests
//
//  Created by Hoon H. on 2017/10/08.
//

import XCTest
@testable import EonilTimePoint

class Tests: XCTestCase {
    func testTimePointComparison() {
        let p1 = TimeLine.spawn()
        let p2 = TimeLine.spawn()
        XCTAssertLessThan(p1, p2)
    }
    func testTimeLineSegmentation() {
        let t = TimeLine(maxSegmentCount: 2, maxPointCountInSegment: 4)
        var ps = [TimePointImpl]()
        for _ in 0..<8 {
            ps.append(t.append())
        }
        XCTAssert(t.segments.count == 2)
        XCTAssert(t.segments[0].pointCount == 4)
        XCTAssert(t.segments[1].pointCount == 4)
        XCTAssertEqual(ps.sorted(), ps)
        XCTAssertEqual([ps[3], ps[2], ps[0], ps[5]].sorted(), [ps[0], ps[2], ps[3], ps[5]])
    }
    func testTimeLineCompaction() {
        let t = TimeLine(maxSegmentCount: 2, maxPointCountInSegment: 4)
        var ps = [TimePointImpl]()
        for _ in 0..<8 {
            ps.append(t.append())
        }
        ps.removeAll()
        XCTAssert(t.segments.count == 1)
        XCTAssert(t.segments[0].pointCount == 0)
    }
}
