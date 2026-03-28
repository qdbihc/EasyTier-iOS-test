#if os(iOS)
import SwiftUI
import WidgetKit

@available(iOS 18.0, *)
struct EasyTierControlWidget: ControlWidget {
    static let kind: String = "EasyTierControl"
    
    var body: some ControlWidgetConfiguration {
        ControlWidgetConfiguration {
            ControlWidgetButton(action: {}) {
                Label("EasyTier", systemImage: "network")
            }
        }
    }
}
#endif
