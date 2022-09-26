//
//  Shapes.swift
//  bulleye
//
//  Created by Ai on 2022/09/21.
//

import SwiftUI

struct Shapes: View {
    var body: some View {
        VStack{
            Circle()
                //.fill(Color.blue)
                .strokeBorder(Color.blue, lineWidth: 20.0)
                .frame(width: 200, height: 100.0)

        }
        .background(Color.teal)
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
    }
}