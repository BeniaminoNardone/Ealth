//
//  MedicineView.swift
//  Ealth
//
//  Created by Beniamino Nardone on 18/11/23.
//

import SwiftUI

struct MedicineView: View {
    @State private var selectedDate = Date()

    var body: some View {
        VStack {
            // Calendar View
            CalendarView(selectedDate: $selectedDate)
                .padding()

            // Add your content for the selected date here
            Text("Medicines for \(formattedDate(selectedDate))")
                .font(.title)
                .padding()

            // Add your medicine list or other content here
        }
    }

    private func formattedDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, yyyy"
        return dateFormatter.string(from: date)
    }

}

struct CalendarView: View {
    @Binding var selectedDate: Date

    var body: some View {
        HStack {
            Button(action: { self.changeDate(by: -1) }) {
                Image(systemName: "chevron.left")
            }

            Spacer()

            Text("\(formattedDate(selectedDate))")
                .font(.headline)
                .padding()

            Spacer()

            Button(action: { self.changeDate(by: 1) }) {
                Image(systemName: "chevron.right")
            }
        }
    }

    private func changeDate(by days: Int) {
        if let newDate = Calendar.current.date(byAdding: .day, value: days, to: selectedDate) {
            selectedDate = newDate
        }
    }

    private func formattedDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, yyyy"
        return dateFormatter.string(from: date)
    }
}
