//
//  ContentView.swift
//  TimerProject
//
//  Created by Roberta Marino on 20/05/23.
//

import SwiftUI

 

struct ContentView: View {
    
    @State var countDownTimer = 5
    @State var timerRunning = false
    @State var backgroundToggle = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
        ZStack{
            if backgroundToggle {
                            Color.blue.ignoresSafeArea()
                        } else {
                            Color.yellow.ignoresSafeArea()
                        }
                        Text("Background alternates every 2 seconds")
                        .font(.system(size: 20, weight: .bold))
                        //.opacity(0.80)
                        .foregroundColor(.white)
            .onAppear(perform: {
                Timer.scheduledTimer(withTimeInterval:2.0, repeats: true) {
                    time in
                    backgroundToggle.toggle()
                    }
                })
        VStack {
                
            Text("CountDown")
                .font(.system(size: 50, weight: .bold))
                //.opacity(0.80)
                .foregroundColor(.white)
                Text(" \(countDownTimer)").onReceive(timer){
                    _ in
                    if countDownTimer > 0 && timerRunning{
                        countDownTimer -= 1
                    }else{
                        timerRunning = false
                    }
                }
                .font(.system(size: 120, weight: .bold))
                //.opacity(0.80)
                .foregroundColor(.white)
            Spacer()
                HStack(spacing: 30){
                    Button("Start"){
                        timerRunning = true
                        
                    }
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
                    
                    
                    Button("Reset"){
                        countDownTimer = 5
                    }
                    .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.red)
                       // .backgroundStyle(.red)
                }
                
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.white)
            Spacer()
                Text("Time is running out")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
