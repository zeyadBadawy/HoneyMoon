//
//  TitleModifier.swift
//  HoneyMoon
//
//  Created by Zeyad Badawy on 18/05/2022.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.pink)
    }
}


