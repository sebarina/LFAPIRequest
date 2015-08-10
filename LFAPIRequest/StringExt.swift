//
//  StringExt.swift
//  LFSNSKit
//
//  Created by Sebarina Xu on 8/7/15.
//  Copyright (c) 2015 liufan. All rights reserved.
//

import Foundation

extension String {
    
    func URLEncodedString() -> String? {
        var customAllowedSet =  NSCharacterSet.URLQueryAllowedCharacterSet()
        var escapedString = self.stringByAddingPercentEncodingWithAllowedCharacters(customAllowedSet)
        return escapedString
    }
    static func queryStringFromParameters(parameters: Dictionary<String,String>) -> String? {
        if (parameters.count == 0)
        {
            return nil
        }
        var queryString : String? = nil
        for (key, value) in parameters {
            if let encodedKey = key.URLEncodedString() {
                if let encodedValue = value.URLEncodedString() {
                    if queryString == nil
                    {
                        queryString = "?"
                    }
                    else
                    {
                        queryString! += "&"
                    }
                    queryString! += encodedKey + "=" + encodedValue
                }
            }
        }
        return queryString
    }
}