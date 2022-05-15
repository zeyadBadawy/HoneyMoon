//
//  ContentView.swift
//  HoneyMoon
//
//  Created by Zeyad Badawy on 15/05/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CardView(destination: honeyMoonData[3])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
