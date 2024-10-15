//
//  WidgetPreparingGame.swift
//  RookieKBOWidgetExtension
//
//  Created by crownjoe on 10/16/24.
//

import WidgetKit
import SwiftUI

struct WidgetPreparingGame: View {
    var entry: Provider.Entry
    var currentMatch: Match? { entry.match }
    
    var body: some View {
        VStack(spacing: 0) {
            WidgetGameInfo(entry: entry)
                .padding(.bottom, 14)
            
            if let startDateTime = currentMatch?.startDateTime, Calendar.current.isDate(startDateTime, inSameDayAs: Date.today) {
                
                Text("\(currentMatch?.startDateTime.toTimeString() ?? "")")
                    .font(.Body.body2)
                    .foregroundColor(.TextLabel.widget100)
                    .padding(.bottom, 4)
                
                Text("\(currentMatch?.place ?? "")")
                    .font(.Caption.caption2)
                    .foregroundColor(.TextLabel.widget50)
                
            } else {
                Text("\(currentMatch?.startDateTime.formattedString() ?? "")")
                    .font(.Body.body2)
                    .foregroundColor(.TextLabel.widget100)
                    .padding(.bottom, 4)
                
                Text("\(currentMatch?.place ?? "")")
                    .font(.Caption.caption2)
                    .foregroundColor(.TextLabel.widget50)
            }
        }
    }
}
