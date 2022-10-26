//
//  KittyCat.swift
//  KittyCat
//
//  Created by Miguel Garcia on 10/25/22.
//

import WidgetKit
import SwiftUI
import Intents
/*
func getKitty(batteryLife):
    switch happyLevel {
        case.batterLife >= 80:
            //😸
            return happy
    case.batteryLife >= 60 & <= 79:
            //😺
        return fine
    case.batteryLife >= 40 & <= 59:
            //🥴
        return woozy
    case.batteryLife >= 20 & <= 39:
            //😿
        return crying
    case.batteryLife >= 6 & <= 19:
            //😾
        return mad
    case.batteryLife >= 0 & <= 5:
            //😵
        return dramatic
    
    //if charging, display a cat sleeping
    //with the Zzz
        
        
        
    }
*/
struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct KittyCatEntryView : View {
    @Environment(\.widgetFamily) var widgetFamily
    var entry: Provider.Entry

    var body: some View {
        switch widgetFamily {
            //case.accessoryInline:
                //UIImage()
            //case.accessoryRectangular:
            
            //case.accessoryCircular:
            
        default:
            Text("Not There Yet")
        }
        
    }
}

@main
struct KittyCat: Widget {
    let kind: String = "KittyCat"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            KittyCatEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.accessoryInline, .accessoryCircular, .accessoryRectangular])
    }
}

struct KittyCat_Previews: PreviewProvider {
    static var previews: some View {
        KittyCatEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .accessoryInline))
            .previewDisplayName("Inline")
        
        KittyCatEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .accessoryRectangular))
            .previewDisplayName("Rectangular")
        
        KittyCatEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .accessoryCircular))
            .previewDisplayName("Circular")
        
    }
}
