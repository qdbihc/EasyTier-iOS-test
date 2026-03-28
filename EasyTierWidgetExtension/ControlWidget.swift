#if os(iOS) && canImport(WidgetKit)
import WidgetKit
import SwiftUI
import Intents

@available(iOS 18.0, *)
struct EasyTierControlWidget: ControlWidget {
    static let kind: String = "EasyTierControlWidget"

    var body: some ControlWidgetConfiguration {
        ControlWidgetConfiguration {
            ControlWidgetButton(action: {}) {
                Label("EasyTier", systemImage: "network")
            }
        }
        .configurationDisplayName("EasyTier Control")
        .description("Quick control widget")
    }
}

#endif
