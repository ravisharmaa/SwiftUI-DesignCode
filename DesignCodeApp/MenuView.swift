//
//  MenuView.swift
//  DesignCodeApp
//
//  Created by Ravi Bastola on 9/4/20.
//

import SwiftUI

struct MenuView: View {
    
    let topGradient: Color = Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
    
    let bottomGradient: Color = Color(#colorLiteral(red: 0.8705882353, green: 0.8941176471, blue: 0.9450980392, alpha: 1))
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            VStack (spacing: 16) {
                
                Text("Meng-28% Complete")
                    .font(.caption)
                
                // progress bar
                Color.white
                    .frame(width: 38, height: 6)
                    .cornerRadius(3)
                    .frame(width: 130, height: 6, alignment: .leading)
                    .background(Color.black.opacity(0.08))
                    .cornerRadius(3)
                    .padding()
                    .frame(width: 150, height: 24)
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(12)
                
                MenuRow(image: "gear", title: "Account")
                MenuRow(image: "creditcard", title: "Billing")
                MenuRow(image: "person.crop.circle", title: "Sign Out")
            }
            .frame(maxWidth: .infinity )
            .frame(height: 300)
            .background(
                LinearGradient(gradient: Gradient(colors: [topGradient, bottomGradient]), startPoint: .top, endPoint: .bottom)
            )
                .clipShape(
                RoundedRectangle(cornerRadius: 30, style: .continuous )
            )
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .padding(.horizontal,  30)
            .overlay(
                Image("avatar")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .offset(x: 0, y: -155)
            )
        }
        .padding(.bottom, 30)
        
       
    }
}

struct MenuRow: View {
    var image: String
    var title: String
    
    var body: some View {
        HStack (spacing: 16) {
            
            Image(systemName: image)
                .font(.system(size: 20, weight: .light))
                .imageScale(.large)
                .frame(width: 32, height: 32)
                .foregroundColor(.blue)
            
            Text(title)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .frame(width: 120, alignment: .leading)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
 
