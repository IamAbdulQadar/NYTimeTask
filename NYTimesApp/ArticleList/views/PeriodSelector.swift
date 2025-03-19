//
//  PeriodSelector.swift
//  NYTimesApp
//
//  Created by Abdul Qadar on 16/03/2025.

import SwiftUI

// Period Selector Toolbar Item
struct PeriodSelector: ToolbarContent {

    @Binding var period: Period

    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            Menu {
                ForEach(Period.allCases) { periodOption in
                    Button {
                        period = periodOption
                    } label: {
                        Label(
                            periodOption.title(),
                            systemImage: period == periodOption ? "checkmark" : "calendar"
                        )
                    }
                }
            } label: {
                Image(systemName: "calendar")
            }
        }
    }
}
