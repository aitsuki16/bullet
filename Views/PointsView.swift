//
//  PointsView.swift
//  bulleye
//
//  Created by Ai on 2022/10/01.
//

import SwiftUI

struct PointsView: View {
    
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    
    var body: some View {
        VStack(spacing: 10) {
            InstructionText(text: "The slider's value is")
        
        BigNumberText(text: "89")
        BodyText(text: "You scored 200 Points \n💗💗💗")
        Button(action: {}) {
            ButtonText(text: "Start new round")
        }
        }
            .padding()
            .frame(maxWidth: 300)
            .foregroundColor(Color("Backgroundcolor"))
            .cornerRadius(21.0)
            .shadow(radius: 10, x: 5, y: 5)
    
    }
}

struct PointsView_Previews: PreviewProvider {
    static private var alertIsVisible = Binding.constant(false)
    static private var sliderValue = Binding.constant(50.0)
    static private var game = Binding.constant(Game())
   
    static var previews: some View {
        PointsView()
        PointsView()
            .previewLayout(.fixed(width: 568, height: 320))
        ContentView()
            .preferredColorScheme(.dark)
        PointsView()
            .preferredColorScheme(.dark)

            .previewLayout(.fixed(width: 568, height: 320))
    
    }
}
