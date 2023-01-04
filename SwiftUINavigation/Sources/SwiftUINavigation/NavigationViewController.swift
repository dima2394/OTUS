import SwiftUI

public struct NavigationViewController<Content: View>: View {

    @ObservedObject
    private var viewModel: NavigationViewModel = .init(easing: .easeOut(duration: 0.3))
    private var content: Content
    private var transition: (push: AnyTransition, pop: AnyTransition)

    init(viewModel: NavigationViewModel,
         transition: NavigationAnimationType,
         @ViewBuilder contentBuilder: @escaping () -> Content) {
        self.viewModel = viewModel
        self.content = contentBuilder()
        switch transition {
        case .none:
            self.transition = (.identity, .identity)
        case .custom(let push, let pop):
            self.transition = (push, pop)
        }
    }

    public var body: some View {
        let isRoot = viewModel.currentScreen == nil
        
        return ZStack {
            switch isRoot {
            case true:
                content
                    .environmentObject(viewModel)
                    .transition(viewModel.navigationType == .push ? transition.push : transition.pop)
            case false:
                viewModel.currentScreen?.screenView
                    .environmentObject(viewModel)
                    .transition(viewModel.navigationType == .push ? transition.push : transition.pop)
            }
        }
    }
}
