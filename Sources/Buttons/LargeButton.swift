//
//  LargeButton.swift
//  
//
//  Created by Robin Israel on 2/1/23.
//

import SwiftUI

public struct LargeButton: ButtonStyle {
	private let textColor: Color
	private let color:     Color
	
	public init() {
		self.textColor = .white
		self.color     = .accentColor
	}
	
	public init(_ color: Color) {
		self.textColor = .white
		self.color     = color
	}
	
	public init(color: Color, textColor: Color) {
		self.textColor = color
		self.color     = color
	}

	public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding(10)
            .background(self.color)
            .foregroundColor(self.textColor)
            .cornerRadius(10)
            .frame(width: UIDeviceInfo.Platform.iPhone ? 310 : 350)
	}
}

extension ButtonStyle where Self == LargeButton {
	public static var largeButton: Self { Self() }
}
