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
    
    @State var showBottomCard: Bool = false
    
    @State var bottomCardSize: CGSize = .zero
    
    @State var showFullBottomCard: Bool = false
    
    private let bottomCardMinHeight: CGFloat = 50
    
    var body: some View {
        
        ZStack {
            TitleView()
                .blur(radius: isShown ? 20 : 0)
                .opacity(showBottomCard ? 0.1 : 1)
                .offset(y: showBottomCard ? -200 : 0)
                .animation(
                    Animation.default.delay(0.2)
                )
            
            BackgroundCardView()
                .frame(width: showBottomCard ? 300 : 340, height: 220)
                .background(isShown ? Color("card3"): Color("card4"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: isShown ? -400 : -40)
                .offset(x: viewSize.width, y: viewSize.height)
                .scaleEffect(showBottomCard ? 0.9 : 1)
                .offset(y: showBottomCard ? -180 : 0)
                .rotationEffect(.init(degrees: isShown ? 0 : 5))
                .rotationEffect(.init(degrees: showBottomCard ? -5 : 0))
                .rotation3DEffect(
                    .degrees(showBottomCard ? 0 : 10),
                     axis: (x: 10.0, y: 0.0, z: 0.0),
                     anchor: .center
                    )
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.5))
            
            BackgroundCardView()
                .frame(width: 340, height: 220)
                .background(isShown ? Color("card4"): Color("card3"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: isShown ? -200 : -20)
                .offset(x: viewSize.width, y: viewSize.height)
                .scaleEffect(showBottomCard ? 0.95 : 1)
                .offset(y: showBottomCard ? -140 : 0)
                .rotationEffect(.init(degrees: isShown ? 0 : 10))
                .rotationEffect(.init(degrees: showBottomCard ? -10 : 0))
                .rotation3DEffect(
                    .degrees(showBottomCard ? 0 : 10),
                     axis: (x: 10.0, y: 0.0, z: 0.0),
                     anchor: .center
                    )
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.3))
            
            
            CardView()
                .frame(width: showBottomCard ? 375 : 340, height: 220)
                .background(Color.black)
                .clipShape(
                    RoundedRectangle(cornerRadius: showBottomCard ? 30 : 20, style: .continuous)
                )
                .shadow(radius: 20)
                .offset(x: viewSize.width, y: viewSize.height)
                .offset(y: showBottomCard ? -100 :0)
                .animation(.spring(response: 0.3, dampingFraction: 0.5, blendDuration:  0))
                .blendMode(.hardLight)
                .onTapGesture(perform: {
                    showBottomCard.toggle()
                })
                .gesture(
                    DragGesture().onChanged({ (value) in
                        viewSize = value.translation
                        isShown = true
                    }).onEnded({ (value) in
                        viewSize = .zero
                        isShown = false
                    })
                )
            
            BottomCardView()
                .offset(x: 0, y: showBottomCard ? 310 : 1000)
                .offset(y: bottomCardSize.height)
                .animation(.timingCurve(0.2, 0.8, 0.2 , 1, duration: 0.8))
                .blur(radius: isShown ? 20 : 0)
                .animation(.default)
                .gesture(
                    DragGesture().onChanged({ (value) in
                        bottomCardSize = value.translation
                        
                        if showFullBottomCard {
                            bottomCardSize.height += -300
                        }
                        
                        if bottomCardSize.height < -300 {
                            bottomCardSize.height = -300
                        }
                        
                    }).onEnded({ (_) in
                        
                        showBottomCard = (bottomCardSize.height > bottomCardMinHeight) ? false : true
                        
                        if bottomCardSize.height < -100 {
                            bottomCardSize.height = -300
                            showFullBottomCard = true
                        } else {
                            bottomCardSize = .zero
                            showFullBottomCard = false
                        }
                        
                    })
                ).onTapGesture(count: 1, perform: {
                    showBottomCard = false
                })
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
