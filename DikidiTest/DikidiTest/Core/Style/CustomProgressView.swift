//
//  CustomProgressView.swift
//  DikidiTest
//
//  Created by Алексей Каллистов on 28.11.2022.
//

import Foundation
import SwiftUI

struct CustomProgressView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(.circular)
            .progressViewStyle(CircularProgressViewStyle(tint: Color("Blue")))
    }
}
