//
//  GuideComponent.swift
//  HoneyMoon
//
//  Created by Zeyad Badawy on 15/05/2022.
//

import SwiftUI

struct GuideComponent: View {
    //MARK: PROPERTIES
    let title:String
    let subTitle:String
    let description:String
    let icon:String
    
    //MARK: BODY
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            Image(systemName: icon)
                .font(.system(.largeTitle))
                .foregroundColor(.pink)
            VStack(alignment: .leading, spacing: 4) {
                HStack{
                    Text(title.uppercased())
                        .font(.title)
                        .fontWeight(.heavy)
                    Spacer()
                    Text(subTitle.uppercased())
                        .font(.footnote)
                        .fontWeight(.heavy)
                        .foregroundColor(.pink)
                }
                Divider().padding(.bottom , 4)
                
                Text(description)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
                
            }
            
        }
    }
}

struct GuideComponent_Previews: PreviewProvider {
    static var previews: some View {
        GuideComponent(title: "Title", subTitle: "Subtitle", description: "descriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescription", icon: "heart.circle")
            .previewLayout(.sizeThatFits)
    }
}
