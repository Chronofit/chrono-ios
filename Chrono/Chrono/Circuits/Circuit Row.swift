//
//  Circuit Row.swift
//  Chrono
//
//  Created by Sagar on 2021-06-15.
//

import SwiftUI

struct Circuit_Row: View {
    
    @State var name: String
    @State var image: String
    
    //Will get placed from object
    @State var setCount: Int
    @State var rest: Int
    @State var work: Int


    var body: some View {
        HStack(alignment: .center, spacing: 16){
            Image(image)
                .resizable()
                .frame(width: 50, height: 50, alignment: .center)
            
            VStack {
                Leading {
                    Text(name)
                        .customFont(fontGroup: .nunito, fontStyle: .regular, size: 22)
                        .foregroundColor(Color("CircuitCard-Primary"))
                }
                Leading {
                    Text("\(setCount) Sets")
                        .customFont(fontGroup: .nunito, fontStyle: .regular, size: 14)
                        .foregroundColor(Color("CircuitCard-Secondary"))
                }
                HStack{
                    BottomLabel(time: rest, image: "timer_black", type: "Rest")
                    Spacer()
                    BottomLabel(time: work, image: "timer_black", type: "Work")
                }
                .offset(x: -1, y: 0)
            }
        }
        .padding()
        .background(Color(UIColor.systemBackground))
        .cornerRadius(10)
        .shadow(color: .secondary, radius: 1.5, x: 0, y: 1.0)

    }
}

private struct BottomLabel: View {
    var time: Int
    var image: String
    var type: String
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 4) {
            Image(image)
                .resizable()
                .frame(width: 18, height: 18, alignment: .center)
                .foregroundColor(Color("CircuitCard-Primary"))
            Text("\(type) \(time)s")
                .customFont(fontGroup: .nunito, fontStyle: .regular, size: 14)
                .foregroundColor(Color("CircuitCard-Primary"))
        }
    }
}

struct Circuit_Row_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            Circuit_Row(name: "Jump Rope Warmup", image: "ic_jump_rope", setCount: 5, rest: 10, work: 15)
                .padding(.bottom, 5)
            Circuit_Row(name: "Jump Rope Warmup", image: "ic_jump_rope", setCount: 5, rest: 10, work: 15)
        }
        .preferredColorScheme(.light)
        .padding(.horizontal)
    }
}
