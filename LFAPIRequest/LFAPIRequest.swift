//
//  APIRequest.swift
//  InstaPanda
//
//  Created by Sebarina Xu on 8/5/15.
//  Copyright (c) 2015 liufan. All rights reserved.
//

import UIKit

public typealias AFAPI_Request_Callback = LFAPIResponse -> Void

public enum LFAPIRequestMethod : String {
    case GET = "GET"
    case POST = "POST"
}

public enum LFAPIRequestProtocol : String {
    case HTTP = "http://"
    case HTTPS = "https://"
}

public class LFAPIRequest {
    var urlString : String
    var requestParams : [String:AnyObject]?
    var requestMethod : LFAPIRequestMethod = .GET
    var requestProtocol : LFAPIRequestProtocol = .HTTPS
    var apiRequestCallback : AFAPI_Request_Callback?
    
    public init(url: String) {
        urlString = url
    }
    
    public func startRequestWithMethod(method: LFAPIRequestMethod, mode: LFAPIRequestProtocol, params:[String:AnyObject], callback: AFAPI_Request_Callback) {
        
        apiRequestCallback = callback
        
        var session = LFNetworkSession()
        
        session.createOperationWithUrlString("\(mode.rawValue)\(urlString)", method: method, params: params, result:{
            (s1: NSData!, s2: NSError!) in
                if s2 == nil {
                    var response : LFAPIResponse = LFAPIResultFormatter.formatResponseData(s1)
                    self.apiRequestCallback?(response)
                } else {
                    var response : LFAPIResponse = LFAPIResponse()
                    response.success = false
                    response.result = nil
                    response.error = s2
                    self.apiRequestCallback?(response)
                }
            
            
            })
        
        session.startRequest()
    }
    
}