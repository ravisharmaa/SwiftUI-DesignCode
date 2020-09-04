//
//  ContentView.swift
//  DesignCodeApp
//
//  Created by Ravi Bastola on 9/4/20.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        ZStack {
            TitleView()
                .blur(radius: 20)
            
            BackgroundCardView()
                .background(Color("card4"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: -40)
                .scaleEffect(0.9)
                .rotationEffect(.init(degrees: 10))
                .rotation3DEffect(
                    .degrees(5),
                     axis: (x: 10.0, y: 0.0, z: 0.0),
                     anchor: .center
                    )
                .blendMode(.hardLight)
            
            BackgroundCardView()
                .background(Color("card3"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: -20)
                .scaleEffect(0.95)
                .rotationEffect(.init(degrees: 5))
                .rotation3DEffect(
                    .degrees(5),
                     axis: (x: 10.0, y: 0.0, z: 0.0),
                     anchor: .center
                    )
                .blendMode(.hardLight)
            
            
            CardView().blendMode(.hardLight)
            
            BottomCardView()
                .blur(radius: 20)
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
