//
//  HomePageView.swift
//  DermaVision
//
//  Created by Riya Jain on 2/4/22.
//

import SwiftUI

struct HomePageView: View {
    @State var forecast = [[String]]()
    @State var personName = "Riya"
    
    var body: some View {
        ScrollView {
            VStack {
                Text("""
                     Welcome,
                     \(personName)!
                     """)
                    .font(.system(size: 50))
                    .fontWeight(.black)
                    .foregroundColor(Color("Color2"))
                    .multilineTextAlignment(.leading)
                    .padding(.leading, -140.0)
                    .onAppear{
                        let x = getData()
                        var counter = 0
                        forecast.removeAll()
                        while counter < 24 {
                            forecast.append(x[counter])
                            counter += 1
                        }
                       // forecast = getData()
                    }
                
                
                Text("Here's the upcoming UV Forecast:")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .foregroundColor(Color("Color1"))
                        .multilineTextAlignment(.leading)
                        .padding()
                    
                List(forecast, id: \.self) { day in forecastListItemView(arrayItem: day)
                    }
                    .padding(.top, -10)
                    .frame(width: 500.0, height: 500.0)
                    

                
                Spacer()
                
            }
        }
    
    }
        
}

struct forecastListItemView: View {
    
    var arrayItem: [String]
    var body: some View {
        HStack(alignment: .top) {
            Text(arrayItem[0])
                .font(.system(size: 17))
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .lineLimit(4)
                .frame(width: 150, height: 50)
                .foregroundColor(Color("Color2"))
                .font(.headline)
                
               
            Text(arrayItem[1])
                .font(.system(size: 23))
                .fontWeight(.light)
                .multilineTextAlignment(.trailing)
                .lineLimit(3)
                .frame(width: 150, height: 50)
                .foregroundColor(Color("Color2"))
                .font(.body)
             
            if arrayItem[2] == "High" {
                Text(arrayItem[2])
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: 150, height: 50)
                    .background(Circle()
                                    .fill(.red)
                                    .opacity(0.7))

            }
            else if arrayItem[2] == "Med" {
                Text(arrayItem[2])
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .frame(width: 100, height: 50)
                    .background(Circle()
                                    .fill(.yellow)
                                    .opacity(0.7))
            }
            else {
                Text(arrayItem[2])
                    .foregroundColor(.white)
                    .fontWeight(.bold)

                    .frame(width: 100, height: 50)
                    .background(Circle()
                                    .fill(.green)
                                    .opacity(/*@START_MENU_TOKEN@*/0.7/*@END_MENU_TOKEN@*/)
                                    )

            }
                
        }
        .padding(9.0)
//        .background(Rectangle()
//                        .fill(Color("Color1")))
        
        .background(LinearGradient(gradient: Gradient(colors: [Color("Color1"), Color("Color4")]), startPoint: .trailing, endPoint: .leading))
        //.frame(width: -1.0, height: 51.0)

        
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
