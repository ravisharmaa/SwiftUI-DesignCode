//
//  ContentView.swift
//  DesignCodeApp
//
//  Created by Ravi Bastola on 9/4/20.
//

import SwiftUI

struct ContentView: View {
    
    //MARK:- Animation Toggle
    @State var isShown: Bool = false
    
    // MARK:- View State, which has an initial size of x:0, y:0
    
    @State var viewSize: CGSize = .zero
    
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
                .offset(x: viewSize.width, y: viewSize.height)
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
                .offset(x: viewSize.width, y: viewSize.height)
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
                .offset(x: viewSize.width, y: viewSize.height)
                .animation(.spring(response: 0.3, dampingFraction: 0.5, blendDuration:  0))
                .blendMode(.hardLight)
                .onTapGesture(perform: {
                    self.isShown.toggle()
                })
                .gesture(
                    DragGesture().onChanged({ (value) in
                        self.viewSize = value.translation
                        self.isShown = true
                    }).onEnded({ (value) in
                        self.viewSize = .zero
                        self.isShown = false
                    })
                )
            
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
