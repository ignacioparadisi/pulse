//
//  ContentView.swift
//  Shared
//
//  Created by Ignacio Paradisi on 12/16/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var metronome = Metronome()
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("\(Int(metronome.bpm))")
                    .font(.system(size: 50))
                    .bold()
                    .padding()
                Text("BPM")
                    .bold()
                Spacer()
            }
            Stepper("") {
                metronome.increase()
            } onDecrement: {
                metronome.decrease()
            }
            .labelsHidden()

            
            Button(action: {
                metronome.enabled.toggle()
            }, label: {
                Image(systemName: metronome.enabled ? "stop.fill" : "play.fill")
                    .font(.system(size: 50))
            })
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
