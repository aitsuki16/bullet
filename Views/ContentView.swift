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
        VStack {
          
            Text("❤️‍🔥❤️‍🔥❤️‍🔥❤️‍🔥❤️‍🔥 \n Love Measure")
                .bold()
                .kerning(2.0)
                .multilineTextAlignment(.center)
                .lineSpacing(4.0)
                .font(.footnote)
            Text(String(game.target))
                .kerning(-1.0)
                .font(.largeTitle)
                .fontWeight(.black)
            HStack {
            Text ("1")
                    .bold()
                Slider(value: self.$sliderValue, in: 1.0...100.0)
            Text("100")
                    .bold()
            }
            
            Button(action: {
                self.alertIsVisible = true
            }) {
                Text("Touch Me")
            }
            .alert(isPresented: $alertIsVisible, content: {
                let roundedValue = Int(sliderValue.rounded())
                return Alert(title: Text("Hello there"), message: Text("The slider's value is \(roundedValue).\n" + "You scored \(game.points(sliderValue: roundedValue)) points this round" ), dismissButton: .default(Text("Awesome!")))
            })

        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
