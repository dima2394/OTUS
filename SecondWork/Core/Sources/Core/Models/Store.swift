//
//  
//
//  Created by Dmitriy Verennik on 27.02.2023.
//

import SwiftUI

public final class Store<State, Action, Environment>: ObservableObject {

    public typealias Reducer = (State, Action, Environment) -> State

    @Published
    public var state: State

    private let reducer: Reducer

    public init(state: State, reducer: @escaping Reducer) {
        self.state = state
        self.reducer = reducer
    }

    public func dispatch(action: Action, environment: Environment) {
        state = reducer(state, action, environment)
    }
}
