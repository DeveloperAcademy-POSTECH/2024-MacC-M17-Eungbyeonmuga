////
////  WidgetCancelGame.swift
////  RookieKBOWidgetExtension
////
////  Created by crownjoe on 10/16/24.
////
//
//import WidgetKit
//import SwiftUI
//
//
//struct WidgetCancelGame: View {
//    var entry: Provider.Entry
//    var currentMatch: Match? { entry.match }
//    
//    var body: some View {
//        VStack(spacing: 0) {
//            WidgetGameInfo(entry: entry)
//                .padding(.bottom, 14)
//            
//            Text("우천 취소")
//                .font(.Body.body2)
//                .foregroundColor(.widget100)
//                .padding(.bottom, 4)
//            
//            Text("\(currentMatch?.place ?? "")")
//                .font(.Caption.caption2)
//                .foregroundColor(.widget50)
//        }
//    }
//}
