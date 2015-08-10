//
//  LFNetworkSession.swift
//  InstaPanda
//
//  Created by Sebarina Xu on 8/5/15.
//  Copyright (c) 2015 liufan. All rights reserved.
//

import Foundation

public typealias API_Result_Block = (NSData!, NSError!) -> Void


public class LFNetworkSession : NSObject {

///////////////////设置相关//////////////////////////////////
    
    /**
    *   @brief  管理操作主类
    */
    var request : NSMutableURLRequest = NSMutableURLRequest()
    
    /**
    *   @brief  超时时间，默认10s
    */
    var timeout : NSTimeInterval = 10
    
    /**
    *   @brief  是否允许cache，默认NO
    */
    var enableCache : Bool = false
    
    /**
    *   @brief 请求头，默认为nil
    */
    var requestHeaders : [String: String]?
    
    var resultBlock : API_Result_Block?

    public override init() {
        super.init()
    }
    
    public func createOperationWithUrlString(urlString: String, method: LFAPIRequestMethod, params : [String:AnyObject], result: API_Result_Block) {
        
        resultBlock = result
        request.timeoutInterval = timeout
//        request.cachePolicy = NSURLRequestCachePolicy.
        
        if requestHeaders != nil {
            for (key,value) in requestHeaders! {
                request.addValue(value, forHTTPHeaderField: key)
            }
        }
        request.HTTPMethod = method.rawValue
        if method == .GET {
            var temp : String = urlString.stringByAppendingString("/").stringByAppendingString( String.queryStringFromParameters(params as? [String:String] ?? [String:String]()) ?? "")
            request.URL = NSURL(string: temp)
        } else {
            request.URL = NSURL(string: urlString)
            request.HTTPBody = String.queryStringFromParameters(params as? [String:String] ?? [String:String]())?.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
        }
        
    }
    
    public func startRequest() {
        var session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        session.dataTaskWithRequest(request, completionHandler: {
            (s1: NSData!, s2: NSURLResponse!, s3: NSError!) in
            if s3 == nil {
                self.resultBlock?(s1,nil)
            } else {
                self.resultBlock?(s1,s3)
            }
        })
        
    }
}