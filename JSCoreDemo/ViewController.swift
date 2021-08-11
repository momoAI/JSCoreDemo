//
//  ViewController.swift
//  JSCoreDemo
//
//  Created by momo on 2021/8/8.
//

import UIKit
import JavaScriptCore

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .orange
        
        // JSVirtualMachine --> JSContext --> JSValue
        // 1个VirtualMachine对应一个线程
        
        // jscontext 1.默认VirtualMachine
        let context = JSContext()
        // 2.指定VirtualMachine
//        let machine = JSVirtualMachine()
//        let context = JSContext(virtualMachine: machine)
        
        // context错误处理
        context?.exceptionHandler = { context, exception in
            if let ex = exception {
                print("JS error:  \(ex)")
            }
        }
        
        // 通过context调用js
        let value1 = context?.evaluateScript("var i = 4")
        // value1为undefined
        let number1 = value1?.toInt32() ?? 0
        print(number1)
        
        // 获取jsvalue swift不支持下标读写
        let value2 = context?.objectForKeyedSubscript("i")
        // jsvalue转为swift基础类型
        let number2 = value2?.toInt32() ?? 0
        print(number2)
        
        let value3 = context?.evaluateScript("i = 5")
        let number3 = value3?.toInt32() ?? 0
        print(number3)
        
        context?.evaluateScript("function addition(x,y) { return x + y }")
        let funtion1 = context?.objectForKeyedSubscript("addition")
        let fresult1 = funtion1?.call(withArguments: [1,2]).toInt32() ?? 0
        print(fresult1)
        
        // swift定义函数 供js调用
        func subtraction(x: Int, y: Int) -> Int {
            return x - y
        }
        // 只支持block 不支持swift的闭包转为block
        let block = subtraction as @convention(block) (Int, Int) -> Int
        let blockObject = unsafeBitCast(block, to: AnyObject.self)
        context?.setObject(blockObject, forKeyedSubscript: NSString(string: "subtraction"))
        let subvalue = context?.evaluateScript("subtraction(3,1)")
        let fresult2 = subvalue?.toInt32() ?? 0
        print(fresult2)
        
        let export = TTPolyJSExport()
        context?.setObject(export, forKeyedSubscript: NSString(string: "export"))
    }
    
}

