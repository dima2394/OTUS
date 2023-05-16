//
//  SettingsView.swift
//  tvOSExample
//
//  Created by Dmitriy Verennik on 16.05.2023.
//

import SwiftUI

enum SettingType: String, Hashable ,CaseIterable {

    case theme
    case audio

    var title: String {
        switch self {
        case .theme:
            return "Game theme"
        case .audio:
            return "Audio enabled"
        }
    }
}

struct SettingsView: View {

    @State
    var toggleIsOn: Bool = false

    var body: some View {

        VStack {
            List {
                ForEach(SettingType.allCases, id: \.rawValue) { settingsType in
                    HStack {
                        Text("\(settingsType.title)")
                        Spacer()
                        Toggle(isOn: $toggleIsOn, label: {})
                    }
                }
            }
            .scenePadding(.all)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {

    static var previews: some View {
        SettingsView()
    }
}
