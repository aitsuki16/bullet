//
//  RoundedViews.swift
//  bulleye
//
//  Created by Ai on 2022/09/21.
//

import SwiftUI

struct RoundedImageViewStroked: View {
    var systemName: String
   
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: Constant.General.roundedViewLenght, height: Constant.General.roundedViewLenght)
            .overlay(
                Circle()
                    .strokeBorder(Color("ButtonStrokeColor"),
                                  lineWidth: Constant.General.strokeWidth)
            )
    }
}
struct RoundedImageViewFilled: View {
    var systemName: String
   
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: Constant.General.roundedViewLenght, height: Constant.General.roundedViewLenght)
            .background(
                Circle()
                    .fill(Color("ButtonFilledBackgroundColor"))
            
)
            
          
    }
}

struct RoundRectTextView: View {
    var text: String
   
    var body: some View {
            
        Text(text)
            .kerning(-0.2)
            .bold()
            .font(.title3)
            .frame(width: Constant.General.roundedRectViewWidth, height: Constant.General.roundedRectViewHeight)
            .foregroundColor(Color("TextColor"))
            .overlay(
                RoundedRectangle(cornerRadius: 21.0)
                    .stroke(lineWidth: Constant.General.strokeWidth)
                    .foregroundColor(Color("ButtonStrokeColor"))
            )
    }
}

struct RoundedTextView: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
}
struct PreviewView: View {
    var body: some View {
        VStack(spacing: 10) {
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            
            RoundedImageViewFilled(systemName: "list.dash")
            RoundRectTextView(text: "100")
            RoundedTextView(text: "1")
            
        }
    }
}

struct RoundViews_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView()
            .previewInterfaceOrientation(.portraitUpsideDown)
        PreviewView()
            .preferredColorScheme(.dark)

    }
}
