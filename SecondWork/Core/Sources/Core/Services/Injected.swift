//
//  Injected.swift
//  SecondWork
//
//  Created by Dmitriy Verennik on 27.02.2023.
//

import Foundation

@propertyWrapper
public struct Injected<Service> {

    public init() { }

    private var service: Service?

    public var wrappedValue: Service? {
        mutating get {
            if service == nil {
                service = ServiceLocator.shared.get()
            }
            return service
        }
    }

    public var projectedValue: Injected<Service> {
        mutating set {
            self = newValue
        }
        get {
            return self
        }
    }
}
