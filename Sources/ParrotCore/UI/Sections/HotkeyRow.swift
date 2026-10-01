import SwiftUI

/// The push-to-talk key (#42), a row in the General section.
struct HotkeyRow: View {
    @ObservedObject var store: SettingsStore

    @ViewBuilder var body: some View {
        PillRow("Hotkey") {
            PillMenu(title: store.current.hotkey.key.displayName) {
                ForEach(HotkeyKey.allCases, id: \.self) { key in
                    Toggle(key.displayName, isOn: Binding(
                        get: { store.current.hotkey.key == key },
                        set: { on in if on { store.update { $0.hotkey.key = key } } }
                    ))
                }
            }
        }
        PillRow("Submit on release") {
            Toggle("Submit on release", isOn: Binding(
                get: { store.current.hotkey.submitOnRelease },
                set: { on in store.update { $0.hotkey.submitOnRelease = on } }
            ))
            .toggleStyle(.switch)
            .labelsHidden()
        }
    }
}
