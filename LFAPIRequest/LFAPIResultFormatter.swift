//
//  LFAPIResultFormater.swift
//  InstaPanda
//
//  Created by Sebarina Xu on 8/5/15.
//  Copyright (c) 2015 liufan. All rights reserved.
//

import Foundation

public class LFAPIResultFormatter {
    public class func formatResponseData(response : NSData?) -> LFAPIResponse {
        var apiResponse : LFAPIResponse = LFAPIResponse()
        
        if response == nil {
            apiResponse.success = false
            apiResponse.result = nil
            apiResponse.error = NSError(domain: "test", code: 500, userInfo: ["error":"Server error!"])
        } else {
            var obj: AnyObject? = NSJSONSerialization.JSONObjectWithData(response!, options: NSJSONReadingOptions.MutableContainers, error: nil)
            if obj == nil {
                apiResponse.success = false
                apiResponse.result = nil
                apiResponse.error = NSError(domain: "test", code: 500, userInfo: ["error":"Server error!"])
            } else {
                apiResponse.success = true
                apiResponse.result = obj
                apiResponse.error = nil
            }
        }
        
        
        return apiResponse
    }
}