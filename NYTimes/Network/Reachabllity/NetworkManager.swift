//
//  NetworkManager.swift
//  NYTimes
//
//  Created by Aadil Khaskheli on 4/3/19.
//  Copyright © 2019 Aadil Khaskheli. All rights reserved.
//

import Foundation
import CoreTelephony

extension Notification.Name {
    static let internetIsConnected = Notification.Name("internetIsConnected")
    static let internetIsDisconnected = Notification.Name("internetIsDisconnected")
}

public final class NetworkManager {
    static let shared = NetworkManager()
    private init(){}
    deinit {
        print("deinit singleton")
    }
    
    let reachability = Reachability()
    
    var isInternetConnected = false
    
    public func startListening() {
        reachability?.allowsCellularConnection = true
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged(note:)), name: .reachabilityChanged, object: reachability)
        
        do {
            try reachability?.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
        
    }
    
    public func stopListening() {
        reachability?.stopNotifier()
        NotificationCenter.default.removeObserver(self, name: .reachabilityChanged, object: reachability)
    }
    
    public var isReachable : Bool {
        return self.isInternetConnected
    }
    
    public var networkType : String = "Unknown"
}

extension NetworkManager {
    
    @objc func reachabilityChanged(note: Notification) {
        
        let reachability = note.object as! Reachability
        
        switch reachability.connection {
        case .wifi:
            print("Reachable via WiFi")
            self.internetConnected()
            networkType = "Wifi"
        case .cellular:
            print("Reachable via Cellular")
            self.internetConnected()
            
            let telefonyInfo = CTTelephonyNetworkInfo()
            if let radioAccessTechnology = telefonyInfo.currentRadioAccessTechnology{
                switch radioAccessTechnology{
                case CTRadioAccessTechnologyLTE:
                    print("LTE (4G)")
                    networkType = "LTE (4G)"
                case CTRadioAccessTechnologyWCDMA:
                    print("3G")
                    networkType = "3G"
                case CTRadioAccessTechnologyEdge:
                    print("EDGE (2G)")
                    networkType = "EDGE (2G)"
                default: print("Other")
                }
            }
            
        case .none:
            print("Network not reachable")
            self.internetDisconnected()
        }
    }
    
    private func internetDisconnected() {
        print("Internet is Disconnected")
        self.isInternetConnected = false
        NotificationCenter.default.post(name: .internetIsDisconnected, object: nil)
//        AlertManager.shared.noInternetConnectionPopUp()
    }
    
    private func internetConnected() {
        print("Internet is Connected")
        self.isInternetConnected = true
        NotificationCenter.default.post(name: .internetIsConnected, object: nil)
    }
}
