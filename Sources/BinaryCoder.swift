//
//  BinaryCoder.swift
//  SimpleBinaryCoder
//
//  Created by 刘栋 on 2018/4/12.
//  Copyright © 2018年 yidongyunshi.com. All rights reserved.
//

import Foundation

public struct BinaryCoder: BinaryCodable, Hashable {
    
    public var binaryData: Data
    public var position: Int
    
    public init(data: Data = Data()) {
        self.binaryData = data
        self.position = 0
    }
    
    public init(bytes: [UInt8]) {
        self.init(data: Data(bytes: bytes))
    }
}
