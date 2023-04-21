//
//  ServiceLocator.swift
//  SecondWork
//
//  Created by Dmitriy Verennik on 27.02.2023.
//

import Foundation

public protocol ServiceLocating {
    func get<T>() -> T?
}

public final class ServiceLocator: ServiceLocating {

    public static let shared = ServiceLocator()

    private lazy var services = [String: Any]()

    private func typeName(some: Any) -> String {
        return (some is Any.Type) ? "\(some)" : "\(type(of: some))"
    }

    public func add<T>(_ service: T) {
        let key = typeName(some: T.self)
        services[key] = service
    }

    public func get<T>() -> T? {
        services[typeName(some: T.self)] as? T
    }
}
