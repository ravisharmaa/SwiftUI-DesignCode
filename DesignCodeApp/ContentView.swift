//
//  ContentView.swift
//  DesignCodeApp
//
//  Created by Ravi Bastola on 9/4/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var isShown: Bool = false
    
    var body: some View {
        
        ZStack {
            TitleView()
                .blur(radius: isShown ? 20 : 0)
                .animation(.default)
            
            BackgroundCardView()
                .background(isShown ? Color("card3"): Color("card4"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: isShown ? -400 : -40)
                .scaleEffect(0.9)
                .rotationEffect(.init(degrees: isShown ? 0 : 10))
                .rotation3DEffect(
                    .degrees(5),
                     axis: (x: 10.0, y: 0.0, z: 0.0),
                     anchor: .center
                    )
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.5))
            
            BackgroundCardView()
                .background(isShown ? Color("card4"): Color("card3"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: isShown ? -200 : -20)
                .scaleEffect(0.95)
                .rotationEffect(.init(degrees: isShown ? 0 : 5))
                .rotation3DEffect(
                    .degrees(5),
                     axis: (x: 10.0, y: 0.0, z: 0.0),
                     anchor: .center
                    )
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.3))
            
            
            CardView()
                .blendMode(.hardLight)
                .onTapGesture(perform: {
                    self.isShown.toggle()
                })
            
            BottomCardView()
                .blur(radius: isShown ? 20 : 0)
                .animation(.default)
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
