//
//  TestBinaryCoder.swift
//  SimpleBinaryCoderTests
//
//  Created by 刘栋 on 2018/4/12.
//  Copyright © 2018年 yidongyunshi.com. All rights reserved.
//

import XCTest
@testable import SimpleBinaryCoder

class TestBinaryCoder: XCTestCase {
    
    func testInt8() {
        let min: Int8 = .min
        let max: Int8 = .max
        let one: Int8 = 1
        
        // encode
        var coder = BinaryCoder()
        coder.encode(int8: min)
        coder.encode(int8: max)
        coder.encode(int8: one)
        // decode
        coder.position = 0
        do {
            let min2 = try coder.decodeInt8()
            assert(min == min2, "Fail when UInt8=\(min)")
            let max2 = try coder.decodeInt8()
            assert(max == max2, "Fail when UInt8=\(max)")
            let one2 = try coder.decodeInt8()
            assert(one == one2, "Fail when UInt8=\(one)")
        } catch let binaryError as BinaryCodableError {
            assertionFailure("\(binaryError)")
        } catch let otherError {
            assertionFailure("\(otherError)")
        }
    }
    
    func testUInt8() {
        let min: UInt8 = .min
        let max: UInt8 = .max
        let one: UInt8 = 1
        
        // encode
        var coder = BinaryCoder()
        coder.encode(uint8: min)
        coder.encode(uint8: max)
        coder.encode(uint8: one)
        // decode
        coder.position = 0
        do {
            let min2 = try coder.decodeUInt8()
            assert(min == min2, "Fail when UInt8=\(min)")
            let max2 = try coder.decodeUInt8()
            assert(max == max2, "Fail when UInt8=\(max)")
            let one2 = try coder.decodeUInt8()
            assert(one == one2, "Fail when UInt8=\(one)")
        } catch let binaryError as BinaryCodableError {
            assertionFailure("\(binaryError)")
        } catch let otherError {
            assertionFailure("\(otherError)")
        }
    }
    
    func testInt16() {
        let min: Int16 = .min
        let max: Int16 = .max
        let one: Int16 = 1
        
        // encode
        var coder = BinaryCoder()
        coder.encode(int16: min, endian: .big)
        coder.encode(int16: min, endian: .little)
        coder.encode(int16: max, endian: .big)
        coder.encode(int16: max, endian: .little)
        coder.encode(int16: one, endian: .big)
        coder.encode(int16: one, endian: .little)
        // decode
        coder.position = 0
        do {
            let min2_big = try coder.decodeInt16(endian: .big)
            assert(min == min2_big, "Fail when Int16=\(min), endian=\(Endian.big)")
            let min2_little = try coder.decodeInt16(endian: .little)
            assert(min == min2_little, "Fail when Int16=\(min), endian=\(Endian.little)")
            
            let max2_big = try coder.decodeInt16(endian: .big)
            assert(max == max2_big, "Fail when Int16=\(max), endian=\(Endian.big)")
            let max2_little = try coder.decodeInt16(endian: .little)
            assert(max == max2_little, "Fail when Int16=\(max), endian=\(Endian.little)")
            
            let one2_big = try coder.decodeInt16(endian: .big)
            assert(one == one2_big, "Fail when Int16=\(one), endian=\(Endian.big)")
            let one2_little = try coder.decodeInt16(endian: .little)
            assert(one == one2_little, "Fail when Int16=\(one), endian=\(Endian.little)")
        } catch let binaryError as BinaryCodableError {
            assertionFailure("\(binaryError)")
        } catch let otherError {
            assertionFailure("\(otherError)")
        }
    }
    
    func testUInt16() {
        let min: UInt16 = .min
        let max: UInt16 = .max
        let one: UInt16 = 1
        
        // encode
        var coder = BinaryCoder()
        coder.encode(uint16: min, endian: .big)
        coder.encode(uint16: min, endian: .little)
        coder.encode(uint16: max, endian: .big)
        coder.encode(uint16: max, endian: .little)
        coder.encode(uint16: one, endian: .big)
        coder.encode(uint16: one, endian: .little)
        // decode
        coder.position = 0
        do {
            let min2_big = try coder.decodeUInt16(endian: .big)
            assert(min == min2_big, "Fail when UInt16=\(min), endian=\(Endian.big)")
            let min2_little = try coder.decodeUInt16(endian: .little)
            assert(min == min2_little, "Fail when UInt16=\(min), endian=\(Endian.little)")
            
            let max2_big = try coder.decodeUInt16(endian: .big)
            assert(max == max2_big, "Fail when UInt16=\(max), endian=\(Endian.big)")
            let max2_little = try coder.decodeUInt16(endian: .little)
            assert(max == max2_little, "Fail when UInt16=\(max), endian=\(Endian.little)")
            
            let one2_big = try coder.decodeUInt16(endian: .big)
            assert(one == one2_big, "Fail when UInt16=\(one), endian=\(Endian.big)")
            let one2_little = try coder.decodeUInt16(endian: .little)
            assert(one == one2_little, "Fail when UInt16=\(one), endian=\(Endian.little)")
        } catch let binaryError as BinaryCodableError {
            assertionFailure("\(binaryError)")
        } catch let otherError {
            assertionFailure("\(otherError)")
        }
    }
    
    func testUInt24() {
        let min: UInt32 = .min
        let max: UInt32 = UInt32(pow(2.0, 24.0) - 1.0)
        let one: UInt32 = 1
        
        // encode
        var coder = BinaryCoder()
        coder.encode(uint24: min, endian: .big)
        coder.encode(uint24: min, endian: .little)
        coder.encode(uint24: max, endian: .big)
        coder.encode(uint24: max, endian: .little)
        coder.encode(uint24: one, endian: .big)
        coder.encode(uint24: one, endian: .little)
        // decode
        coder.position = 0
        do {
            let min2_big = try coder.decodeUInt24(endian: .big)
            assert(min == min2_big, "Fail when UInt24=\(min), endian=\(Endian.big)")
            let min2_little = try coder.decodeUInt24(endian: .little)
            assert(min == min2_little, "Fail when UInt24=\(min), endian=\(Endian.little)")
            
            let max2_big = try coder.decodeUInt24(endian: .big)
            assert(max == max2_big, "Fail when UInt24=\(max), endian=\(Endian.big)")
            let max2_little = try coder.decodeUInt24(endian: .little)
            assert(max == max2_little, "Fail when UInt24=\(max), endian=\(Endian.little)")
            
            let one2_big = try coder.decodeUInt24(endian: .big)
            assert(one == one2_big, "Fail when UInt24=\(one), endian=\(Endian.big)")
            let one2_little = try coder.decodeUInt24(endian: .little)
            assert(one == one2_little, "Fail when UInt24=\(one), endian=\(Endian.little)")
        } catch let binaryError as BinaryCodableError {
            assertionFailure("\(binaryError)")
        } catch let otherError {
            assertionFailure("\(otherError)")
        }
    }
    
    func testInt32() {
        let min: Int32 = .min
        let max: Int32 = .max
        let one: Int32 = 1
        
        // encode
        var coder = BinaryCoder()
        coder.encode(int32: min, endian: .big)
        coder.encode(int32: min, endian: .little)
        coder.encode(int32: max, endian: .big)
        coder.encode(int32: max, endian: .little)
        coder.encode(int32: one, endian: .big)
        coder.encode(int32: one, endian: .little)
        // decode
        coder.position = 0
        do {
            let min2_big = try coder.decodeInt32(endian: .big)
            assert(min == min2_big, "Fail when Int32=\(min), endian=\(Endian.big)")
            let min2_little = try coder.decodeInt32(endian: .little)
            assert(min == min2_little, "Fail when Int32=\(min), endian=\(Endian.little)")
            
            let max2_big = try coder.decodeInt32(endian: .big)
            assert(max == max2_big, "Fail when Int32=\(max), endian=\(Endian.big)")
            let max2_little = try coder.decodeInt32(endian: .little)
            assert(max == max2_little, "Fail when Int32=\(max), endian=\(Endian.little)")
            
            let one2_big = try coder.decodeInt32(endian: .big)
            assert(one == one2_big, "Fail when Int32=\(one), endian=\(Endian.big)")
            let one2_little = try coder.decodeInt32(endian: .little)
            assert(one == one2_little, "Fail when Int32=\(one), endian=\(Endian.little)")
        } catch let binaryError as BinaryCodableError {
            assertionFailure("\(binaryError)")
        } catch let otherError {
            assertionFailure("\(otherError)")
        }
    }
    
    func testUInt32() {
        let min: UInt32 = .min
        let max: UInt32 = .max
        let one: UInt32 = 1
        
        // encode
        var coder = BinaryCoder()
        coder.encode(uint32: min, endian: .big)
        coder.encode(uint32: min, endian: .little)
        coder.encode(uint32: max, endian: .big)
        coder.encode(uint32: max, endian: .little)
        coder.encode(uint32: one, endian: .big)
        coder.encode(uint32: one, endian: .little)
        // decode
        coder.position = 0
        do {
            let min2_big = try coder.decodeUInt32(endian: .big)
            assert(min == min2_big, "Fail when UInt32=\(min), endian=\(Endian.big)")
            let min2_little = try coder.decodeUInt32(endian: .little)
            assert(min == min2_little, "Fail when UInt32=\(min), endian=\(Endian.little)")
            
            let max2_big = try coder.decodeUInt32(endian: .big)
            assert(max == max2_big, "Fail when UInt32=\(max), endian=\(Endian.big)")
            let max2_little = try coder.decodeUInt32(endian: .little)
            assert(max == max2_little, "Fail when UInt32=\(max), endian=\(Endian.little)")
            
            let one2_big = try coder.decodeUInt32(endian: .big)
            assert(one == one2_big, "Fail when UInt32=\(one), endian=\(Endian.big)")
            let one2_little = try coder.decodeUInt32(endian: .little)
            assert(one == one2_little, "Fail when UInt32=\(one), endian=\(Endian.little)")
        } catch let binaryError as BinaryCodableError {
            assertionFailure("\(binaryError)")
        } catch let otherError {
            assertionFailure("\(otherError)")
        }
    }
    
    func testInt64() {
        let min: Int64 = .min
        let max: Int64 = .max
        let one: Int64 = 1
        
        // encode
        var coder = BinaryCoder()
        coder.encode(int64: min, endian: .big)
        coder.encode(int64: min, endian: .little)
        coder.encode(int64: max, endian: .big)
        coder.encode(int64: max, endian: .little)
        coder.encode(int64: one, endian: .big)
        coder.encode(int64: one, endian: .little)
        // decode
        coder.position = 0
        do {
            let min2_big = try coder.decodeInt64(endian: .big)
            assert(min == min2_big, "Fail when Int64=\(min), endian=\(Endian.big)")
            let min2_little = try coder.decodeInt64(endian: .little)
            assert(min == min2_little, "Fail when Int64=\(min), endian=\(Endian.little)")
            
            let max2_big = try coder.decodeInt64(endian: .big)
            assert(max == max2_big, "Fail when Int64=\(max), endian=\(Endian.big)")
            let max2_little = try coder.decodeInt64(endian: .little)
            assert(max == max2_little, "Fail when Int64=\(max), endian=\(Endian.little)")
            
            let one2_big = try coder.decodeInt64(endian: .big)
            assert(one == one2_big, "Fail when Int64=\(one), endian=\(Endian.big)")
            let one2_little = try coder.decodeInt64(endian: .little)
            assert(one == one2_little, "Fail when Int64=\(one), endian=\(Endian.little)")
        } catch let binaryError as BinaryCodableError {
            assertionFailure("\(binaryError)")
        } catch let otherError {
            assertionFailure("\(otherError)")
        }
    }
    
    func testUInt64() {
        let min: UInt64 = .min
        let max: UInt64 = .max
        let one: UInt64 = 1
        
        // encode
        var coder = BinaryCoder()
        coder.encode(uint64: min, endian: .big)
        coder.encode(uint64: min, endian: .little)
        coder.encode(uint64: max, endian: .big)
        coder.encode(uint64: max, endian: .little)
        coder.encode(uint64: one, endian: .big)
        coder.encode(uint64: one, endian: .little)
        // decode
        coder.position = 0
        do {
            let min2_big = try coder.decodeUInt64(endian: .big)
            assert(min == min2_big, "Fail when UInt64=\(min), endian=\(Endian.big)")
            let min2_little = try coder.decodeUInt64(endian: .little)
            assert(min == min2_little, "Fail when UInt64=\(min), endian=\(Endian.little)")
            
            let max2_big = try coder.decodeUInt64(endian: .big)
            assert(max == max2_big, "Fail when UInt64=\(max), endian=\(Endian.big)")
            let max2_little = try coder.decodeUInt64(endian: .little)
            assert(max == max2_little, "Fail when UInt64=\(max), endian=\(Endian.little)")
            
            let one2_big = try coder.decodeUInt64(endian: .big)
            assert(one == one2_big, "Fail when UInt64=\(one), endian=\(Endian.big)")
            let one2_little = try coder.decodeUInt64(endian: .little)
            assert(one == one2_little, "Fail when UInt64=\(one), endian=\(Endian.little)")
        } catch let binaryError as BinaryCodableError {
            assertionFailure("\(binaryError)")
        } catch let otherError {
            assertionFailure("\(otherError)")
        }
    }
    
    func testFloat() {
        let min: Float = .leastNonzeroMagnitude
        let max: Float = .greatestFiniteMagnitude
        let pi: Float = .pi
        
        // encode
        var coder = BinaryCoder()
        coder.encode(float: min, endian: .big)
        coder.encode(float: min, endian: .little)
        coder.encode(float: max, endian: .big)
        coder.encode(float: max, endian: .little)
        coder.encode(float: pi, endian: .big)
        coder.encode(float: pi, endian: .little)
        // decode
        coder.position = 0
        do {
            let min2_big = try coder.decodeFloat(endian: .big)
            assert(min == min2_big, "Fail when Float=\(min), endian=\(Endian.big)")
            let min2_little = try coder.decodeFloat(endian: .little)
            assert(min == min2_little, "Fail when Float=\(min), endian=\(Endian.little)")
            
            let max2_big = try coder.decodeFloat(endian: .big)
            assert(max == max2_big, "Fail when Float=\(max), endian=\(Endian.big)")
            let max2_little = try coder.decodeFloat(endian: .little)
            assert(max == max2_little, "Fail when Float=\(max), endian=\(Endian.little)")
            
            let pi2_big = try coder.decodeFloat(endian: .big)
            assert(pi == pi2_big, "Fail when Float=\(pi), endian=\(Endian.big)")
            let pi2_little = try coder.decodeFloat(endian: .little)
            assert(pi == pi2_little, "Fail when Float=\(pi), endian=\(Endian.little)")
        } catch let binaryError as BinaryCodableError {
            assertionFailure("\(binaryError)")
        } catch let otherError {
            assertionFailure("\(otherError)")
        }
    }
    
    func testDouble() {
        let min: Double = .leastNonzeroMagnitude
        let max: Double = .greatestFiniteMagnitude
        let pi: Double = .pi
        
        // encode
        var coder = BinaryCoder()
        coder.encode(double: min, endian: .big)
        coder.encode(double: min, endian: .little)
        coder.encode(double: max, endian: .big)
        coder.encode(double: max, endian: .little)
        coder.encode(double: pi, endian: .big)
        coder.encode(double: pi, endian: .little)
        // decode
        coder.position = 0
        do {
            let min2_big = try coder.decodeDouble(endian: .big)
            assert(min == min2_big, "Fail when Double=\(min), endian=\(Endian.big)")
            let min2_little = try coder.decodeDouble(endian: .little)
            assert(min == min2_little, "Fail when Double=\(min), endian=\(Endian.little)")
            
            let max2_big = try coder.decodeDouble(endian: .big)
            assert(max == max2_big, "Fail when Double=\(max), endian=\(Endian.big)")
            let max2_little = try coder.decodeDouble(endian: .little)
            assert(max == max2_little, "Fail when Double=\(max), endian=\(Endian.little)")
            
            let pi2_big = try coder.decodeDouble(endian: .big)
            assert(pi == pi2_big, "Fail when Double=\(pi), endian=\(Endian.big)")
            let pi2_little = try coder.decodeDouble(endian: .little)
            assert(pi == pi2_little, "Fail when Double=\(pi), endian=\(Endian.little)")
        } catch let binaryError as BinaryCodableError {
            assertionFailure("\(binaryError)")
        } catch let otherError {
            assertionFailure("\(otherError)")
        }
    }
    
    func testUTFString() {
        let one: String = "test one"
        let two: String = "test two"
        let space: String = ""
        
        // encode
        var coder = BinaryCoder()
        coder.encode(utf8: one)
        coder.encode(utf8: two)
        coder.encode(utf8: space)

        // decode
        coder.position = 0
        do {
            let one2 = try coder.decodeUTF8String(length: one.count)
            assert(one == one2, "Fail when String=\(one), length=\(one.count)")
            let two2 = try coder.decodeUTF8String(length: two.count)
            assert(two == two2, "Fail when String=\(two), length=\(two.count)")
            let space2 = try coder.decodeUTF8String(length: space.count)
            assert(space == space2, "Fail when String=\(space), length=\(space.count)")
        } catch let binaryError as BinaryCodableError {
            assertionFailure("\(binaryError)")
        } catch let otherError {
            assertionFailure("\(otherError)")
        }
    }
}
