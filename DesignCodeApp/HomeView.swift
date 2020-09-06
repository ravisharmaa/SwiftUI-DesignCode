//
//  HomeView.swift
//  DesignCodeApp
//
//  Created by Ravi Bastola on 9/5/20.
//

import SwiftUI

struct HomeView: View {
    
    @State var showProfile: Bool = false
    
    var body: some View {
        
        ZStack {
            
            Color(.tertiaryLabel)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Text("Watching")
                        .font(.system(size: 28, weight: .bold))
                    
                    Spacer()
                    Button(action: {
                        showProfile.toggle()
                    }, label: {
                        Image("avatar")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 36, height: 36)
                            .clipShape(Circle())
                    })
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                Spacer()
            }
            .padding(.top, 44)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .offset(y: showProfile ? -450: 0)
            .shadow(color:  Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .rotation3DEffect(
                .init(degrees: showProfile ? -10 : 0),
                axis: (x: 10.0, y: 1.0, z: 0.0)
            )
            .scaleEffect(showProfile ? 0.9 : 1)
            .animation(.spring(response: 0.3, dampingFraction: 0.9, blendDuration: 0))
            .edgesIgnoringSafeArea(.all )
            
            MenuView()
                .offset(y: showProfile ? 0 : 600)
                .animation(.spring(response: 0.3, dampingFraction: 0.9, blendDuration: 0))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
