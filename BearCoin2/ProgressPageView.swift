//
//  ProgressPageView.swift
//  BearCoin
//
//  Created by Hamza Afzal on 12/8/24.
//

import SwiftUI
import SwiftData

struct ProgressPageView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var items: [listItem] = [
        listItem(iconName: "GrizzlyBear", name: "GrizzlyBear", cost: nil, milestone: 5000),
        listItem(iconName: "BlackBear", name: "BlackBear", cost: nil, milestone: 50_000),
        listItem(iconName: "PolarBear", name: "PolarBear", cost: nil, milestone: 100_000),
        listItem(iconName: "PandaBear", name: "PandaBear", cost: nil, milestone: 500_000),
        listItem(iconName: "GoldenBear", name: "GoldenBear", cost: nil, milestone: 1_000_000)
    ]
    
    var body: some View {
        VStack {
            HStack {
                dismissButton
                Spacer()
            }
            .padding()
            listView(pageTitle: "BEARS", color: .white, items: $items)
        }
    }
    
    private var dismissButton: some View {
        Button(action: {
            dismiss()
        })
        {
            Image(systemName: "xmark.circle.fill")
                .foregroundStyle(.red)
                .font(.system(size: 25))
        }
    }
}
    
    
#Preview {
    ProgressPageView()
}
