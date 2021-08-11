//
//  Circuits.swift
//  Chrono
//
//  Created by Sagar on 2021-06-15.
//

import SwiftUI


struct Circuits: View {
    var body: some View {
        
        VStack(spacing: 20){
            
            ScrollView(.vertical, showsIndicators: false) {
                
                Circuit_Row(name: "Jump Rope Warmup", image: "ic_jump_rope", setCount: 5, rest: 10, work: 15)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 5)
                    .padding(.top, 5)
                
                Circuit_Row(name: "Push Ups", image: "ic_arm", setCount: 4, rest: 40, work: 60)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 5)

                Circuit_Row(name: "Bench", image: "ic_bench_press", setCount: 4, rest: 40, work: 60)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 5)

                Spacer()
            }
        }
        
        .navigationTitle("Circuits")
                
    }
}

struct Circuits_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Circuits()
        }
    }
}
