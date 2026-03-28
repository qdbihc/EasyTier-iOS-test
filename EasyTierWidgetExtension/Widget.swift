import WidgetKit
import SwiftUI

// 兼容 iOS 16 的普通 Widget
struct EasyTierWidget: Widget {
    static let kind: String = "EasyTierWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: EasyTierWidget.kind, provider: Provider()) { entry in
            EasyTierWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("EasyTier")
        .description("Status widget")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

// 主入口：仅 iOS18+ 注册 ControlWidget
@main
struct EasyTierWidgetBundle: WidgetBundle {
    var body: some Widget {
        EasyTierWidget()
        
        // 👇 这行修复了所有报错！只有 iOS18+ 才注册
        if #available(iOS 18.0, *) {
            EasyTierControlWidget()
        }
    }
}

// 以下是默认模板代码（无错误）
struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry { SimpleEntry(date: Date()) }
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> Void) { completion(SimpleEntry(date: Date())) }
    func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> Void) { completion(Timeline(entries: [SimpleEntry(date: Date())], policy: .atEnd)) }
}

struct SimpleEntry: TimelineEntry { let date: Date }
struct EasyTierWidgetEntryView: View { var entry: SimpleEntry; var body: some View { Text("EasyTier") } }
