//
//  ContentView.swift
//  SwiftUI-Declarative-Course
//
//  Created by naseem on 24/10/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var bgColor = Color.white
    @State var colorValue = Color.white
    var body: some View {
        VStack {
            SquareColorPickerView(colorValue: $colorValue)

//            ColorPicker("Set the background color",
//                        selection: $bgColor,
//                        supportsOpacity: true)
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(bgColor)
//        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct SquareColorPickerView: View {
    
    @Binding var colorValue: Color
    
    var body: some View {
        
        colorValue
            .frame(width: 120, height: 120, alignment: .center)
//            .cornerRadius(10.0)
            .overlay(RoundedRectangle(cornerRadius: 1).stroke(Color.white, style: StrokeStyle(lineWidth: 1)))
            .padding(10)
//            .background(AngularGradient(gradient: Gradient(colors: [.red,.yellow,.green,.blue,.purple,.pink]), center:.center).cornerRadius(20.0))
            .overlay(ColorPicker("", selection: $colorValue).labelsHidden().opacity(0.015))
            .shadow(radius: 1)

    }
}
}
