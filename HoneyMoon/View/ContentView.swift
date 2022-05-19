//
//  ContentView.swift
//  HoneyMoon
//
//  Created by Zeyad Badawy on 15/05/2022.
//

import SwiftUI
import UIKit

struct ContentView: View {
    //MARK: PROPERTIES
    @State var showAlert:Bool = false
    @State var showGuideView:Bool = false
    @State var showInfoView:Bool = false
    let uiimage = UIImage(named: "Zeyad")
    
    
    //MARK: BODY
    var body: some View {
        VStack {
            HeaderView(showGuideView: $showGuideView, showInfoView: $showInfoView)
            Spacer()
            CardView(destination: honeyMoonData[3])
                .padding()
            Spacer()
            FooterView(showBookingAlert: $showAlert)
                .frame(height: 80)
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("success".uppercased()), message: Text("wishing the lovely and the most precious what is the time together for the amazing couple."), dismissButton: .default(Text("Happy Honeymoon!")))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
