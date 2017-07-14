//
//  ServerManager.swift
//  test
//
//  Created by Arkadiy Grigoryanc on 14.07.17.
//  Copyright © 2017 Olya Danylova. All rights reserved.
//

import Foundation

class ServerManager {
    
    // MARK: - Initialization methods
    
    static let manager = ServerManager()
    
    private init() {
        
        BackendlessData.backendless.hostURL = SERVER_URL
        BackendlessData.backendless.initApp(APPLICATION_ID, apiKey: API_KEY)
        
        print("ServerManager Initialized")
        
    }
    
    // MARK: -
    
    private let APPLICATION_ID = "7F8AC5BF-6E47-E00D-FFC6-B77E03D08D00"
    private let API_KEY = "1D90D4CE-FE28-EB9D-FFF5-60D30F942300"
    private let SERVER_URL = "https://api.backendless.com"
    
    private struct BackendlessData {
        
        private init() { }
        
        static let backendless = Backendless.sharedInstance()!
        
        static let dataStore = backendless.data.of(News.ofClass())
        
    }
    
    
    // MARK: - API
    
    /* fetch all 'news' */
    func fetchNews(success: @escaping (([News]) -> Swift.Void),
                   failure: @escaping ((Fault?) -> Swift.Void)) {
        
        BackendlessData.dataStore?.find({ response in
            
            success(response as! [News])
            
        }) { fault in
            
            failure(fault)
            
            print("Server reported an error: \(String(describing: fault))")
            
        }
        
    }
    
    /* mark 'new' as read */
    func readNew(_ new: News,
                 success: @escaping (() -> Swift.Void),
                 failure: @escaping ((Fault?) -> Swift.Void)) {
        
        new.isRead = true
        
        BackendlessData.dataStore?.save(new, response: { readedNew in
            
            success()
            
        }) { fault in
            
            failure(fault)
            
            print("Server reported an error: \(String(describing: fault))")
            
        }
        
    }
    
    
    
    
    
    
    
    
}



















