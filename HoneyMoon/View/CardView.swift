//
//  CardView.swift
//  HoneyMoon
//
//  Created by Zeyad Badawy on 15/05/2022.
//

import SwiftUI

struct CardView: View , Identifiable{
    
    //MARK: PROPERTIES
    var id = UUID()
    var destination:Destination
    
    //MARK: BODY
    var body: some View {
        Image(destination.image)
            .resizable()
            .scaledToFit()
            .frame(minWidth:0 , maxWidth: .infinity)
            .cornerRadius(24)
            .overlay(
                VStack(spacing:12) {
                    Text(destination.country.uppercased())
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .shadow(radius: 1)
                        .multilineTextAlignment(.center)
                        .overlay(
                            Rectangle().fill(.white).frame(height:1)
                            , alignment: .bottom
                        )
                    
                    Text(destination.place)
                        .foregroundColor(.black)
                        .font(.footnote)
                        .fontWeight(.bold)
                        .frame(minWidth:85)
                        .padding(.horizontal , 10)
                        .padding(.vertical , 5)
                        .background(Capsule().fill(.white))
                }//: VStack
                    .foregroundColor(.white)
                    .padding(.bottom , 50)
                ,alignment: .bottom
            )//: overlay
    }
}
//MARK: PREVIEW
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(destination: honeyMoonData[3])
            .previewLayout(.fixed(width: 375, height: 600))
    }
}
