//
//  APIResponse.swift
//  InstaPanda
//
//  Created by Sebarina Xu on 8/5/15.
//  Copyright (c) 2015 liufan. All rights reserved.
//

import Foundation

public struct LFAPIResponse {
    var success : Bool
    var result : AnyObject?
    var error : NSError?
    
    public init() {
        success = false
    }
}