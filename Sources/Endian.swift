//
//  Endian.swift
//  SimpleBinaryCoder
//
//  Created by 刘栋 on 2018/4/12.
//  Copyright © 2018年 yidongyunshi.com. All rights reserved.
//

import Foundation

public enum Endian {
    case big
    case little
}

extension Endian: CustomStringConvertible {
    
    public var description: String {
        switch self {
        case .big:
            return "BigEndian"
        case .little:
            return "LittleEndian"
        }
    }
}
