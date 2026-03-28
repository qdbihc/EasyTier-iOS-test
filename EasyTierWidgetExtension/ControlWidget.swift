#if os(iOS)
import WidgetKit
import SwiftUI
import Intents

// 仅在 iOS 18.0+ 编译和注册，iOS 16/17 完全忽略
@available(iOS 18.0, *)
struct EasyTierControlWidget: ControlWidget {
    static let kind: String = "com.EasyTier.control-widget"

    var body: some ControlWidgetConfiguration {
        ControlWidgetConfiguration {
            ControlWidgetButton(action: {
                // 这里放你的点击逻辑
            }) {
                Label("EasyTier", systemImage: "network.badge.shield.half.filled")
            }
        }
        .configurationDisplayName("EasyTier Control")
        .description("Quick control for EasyTier VPN")
    }
}

// 注意：如果你的 Widget 是在 @main 里注册的，一定要加版本判断：
// @main
// struct EasyTierWidgets: WidgetBundle {
//     var body: some Widget {
//         if #available(iOS 18.0, *) {
//             EasyTierControlWidget()
//         }
//         // 其他兼容 iOS 16 的 Widget
//         EasyTierRegularWidget()
//     }
// }
#endif
