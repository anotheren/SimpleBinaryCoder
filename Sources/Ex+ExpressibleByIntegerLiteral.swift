//
//  Ex+ExpressibleByIntegerLiteral.swift
//  SimpleBinaryCoder
//
//  Created by 刘栋 on 2017/10/11.
//  Copyright © 2017年 yidongyunshi.com. All rights reserved.
//

import Foundation

extension ExpressibleByIntegerLiteral {
    
    public var data: Data {
        var value: Self = self
        let size: Int = MemoryLayout<Self>.size
        return withUnsafeMutablePointer(to: &value) {
            $0.withMemoryRebound(to: UInt8.self, capacity: size) {
                Data(UnsafeBufferPointer(start: $0, count: size))
            }
        }
    }
    
    public init(data: Data) {
        let diff: Int = MemoryLayout<Self>.size - data.count
        if diff > 0 {
            var buffer: Data = Data(repeating: 0, count: diff)
            buffer.append(data)
            self = buffer.withUnsafeBytes { $0.pointee }
        } else {
            self = data.withUnsafeBytes { $0.pointee }
        }
    }
}

extension ExpressibleByIntegerLiteral {
    
    public init(data: ReversedCollection<Data>) {
        self.init(data: Data(data))
    }
}
