//
//  HeaderComponent.swift
//  HoneyMoon
//
//  Created by Zeyad Badawy on 15/05/2022.
//

import SwiftUI

struct HeaderComponent: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Capsule()
                .frame(width: 120, height: 4, alignment: .center)
                .foregroundColor(.secondary)
                .opacity(0.2)
            Image("logo-honeymoon")
                .resizable()
                .scaledToFit()
                .frame(height: 28)
        }
    }
}

struct HeaderComponent_Previews: PreviewProvider {
    static var previews: some View {
        HeaderComponent()
            .previewLayout(.fixed(width: 375, height: 128))

    }
}
