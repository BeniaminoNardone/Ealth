// MedicationModel.swift
import Foundation

struct Medication: Identifiable {
    let id = UUID()
    let name: String
    let time: String
}

// Esempio di dati per test
let sampleMedications = [
    Medication(name: "Aspirin", time: "8:00 AM"),
    Medication(name: "Ibuprofen", time: "12:00 PM"),
    Medication(name: "Antibiotic", time: "6:00 PM"),
    // Aggiungi altri farmaci secondo necessità
]
