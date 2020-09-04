//
//  TitleView.swift
//  DesignCodeApp
//
//  Created by Ravi Bastola on 9/4/20.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .bold()
                Spacer()
            }
            .padding()
            
            Image("Background1")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Spacer()
        }
        
        
        
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
