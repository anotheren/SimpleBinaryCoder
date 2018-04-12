//
//  BinaryCodableError.swift
//  SimpleBinaryCoder
//
//  Created by 刘栋 on 2018/4/12.
//  Copyright © 2018年 yidongyunshi.com. All rights reserved.
//

import Foundation

public enum BinaryCodableError: Error {
    case eof
    case stringDecoding
}
