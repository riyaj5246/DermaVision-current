//
//  UVInfoPage.swift
//  DermaVision
//
//  Created by Riya Jain on 4/2/22.
//

import SwiftUI

struct UVInfoPage: View {
    var body: some View {
        VStack{
            Text("What is UV Index?")
                .font(.system(size: 25))
                .fontWeight(.bold)
                .foregroundColor(Color("Color1"))
                .multilineTextAlignment(.leading)
            
            Text("The Ultraviolet (UV) Index, developed in 1994 by the National Weather Service (NWS) and the U.S. Environmental Protection Agency (EPA), helps Americans plan outdoor activities to avoid overexposure to UV radiation and thereby lower their risk of adverse health effects. UV radiation exposure is a risk factor for skin cancer, cataracts, and other illnesses.")
                .font(.system(size: 18))
                .foregroundColor(Color("Color2"))
                .multilineTextAlignment(.center)
            Divider()
            
            Text("Index Number, Exposure, and Actions")
                .font(.system(size: 23))
                .fontWeight(.bold)
                .foregroundColor(Color("Color1"))
                .multilineTextAlignment(.leading)

        
            List {
                UVListItem(info: ["Low", "1-2", "Relatively low level of risk. However, wear sunglasses if bright, wear sunscreen if you burn easily"])
                UVListItem(info: ["Moderate", "3-5", "Be careful when going out. Cover up and wear sunscreen if going outside, stay in shade during midday"])
                UVListItem(info: ["High", "6-7", "Unprotected exposure can cause burns easily. Reduce time in sun between 11 am and 4 pm, cover up with sunglasses, hat, and sunscreen"])
                UVListItem(info: ["Very High", "8-10", "Take extra precautions: avoid sun during midday and consistently seek shade while maintaining all other precautions"])
                UVListItem(info: ["Extreme", "11+", "Unprotected skin can burn in minutes, avoid reflective and bright surfaces, steer clear of sun during the afternoon, and take all other precautions."])
            }
            
            Link("Click here for further details", destination: URL(string: "https://www.epa.gov/sites/default/files/documents/uviguide.pdf")!)
                .font(.system(size: 20))
                .foregroundColor(Color("Color1"))
        }
    }
}

struct UVInfoPage_Previews: PreviewProvider {
    static var previews: some View {
        UVInfoPage()
    }
}

struct UVListItem: View{
    var info: [String]
    
    var body: some View {
        VStack{
            Text("Exposure: \(info[0]), UVI: \(info[1])")
                .fontWeight(.black)
                .foregroundColor(Color("Color4"))
                .multilineTextAlignment(.center)
            Text(info[2])
                .fontWeight(.light)
                .foregroundColor(Color("Color2"))
                .multilineTextAlignment(.leading)
        }
        .frame(width: 350, height: 125)
    }
}
