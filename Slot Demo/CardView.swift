//
//  CardView.swift
//  Slot Demo
//
//  Created by ruanjianyingyongbu on 2021/9/3.
//

import SwiftUI

struct CardView: View {
    @Binding var symbol:String
    var body: some View {
        Image(symbol)
            .resizable()
            .aspectRatio(1,contentMode:.fit)
            .background(Color.white.opacity(0.5))
            .cornerRadius(20)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(symbol: Binding.constant("cat"))
    }
}
