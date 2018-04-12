//
//  BinaryCodable.swift
//  SimpleBinaryCoder
//
//  Created by 刘栋 on 2017/10/16.
//  Copyright © 2017年 yidongyunshi.com. All rights reserved.
//

import Foundation

public protocol BinaryCodable {
    
    var binaryData: Data { get set }
    var length: Int { get }
    var position: Int { get set }
    var bytesAvailable: Int { get }
    
    subscript(i: Int) -> UInt8 { get set }
    
    mutating func encode(int8: Int8)
    mutating func decodeInt8() throws -> Int8
    
    mutating func encode(uint8: UInt8)
    mutating func decodeUInt8() throws -> UInt8
    
    mutating func encode(int16: Int16, endian: Endian)
    mutating func decodeInt16(endian: Endian) throws -> Int16
    
    mutating func encode(uint16: UInt16, endian: Endian)
    mutating func decodeUInt16(endian: Endian) throws -> UInt16
    
    mutating func encode(uint24: UInt32, endian: Endian)
    mutating func decodeUInt24(endian: Endian) throws -> UInt32
    
    mutating func encode(int32: Int32, endian: Endian)
    mutating func decodeInt32(endian: Endian) throws -> Int32
    
    mutating func encode(uint32: UInt32, endian: Endian)
    mutating func decodeUInt32(endian: Endian) throws -> UInt32
    
    mutating func encode(int64: Int64, endian: Endian)
    mutating func decodeInt64(endian: Endian) throws -> Int64
    
    mutating func encode(uint64: UInt64, endian: Endian)
    mutating func decodeUInt64(endian: Endian) throws -> UInt64
    
    mutating func encode(float: Float, endian: Endian)
    mutating func decodeFloat(endian: Endian) throws -> Float
    
    mutating func encode(double: Double, endian: Endian)
    mutating func decodeDouble(endian: Endian) throws -> Double
    
    mutating func encode(utf8 string: String)
    mutating func decodeUTF8String(length: Int) throws -> String
    
    mutating func encode(data: Data)
    mutating func decodeData(length: Int) throws -> Data
}

public extension BinaryCodable {
    
    var length: Int {
        return binaryData.count
    }
    
    var bytesAvailable: Int {
        return binaryData.count - position
    }
    
    subscript(i: Int) -> UInt8 {
        get {
            return binaryData[i]
        }
        set {
            binaryData[i] = newValue
        }
    }
    
    mutating func encode(int8: Int8) {
        let data = UInt8(bitPattern: int8).data
        encode(data: data)
    }
    
    mutating func decodeInt8() throws -> Int8 {
        let data = try decodeData(length: .int8)
        return Int8(bitPattern: UInt8(data: data))
    }
    
    mutating func encode(uint8: UInt8) {
        let data = uint8.data
        encode(data: data)
    }
    
    mutating func decodeUInt8() throws -> UInt8 {
        let data = try decodeData(length: .uint8)
        return UInt8(data: data)
    }
    
    mutating func encode(int16: Int16, endian: Endian) {
        let data: Data
        switch endian {
        case .big:
            data = int16.bigEndian.data
        case .little:
            data = int16.littleEndian.data
        }
        encode(data: data)
    }
    
    mutating func decodeInt16(endian: Endian) throws -> Int16 {
        let data = try decodeData(length: .int16)
        switch endian {
        case .big:
            return Int16(data: data).bigEndian
        case .little:
            return Int16(data: data).littleEndian
        }
    }
    
    mutating func encode(uint16: UInt16, endian: Endian) {
        let data: Data
        switch endian {
        case .big:
            data = uint16.bigEndian.data
        case .little:
            data = uint16.littleEndian.data
        }
        encode(data: data)
    }
    
    mutating func decodeUInt16(endian: Endian) throws -> UInt16 {
        let data = try decodeData(length: .uint16)
        switch endian {
        case .big:
            return UInt16(data: data).bigEndian
        case .little:
            return UInt16(data: data).littleEndian
        }
    }
    
    mutating func encode(uint24: UInt32, endian: Endian) {
        let data: Data
        switch endian {
        case .big:
            data = uint24.bigEndian.data.subdata(in: 1..<(BinarySize.uint24.size + 1))
        case .little:
            data = uint24.littleEndian.data.subdata(in: 0..<BinarySize.uint24.size)
        }
        encode(data: data)
    }
    
    mutating func decodeUInt24(endian: Endian) throws -> UInt32 {
        let data = try decodeData(length: .uint24)
        switch endian {
        case .big:
            return UInt32(data: (Data([0x00]) + data)).bigEndian
        case .little:
            return UInt32(data: (data + Data([0x00]))).littleEndian
        }
    }
    
    mutating func encode(int32: Int32, endian: Endian) {
        let data: Data
        switch endian {
        case .big:
            data = int32.bigEndian.data
        case .little:
            data = int32.littleEndian.data
        }
        encode(data: data)
    }
    
    mutating func decodeInt32(endian: Endian) throws -> Int32 {
        let data = try decodeData(length: .int32)
        switch endian {
        case .big:
            return Int32(data: data).bigEndian
        case .little:
            return Int32(data: data).littleEndian
        }
    }
    
    mutating func encode(uint32: UInt32, endian: Endian) {
        let data: Data
        switch endian {
        case .big:
            data = uint32.bigEndian.data
        case .little:
            data = uint32.littleEndian.data
        }
        encode(data: data)
    }
    
    mutating func decodeUInt32(endian: Endian) throws -> UInt32 {
        let data: Data = try decodeData(length: .uint32)
        switch endian {
        case .big:
            return UInt32(data: data).bigEndian
        case .little:
            return UInt32(data: data).littleEndian
        }
    }
    
    mutating func encode(int64: Int64, endian: Endian) {
        let data: Data
        switch endian {
        case .big:
            data = int64.bigEndian.data
        case .little:
            data = int64.littleEndian.data
        }
        encode(data: data)
    }
    
    mutating func decodeInt64(endian: Endian) throws -> Int64 {
        let data = try decodeData(length: .int64)
        switch endian {
        case .big:
            return Int64(data: data).bigEndian
        case .little:
            return Int64(data: data).littleEndian
        }
    }
    
    mutating func encode(uint64: UInt64, endian: Endian) {
        let data: Data
        switch endian {
        case .big:
            data = uint64.bigEndian.data
        case .little:
            data = uint64.littleEndian.data
        }
        encode(data: data)
    }
    
    mutating func decodeUInt64(endian: Endian) throws -> UInt64 {
        let data: Data = try decodeData(length: .uint64)
        switch endian {
        case .big:
            return UInt64(data: data).bigEndian
        case .little:
            return UInt64(data: data).littleEndian
        }
    }
    
    mutating func encode(float: Float, endian: Endian) {
        let data: Data
        switch endian {
        case .big:
            data = Data(float.data.reversed())
        case .little:
            data = Data(float.data)
        }
        encode(data: data)
    }
    
    mutating func decodeFloat(endian: Endian) throws -> Float {
        let data = try decodeData(length: .float)
        switch endian {
        case .big:
            return Float(data: data.reversed())
        case .little:
            return Float(data: data)
        }
    }
    
    mutating func encode(double: Double, endian: Endian) {
        let data: Data
        switch endian {
        case .big:
            data = Data(double.data.reversed())
        case .little:
            data = Data(double.data)
        }
        encode(data: data)
    }
    
    mutating func decodeDouble(endian: Endian) throws -> Double {
        let data = try decodeData(length: .double)
        switch endian {
        case .big:
            return Double(data: data.reversed())
        case .little:
            return Double(data: data)
        }
    }
    
    mutating func encode(utf8 string: String) {
        let data = Data(string.utf8)
        encode(data: data)
    }
    
    mutating func decodeUTF8String(length: Int) throws -> String {
        let data = try decodeData(length: length)
        guard let result = String(data: data, encoding: .utf8) else {
            throw BinaryCodableError.stringDecoding
        }
        return result
    }
    
    mutating func encode(data: Data) {
        if position == binaryData.count {
            binaryData.append(data)
            position += data.count
        } else if position < binaryData.count {
            let appendData = Data(repeating: 0x00, count: binaryData.count - position)
            binaryData.append(appendData)
            binaryData.append(data)
            position = binaryData.count
        } else {
            let newPosition = position + data.count
            if newPosition < binaryData.count {
                binaryData.replaceSubrange(position..<newPosition, with: data)
            } else {
                binaryData.removeSubrange(position...)
                binaryData.append(data)
            }
            position = newPosition
        }
    }
    
    private mutating func decodeData(length: BinarySize) throws -> Data {
        return try decodeData(length: length.size)
    }
    
    mutating func decodeData(length: Int) throws -> Data {
        guard bytesAvailable >= length else {
            throw BinaryCodableError.eof
        }
        let result = binaryData.subdata(in: position..<(position + length))
        position += length
        return result
    }
}
