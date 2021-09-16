//
//  ContentView.swift
//  Slot Demo
//
//  Created by ruanjianyingyongbu on 2021/9/3.
//

import SwiftUI

struct ContentView: View {
    @State private var symbols = ["cat","egg","rabbit"]
    @State private var numbers = [0,0,0]
    @State private var credits = 1000
    @State private var batAmount = 5
    var body: some View {
        ZStack{
            //background
            Rectangle()
                .foregroundColor(Color(red: 200/255, green: 143/255, blue: 32/255))
                .edgesIgnoringSafeArea(.all)
            
            Rectangle()
                .foregroundColor(Color(red: 228/255, green: 195/255, blue: 76/255))
                .rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Spacer()
                HStack{
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("SwiftUI Slots")
                        .bold()
                        .foregroundColor(.white)
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }.scaleEffect(2)
                Spacer()
                Text("Credits:"+String(credits))
                    .foregroundColor(.black)
                    .padding(.all,10)
                    .background(Color.white.opacity(0.56))
                    .cornerRadius(20)
                Spacer()
                HStack{
                    Spacer()
                    CardView(symbol: $symbols[numbers[0]])
                    CardView(symbol: $symbols[numbers[1]])
                    CardView(symbol: $symbols[numbers[2]])
                    Spacer()
                }
                Spacer()
                Button(action: {
                    
                    self.numbers = self.numbers.map({ _ in
                        Int.random(in: 0...self.symbols.count - 1)
                    })
                    
                    if self.numbers[0]==self.numbers[1]&&self.numbers[1]==self.numbers[2]
                    {
                        self.credits += self.batAmount * 10
                    }else{
                        self.credits -= self.batAmount
                    }
                    
                }, label: {
                    Text("Spin")
                        .bold()
                        .foregroundColor(.white)
                        .padding(.all,10)
                        .padding([.leading,.trailing],30)
                        .background(Color.pink)
                        .cornerRadius(20)
                })
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
