//
//  BinarySize.swift
//  SimpleBinaryCoder
//
//  Created by 刘栋 on 2018/4/12.
//  Copyright © 2018年 yidongyunshi.com. All rights reserved.
//

import Foundation

enum BinarySize {
    case uint8, int8
    case uint16, int16
    case uint24
    case uint32, int32
    case uint64, int64
    case float
    case double
    
    var size: Int {
        switch self {
        case .uint8:
            return MemoryLayout<UInt8>.size
        case .int8:
            return MemoryLayout<Int8>.size
        case .uint16:
            return MemoryLayout<UInt16>.size
        case .int16:
            return MemoryLayout<Int16>.size
        case .uint24:
            return 3
        case .uint32:
            return MemoryLayout<UInt32>.size
        case .int32:
            return MemoryLayout<Int32>.size
        case .uint64:
            return MemoryLayout<UInt64>.size
        case .int64:
            return MemoryLayout<Int64>.size
        case .float:
            return MemoryLayout<Float>.size
        case .double:
            return MemoryLayout<Double>.size
        }
    }
}
