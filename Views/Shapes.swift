//
//  Shapes.swift
//  bulleye
//
//  Created by Ai on 2022/09/21.
//

import SwiftUI

struct Shapes: View {
    
    @State private var wideShapes = true
    var body: some View {
        VStack{
            if !wideShapes {
              
               Circle()
                //.fill(Color.blue)
                .strokeBorder(Color.blue, lineWidth: 20.0)
                .frame(width: 200, height: 100.0)
            }
            
            RoundedRectangle(cornerRadius: 20.0)
                .fill(Color.blue)
                .frame(width: wideShapes ? 200 : 100, height: 100.0)
            Capsule()
                .fill(Color.blue)
                .frame(width: wideShapes ? 200 : 100, height: 100.0)
                .transition(.scale)
            Ellipse()
                .fill(Color.blue)
                .frame(width: wideShapes ? 200 : 100, height: 100.0)
            Button(action: {
                withAnimation {
                wideShapes.toggle()
                }
            }) {
            Text("Animate!")
        }
    }
        .background(Color.teal)
}
}
struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
    }
}

