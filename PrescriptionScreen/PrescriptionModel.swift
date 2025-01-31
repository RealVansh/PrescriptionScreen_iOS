//
//  PrescriptionModel.swift
//  PrescriptionScreen
//
//  Created by admin100 on 16/11/24.
//

import Foundation

struct Prescription {
    let doctorName: String
    let date: String
    let prescriptionFileName: String // Name of the image/PDF in assets
    
}

struct Diagnosis {
    let name: String
    let prescriptions: [Prescription]
}

struct DiagnosisData {
    static let allDiagnoses: [Diagnosis] = [
        Diagnosis(
            name: "Fever",
            prescriptions: [
                Prescription(doctorName: "Dr. Joseph", date: "01-11-2024", prescriptionFileName: "fever1"),
                Prescription(doctorName: "Dr. Brown", date: "10-11-2024", prescriptionFileName: "fever2")
            ]
        ),
        Diagnosis(
            name: "Asthma",
            prescriptions: [
                Prescription(doctorName: "Dr. Taylor", date: "01-11-2024", prescriptionFileName: "asthma1"),
                Prescription(doctorName: "Dr. Clark", date: "10-11-2024", prescriptionFileName: "asthma2")
            ]
        ),
        Diagnosis(
            name: "Skin Allergies",
            prescriptions: [
                Prescription(doctorName: "Dr. Adams", date: "10-11-2024", prescriptionFileName: "skin1")
            ]
        ),
        Diagnosis(
            name: "Myopia",
            prescriptions: [
                Prescription(doctorName: "Dr. Nikhil", date: "01-11-2024", prescriptionFileName: "myopia1"),
            ]
        ),
        Diagnosis(
            name: "Ulcer",
            prescriptions: [
                Prescription(doctorName: "Dr. Sanjana", date: "10-11-2024", prescriptionFileName: "ulcer1")
            ]
        )
    ]
}
