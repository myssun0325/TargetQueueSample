//
//  ViewController.swift
//  TargetQueueSample
//
//  Created by YoungsunMoon on 2023/04/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        withTargetQueue()
        withoutTargetQueue()
    }
    
    func withoutTargetQueue() {
        let queue1 = DispatchQueue(label: "queue1")
        let queue2 = DispatchQueue(label: "queue2", qos: .userInteractive)
        let queue3 = DispatchQueue(label: "queue3", qos: .userInteractive)
        
        queue1.async {
            print(DispatchQoS.QoSClass(rawValue: qos_class_self()) ?? .unspecified)
            print(Thread.current)
        }
        
        queue2.async {
            print(DispatchQoS.QoSClass(rawValue: qos_class_self()) ?? .unspecified)
            print(Thread.current)
        }
        
        queue3.async {
            print(DispatchQoS.QoSClass(rawValue: qos_class_self()) ?? .unspecified)
            print(Thread.current)
        }
    }
    
    func withTargetQueue() {
        let targetQueue = DispatchQueue(label: "target", qos: .utility)
        let queue1 = DispatchQueue(label: "queue1",
        target: targetQueue)
        let queue2 = DispatchQueue(label: "queue2", qos: .userInteractive,
        target: targetQueue)
        let queue3 = DispatchQueue(label: "queue3", qos: .userInteractive,
        target: targetQueue)
        
        targetQueue.async {
            print(DispatchQoS.QoSClass(rawValue: qos_class_self()))
            print(Thread.current)
        }
        
        queue1.async {
            print(DispatchQoS.QoSClass(rawValue: qos_class_self()))
            print(Thread.current)
        }
        
        queue2.async {
            print(DispatchQoS.QoSClass(rawValue: qos_class_self()))
            print(Thread.current)
        }
        
        queue3.async {
            print(DispatchQoS.QoSClass(rawValue: qos_class_self()))
            print(Thread.current)
        }
    }


}

