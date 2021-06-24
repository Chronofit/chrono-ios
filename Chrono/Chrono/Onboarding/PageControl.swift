//
//  PageControl.swift
//  Chrono
//
//  Created by Sagar on 2021-06-23.
//

import SwiftUI

struct PageControl: UIViewRepresentable {
    @Binding var currentPage: Int
    var numberOfPages: Int
    
    typealias UIViewType = UIPageControl
    
    func makeUIView(context: Context) -> UIPageControl {
        let pageControl = UIPageControl()
        
        pageControl.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged(_:)),
            for: .valueChanged
        )
        
        pageControl.currentPage = currentPage
        pageControl.numberOfPages = numberOfPages
        pageControl.currentPageIndicatorTintColor = UIColor(.accentColor)
        pageControl.pageIndicatorTintColor = UIColor(Color(hex: "DFE0DF"))
        return pageControl
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        if uiView.currentPage != currentPage {
            uiView.currentPage = currentPage
        }
        if uiView.numberOfPages != numberOfPages {
            uiView.numberOfPages = numberOfPages
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $currentPage)
    }
    
    class Coordinator: NSObject {
        var currentPage: Binding<Int>
        
        init(value: Binding<Int>) {
            self.currentPage = value
        }
        
        @objc func valueChanged(_ pageControl: UIPageControl) {
            self.currentPage.wrappedValue = pageControl.currentPage
        }
    }
}
