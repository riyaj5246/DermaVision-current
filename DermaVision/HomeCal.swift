//
//  HomeCal.swift
//  DermaVision
//
//  Created by Riya Jain on 3/24/22.
//

import SwiftUI

struct HomeCal: View {
    
    @State var currentDate: Date = Date()
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing: 20){
                CustomDatePicker(currentDate: $currentDate)
            }
            .padding(.vertical)
        }
        // Safe Area View...
        .safeAreaInset(edge: .bottom){
            HStack{
                Button{
                    tasks.append(TaskMetaData(task: [Task(title: "zdmfnsdjflksdjfl")], taskDate: currentDate))
//
                    
                } label: {
                    Text("Add Task")
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(Color("Orange"), in: Capsule())
                }
                
                Button{
                    
                } label: {
                    Text("Add Remainder")
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(Color("Purple"), in: Capsule())
                }
            }
            .padding(.horizontal)
            .padding(.top, 10)
            .foregroundColor(.white)
            .background(.ultraThinMaterial)
        }
    }
}

struct HomeCal_Previews: PreviewProvider {
    static var previews: some View {
        HomeCal()
    }
}
