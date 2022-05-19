//
//  InfoView.swift
//  HoneyMoon
//
//  Created by Zeyad Badawy on 18/05/2022.
//

import SwiftUI

struct InfoView: View {
    //MARK: PROPERTIES
    @Environment(\.presentationMode) var presentationMode
    //MARK: PREVIEW
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment:.center,spacing:20) {
                HeaderComponent()
                
                Spacer(minLength: 10)
                
                Text("App Info")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                AppInfoView()//:HStack
                
                Spacer(minLength: 10)
                Text("Credits")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                CreditsView()
                Spacer(minLength: 10)
                
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Continue")
                        .modifier(ButtonModifier())
                }
                
            }//: VStack
            .frame(minWidth:0 , maxWidth: .infinity)
            .padding(.top , 15)
            .padding(.bottom , 25)
            .padding(.horizontal , 25)
        }
    }
}
//MARK: PREVIEW
struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}

struct AppInfoView: View {
    var body: some View {
        VStack {
            AppInfoRowView(textOne: "Application", textTwo: "Honeymoon")
            AppInfoRowView(textOne: "Compatibility", textTwo: "iPhone and iPad")
            AppInfoRowView(textOne: "Developer", textTwo: "Zeyad Badawy")
            AppInfoRowView(textOne: "Designer", textTwo: "Robert Petras")
            AppInfoRowView(textOne: "Website", textTwo: "@zeyadtaher5 ")
            AppInfoRowView(textOne: "Version", textTwo: "1.0.0")
          }
    }
}

struct AppInfoRowView: View {
    //MARK: PROPERTIES
    var textOne:String
    var textTwo:String
    //MARK: BODY
    var body: some View {
        VStack {
            HStack{
                Text(textOne).foregroundColor(.gray)
                Spacer()
                Text(textTwo)
            }
            Divider()
        }
    }
}

struct CreditsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack{
                Text("Application").foregroundColor(.gray)
                Spacer()
                Text("HoneyMoon")
            }
            Divider()
            
            Text("Photographers").foregroundColor(.gray)
            Text("Shifaaz Shamoon (Maldives), Grillot Edouard (France), Evan Wise (Greece), Christoph Schulz (United Arab Emirates), Andrew Coelho (USA), Damiano Baschiera (Italy), Daniel Olah (Hungary), Andrzej Rusinowski (Poland), Lucas Miguel (Slovenia), Florencia Potter (Spain), Ian Simmonds (USA), Ian Keefe (Canada), Denys Nevozhai (Thailand), David Köhler (Italy), Andre Benz (USA), Alexandre Chambon (South Korea), Roberto Nickson (Mexico), Ajit Paul Abraham (UK), Jeremy Bishop (USA), Davi Costa (Brazil), Liam Pozz (Australia)")
              .multilineTextAlignment(.leading)
              .font(.footnote)
        }
    }
}
