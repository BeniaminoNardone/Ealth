//
//  GridView.swift
//  Ealth
//
//  Created by Beniamino Nardone on 18/11/23.
//
import SwiftUI

struct GridView: View {
    var body: some View {
        let daysInMonth = 30 // Replace with the actual number of days in the current month

        return LazyVGrid(columns: Array(repeating: GridItem(), count: 7), spacing: 10) {
            ForEach(1 ..< daysInMonth + 1) { day in
                DayView(day: day)
                    .aspectRatio(1, contentMode: .fit)
            }
        }
    }
}
