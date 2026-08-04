//
//  PrimaryButton.swift
//  TaskFlow
//
//  Created by vsmart on 04/08/26.
//

import Foundation
import SwiftUI

struct PrimaryButton: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button(title, action: action)
            .buttonStyle(.borderedProminent)
    }
}

#Preview {
    PrimaryButton(title: "Continue") {
        print("Tapped")
    }
}
