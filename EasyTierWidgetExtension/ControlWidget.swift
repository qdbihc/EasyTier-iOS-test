#if os(iOS)
import WidgetKit
import SwiftUI
import Intents

// 仅在 iOS 18.0 及以上版本生效
// iOS 16 / 17 会自动忽略，不会编译，不会报错
@available(iOS 18.0, *)
struct EasyTierControlWidget: ControlWidget {
    static let kind: String = "ControlWidget"

    var body: some ControlWidgetConfiguration {
        ControlWidgetConfiguration {
            ControlWidgetButton(action: {}) {
                Label("Control", systemImage: "switch.2")
            }
        }
    }
}

// 给低版本 iOS 提供兼容占位，防止编译报错
@available(iOS, introduced: 16.0, deprecated: 18.0, message: "ControlWidget only available on iOS 18+")
struct LegacyControlWidget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: "LegacyControl", provider: LegacyProvider()) { entry in
            Text("Control Widget")
        }
        .configurationDisplayName("Control")
        .description("Control widget for iOS 18+")
        .supportedFamilies([.systemSmall])
    }
}

struct LegacyProvider: TimelineProvider {
    func placeholder(in context: Context) -> LegacyEntry { LegacyEntry(date: Date()) }
    func getSnapshot(in context: Context, completion: @escaping (LegacyEntry) -> Void) { completion(LegacyEntry(date: Date())) }
    func getTimeline(in context: Context, completion: @escaping (Timeline<LegacyEntry>) -> Void) { completion(Timeline(entries: [LegacyEntry(date: Date())], policy: .atEnd)) }
}

struct LegacyEntry: TimelineEntry { let date: Date() }

#endif
