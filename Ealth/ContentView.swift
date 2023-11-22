import SwiftUI

struct HealthListView: View {
    @State private var searchText = ""
    
    let healthData = [
        ("Activity", "flame.fill"),
        ("Body Measurements", "figure"),
        ("Cycle Tracking", "circle.hexagonpath.fill"),
        ("Hearing", "ear"),
        ("Heart", "heart.fill"),
        ("Medications", "pills.fill"),
        ("Mental Wellbeing", "brain.head.profile"),
        ("Mobility", "arrow.left.arrow.right"),
        ("Nutrition", "leaf.fill"),
        ("Respiratory", "lungs.fill"),
        ("Sleep", "bed.double.fill"),
        ("Symptoms", "list.bullet.clipboard"),
        ("Vitals", "staroflife.fill"),
        ("Other Data", "ellipsis.circle.fill")
    ]
    
    let iconColors: [String: Color] = [
        "Activity": .orange,
        "Cycle Tracking": .indigo,
        "Body Measurements": .purple,
        "Medications": .cyan,
        "Mental Wellbeing": .mint,
        "Mobility": .orange,
        "Heart": .pink,
        "Nutrition": .green,
        "Respiratory": .blue,
        "Sleep": .mint,
        "Symptoms": .gray,
        "Vitals": .orange,
        "Other Data": .gray
    ]
    
    var filteredHealthData: [(String, String)] {
           if searchText.isEmpty {
               return healthData
           } else {
               return healthData.filter { $0.0.localizedCaseInsensitiveContains(searchText) }
           }
       }
       
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                    .padding(.horizontal, 20.0)
                List {
                    Section(header: Text("Health Categories").headerProminence(.increased)) {
                        ForEach(filteredHealthData, id: \.0) { element in
                            if element.0 == "Medications" {
                                NavigationLink(destination: MedicationsView()) {
                                    HealthListRow(title: element.0, iconName: element.1, iconColor: iconColors[element.0] ?? .blue)
                                }
                            } else {
                                HealthListRow(title: element.0, iconName: element.1, iconColor: iconColors[element.0] ?? .blue)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Browse")
            .navigationBarItems(trailing: userIcon)
            .background(Color(UIColor.systemGray6))
        }
    }

    private var userIcon: some View {
        HStack {
            Image(systemName: "person.circle.fill")
                .padding(.top, 90.0)
                .font(.system(size: 28))
                .foregroundColor(.gray)
        }
    }
}

struct HealthListRow: View {
    let title: String
    let iconName: String
    let iconColor: Color

    var body: some View {
        HStack {
            Image(systemName: iconName)
                .font(.system(size: 28))
                .foregroundColor(iconColor)

            Text(title)
                .font(.headline)
            }
        .padding(5)
    }
}

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        ZStack {
            TextField("Search", text: $text)
                .padding(.horizontal, 30)
                .padding(8)
                .background(Color(.systemGray5))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .padding(.leading, 8)
                        Spacer()
                    }
                )
        }
    }
}


struct HealthListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HealthListView()
        }
    }
}
