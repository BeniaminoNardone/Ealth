import SwiftUI

struct MedicationsView: View {
    @State private var selectedDay = 1

    var body: some View {
        NavigationView {
            VStack {
                Text("\(formattedDate(for: selectedDay))")
                    .font(.headline)
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 20) {
                        ForEach(1...31, id: \.self) { day in
                            VStack {
                                Circle()
                                    .fill(day == selectedDay ? Color.blue : Color.gray)
                                    .frame(width: 30, height: 30)
                                    .onTapGesture {
                                        selectedDay = day
                                    }
                                Text(dayLetter(for: day))
                                    .font(.caption)
                            }
                        }
                    }
                }
                .padding(.horizontal)
                List {
                    MedicationRow(name: "Aspirin", dosage: "100mg", frequency: "Once daily")
                    MedicationRow(name: "Ibuprofen", dosage: "200mg", frequency: "As needed")
                    MedicationRow(name: "Antibiotic", dosage: "500mg", frequency: "Twice daily")
                }
            }
        }

    }

    private func formattedDate(for day: Int) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d, yyyy"
        let currentDate = Date() // You may replace this with the actual date if needed
        let selectedDate = Calendar.current.date(byAdding: .day, value: day - 1, to: currentDate) ?? currentDate
        return formatter.string(from: selectedDate)
    }

    private func dayLetter(for day: Int) -> String {
        let currentDate = Date()
        let selectedDate = Calendar.current.date(byAdding: .day, value: day - 1, to: currentDate) ?? currentDate
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E"
        return dateFormatter.string(from: selectedDate)
    }
}

struct MedicationRow: View {
    var name: String
    var dosage: String
    var frequency: String

    var body: some View {
        NavigationLink(destination: MedicationDetail(name: name, dosage: dosage, frequency: frequency)) {
            VStack(alignment: .leading) {
                Text(name)
                    .font(.headline)
                Text("Dosage: \(dosage)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text("Frequency: \(frequency)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct MedicationDetail: View {
    var name: String
    var dosage: String
    var frequency: String

    var body: some View {
        VStack {
            Text(name)
                .font(.title)
            Spacer()
            Text("Dosage: \(dosage)")
                .font(.headline)
            Text("Frequency: \(frequency)")
                .font(.headline)
            Spacer()
        }
        .padding()
        .navigationTitle(name)
    }
}

struct MedicationsView_Previews: PreviewProvider {
    static var previews: some View {
        MedicationsView()
    }
}
