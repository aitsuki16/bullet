//
//  PointsView.swift
//  bulleye
//
//  Created by Ai on 2022/10/01.
//

import SwiftUI

struct PointsView: View {
    
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    
    var body: some View {
        let roundedValue = Int(sliderValue.rounded())
        let points = game.points(sliderValue: roundedValue)
        VStack(spacing: 10) {
            InstructionText(text: "The slider's value is")
        
        BigNumberText(text: String(roundedValue))
        BodyText(text: "You scored \(points) Points \n💗💗💗")
        Button(action: {
            withAnimation {
            alertIsVisible = false
            }
            game.startNewRound(points: points)
        }) {
            ButtonText(text: "Start new round")
        }
        }
            .padding()
            .frame(maxWidth: 300)
            .foregroundColor(Color("Backgroundcolor"))
            .cornerRadius(21.0)
            .shadow(radius: 10, x: 5, y: 5)
            .transition(.scale)
    
    }
}

struct PointsView_Previews: PreviewProvider {
    
    static private var alertIsVisible = Binding.constant(false)
    static private var slidervalue = Binding.constant(50.0)
    static private var game = Binding.constant(Game())
   
    static var previews: some View {
        PointsView(alertIsVisible: alertIsVisible, sliderValue: slidervalue, game: game)
        PointsView(alertIsVisible: alertIsVisible, sliderValue:slidervalue, game: game)
            .previewLayout(.fixed(width: 568, height: 320))
        ContentView()
            .preferredColorScheme(.dark)
        PointsView(alertIsVisible: alertIsVisible, sliderValue: slidervalue, game: game)
            .preferredColorScheme(.dark)

            .previewLayout(.fixed(width: 568, height: 320))
    
    }
}
