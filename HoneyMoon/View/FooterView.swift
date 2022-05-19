//
//  FooterView.swift
//  HoneyMoon
//
//  Created by Zeyad Badawy on 15/05/2022.
//

import SwiftUI

struct FooterView: View {
    //MARK: PROPERTIES
    @Binding var showBookingAlert:Bool
    
    
    //MARK: BODY
    var body: some View {
        HStack {
            Image(systemName: "xmark.circle")
                .resizable()
                .scaledToFit()
                .font(.system(size: 42, weight: .light))
            Spacer()
            
            Button {
                showBookingAlert.toggle()
            } label: {
                Text("Book Destination".uppercased())
                    .font(.system(.subheadline, design: .rounded))
                    .fontWeight(.heavy)
                    .padding(.horizontal , 20 )
                    .padding(.vertical , 15)
                    .accentColor(.pink)
                    .background(Capsule().stroke(Color.pink , lineWidth: 2))
            }
            Spacer()
            
            Image(systemName: "heart.circle")
                .resizable()
                .scaledToFit()
                .font(.system(size: 42, weight: .light))
        }
        .padding()
    }
}

struct FooterView_Previews: PreviewProvider {
    @State static var showBookingAlert:Bool = false
    static var previews: some View {
        FooterView(showBookingAlert: $showBookingAlert )
            .previewLayout(.fixed(width: 357, height: 80))
    }
}
