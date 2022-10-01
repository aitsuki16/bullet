//
//  ContentView.swift
//  bulleye
//
//  Created by Ai on 2022/09/05.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    var body: some View {
        ZStack {
            BackgroundView(game: $game)
            VStack {
              
              InstructionsView(game: $game)
                    .padding(.bottom, alertIsVisible ? 0 : 100)
                
                if alertIsVisible {
                    PointsView()
                } else {
              HitMeButton(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
                }
        }
            if !alertIsVisible {
                SliderView(sliderValue:$sliderValue)
            }
             


    }
}
}
struct InstructionsView: View {
    @Binding var game: Game
    var body: some View {
        VStack {
            InstructionText(text: "💓💓💓💓💓\nlove measure")
            .padding(.leading, 30.0)
            .padding(.trailing, 30.0)
           
            BigNumberText(text: String(game.target))
        }
    }
}

//
struct SliderView: View {
    @Binding var sliderValue: Double
    
    var body: some View {
        HStack {
            //Text ("1")
            SliderLabelText(text: "1")
            Slider(value: self.$sliderValue, in: 1.0...100.0)
            SliderLabelText(text: "100")
        }
            .padding()
        
    }
}

//
struct HitMeButton: View {
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    var body: some View {
        Button(action: {
            alertIsVisible = true
          
        }) {
            Text("Touch Me".uppercased())
            .bold()
            .font(.title3)
        }
        .padding(20.0)
        .background(
            ZStack {
            Color("ColorButton")
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
        })
        .foregroundColor(Color.teal)
        .cornerRadius(21.0)
        .overlay(RoundedRectangle(cornerRadius: 21.0).strokeBorder(Color.white, lineWidth: 2.0))
       
        /*.alert(isPresented: $alertIsVisible, content: {
            let roundedValue = Int(sliderValue.rounded())
            let points = game.points(sliderValue: roundedValue)
            return Alert(title: Text("Hello there"), message: Text("The slider's value is \(roundedValue).\n" + "You scored \(points) points this round" ), dismissButton: .default(Text("Awesome!")){
                game.startNewRound(points: points)
                
            })
        })*/

    }
        
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.dark)

            .previewLayout(.fixed(width: 568, height: 320))
    
    }
}
