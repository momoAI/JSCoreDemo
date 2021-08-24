//
//  TTPolyJSExport.swift
//  JSCoreDemo
//
//  Created by momo on 2021/8/11.
//

import Foundation
import JavaScriptCore

@objc protocol TTPolyJSExportProtocol: JSExport {
    static func createPoly() -> TTPolyJSExport
    func pay(amount: Double) -> Int
    func camera()
}

@objc class TTPolyJSExport: NSObject, TTPolyJSExportProtocol {
    class func createPoly() -> TTPolyJSExport {
        return TTPolyJSExport()
    }
    
    func pay(amount: Double) -> Int {
        print("pay amount" + "\(amount)")
        
        return 1
    }
    
    func camera() {
        print("open camere ..")
    }
}
