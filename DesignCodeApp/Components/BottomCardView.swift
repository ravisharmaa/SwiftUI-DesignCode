//
//  BottomCardView.swift
//  DesignCodeApp
//
//  Created by Ravi Bastola on 9/4/20.
//

import SwiftUI

struct BottomCardView: View {
    var body: some View {
        VStack {
            
            Rectangle()
                .frame(width: 40, height: 5)
                .cornerRadius(3)
                .opacity(0.1)
            
            Text("This is design code course which I downloaded from torrent and is very intuitive to follow. However, this does not actually talk about the flow in a great detail. Nevertheless, having nothing should be compared this is far more worthy")
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .lineSpacing(5)
           
            Spacer()
        }
        .padding(.top, 8)
        .padding(.horizontal, 20)
        .background(Color.white)
        .frame(maxWidth: .infinity)
        .cornerRadius(30)
        .shadow(radius: 20)
        .offset(x: 0, y: 550)
        
    }
}

struct BottomCardView_Previews: PreviewProvider {
    static var previews: some View {
        BottomCardView()
    }
}
