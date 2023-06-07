//
//  ViewSizeReader.swift
//  
//
//  Created by Robin Israel on 6/4/23.
//

import SwiftUI

public struct ViewSizeReader: ViewModifier {
    @Binding var size: CGSize
    
    public func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { proxy in
                    Color.clear
                        .onAppear {
                            DispatchQueue.main.async {
                                self.size = proxy.size
                            }
                        }
                        .onChange(of: proxy.size) { newValue in
                            DispatchQueue.main.async {
                                self.size = newValue
                            }
                        }
                }
            )
    }
}

public extension View {
    func readViewSize(_ size: Binding<CGSize>) -> some View {
        modifier(ViewSizeReader(size: size))
    }
}
