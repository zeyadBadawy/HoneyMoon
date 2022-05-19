//
//  HeaderView.swift
//  HoneyMoon
//
//  Created by Zeyad Badawy on 15/05/2022.
//

import SwiftUI

struct HeaderView: View {
    //MARK: PROPERTIES
    @Binding var showGuideView:Bool
    @Binding var showInfoView:Bool
    //MARK: BODY
    var body: some View {
        HStack {
            Button {
                showInfoView.toggle()
            } label: {
                Image(systemName: "info.circle")
                    .font(.system(size: 24, weight: .regular, design: .default))
            }//: Button
            .accentColor(.primary)
            .sheet(isPresented: $showInfoView) {
                InfoView()
            }
            Spacer()
            
            Image("logo-pink")
                .resizable()
                .scaledToFit()
                .frame(height: 28, alignment: .center)
            
            Spacer()
            Button {
                showGuideView.toggle()
            } label: {
                Image(systemName: "questionmark.circle")
                    .font(.system(size: 24, weight: .regular, design: .default))
            }//: Button
            .accentColor(.primary)
            .sheet(isPresented: $showGuideView) {
                GuideView()
            }
        }//: HStack
        .padding()
        
    }
}
//MARK: PREVIEW
struct HeaderView_Previews: PreviewProvider {
    @State static var showGuideView = false
    @State static var showInfoView = false
    static var previews: some View {
        HeaderView(showGuideView: $showGuideView, showInfoView: $showInfoView)
            .previewLayout(.fixed(width: 375, height: 80))
    }
}
