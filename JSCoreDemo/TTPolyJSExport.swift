//
//  TTPolyJSExport.swift
//  JSCoreDemo
//
//  Created by momo on 2021/8/11.
//

import Foundation
import JavaScriptCore

protocol TTPolyJSExportProtocol: JSExport {
    func pay(amount: Double) -> Int
    func camera()
}

class TTPolyJSExport: NSObject, TTPolyJSExportProtocol {
    func pay(amount: Double) -> Int {
        print("pay amount" + "\(amount)")
        
        return 1
    }
    
    func camera() {
        print("open camere ..")
    }
}
