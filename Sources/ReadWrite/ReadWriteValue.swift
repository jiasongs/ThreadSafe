//
//  ReadWriteValue.swift
//  ThreadSafe
//
//  Created by jiasong on 2024/5/30.
//

import Foundation

public final class ReadWriteValue<Value> {
    
    private var _value: Value
    public var value: Value {
        get {
            return self.task.read { self._value }
        }
        set {
            self.task.write { self._value = newValue }
        }
    }
    
    @UnfairLockValueWrapper
    public var task: ReadWriteTask
    
    public init(_ value: Value, label: String) {
        self._value = value
        self.task = ReadWriteTask(label: label)
    }
    
    public init(_ value: Value, task: ReadWriteTask) {
        self._value = value
        self.task = task
    }
    
}
