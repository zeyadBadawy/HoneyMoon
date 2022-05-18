//
//  HeaderView.swift
//  HoneyMoon
//
//  Created by Zeyad Badawy on 15/05/2022.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Button {
                
            } label: {
                Image(systemName: "info.circle")
                    .font(.system(size: 24, weight: .regular, design: .default))
            }//: Button
            .accentColor(.primary)

            Spacer()
            
            Image("logo-pink")
                .resizable()
                .scaledToFit()
                .frame(height: 28, alignment: .center)
            
            Spacer()
            Button {
                
            } label: {
                Image(systemName: "questionmark.circle")
                    .font(.system(size: 24, weight: .regular, design: .default))
            }//: Button
            .accentColor(.primary)
        }//: HStack
        .padding()
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
            .previewLayout(.fixed(width: 375, height: 80))
    }
}
