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
			.padding(15)
			.frame(maxWidth: .infinity)
			.background(self.color)
			.foregroundColor(self.textColor)
			.cornerRadius(10)
			.padding(.horizontal, UIDeviceInfo.Platform.iPhone ? 40 : 100)
	}
}

extension ButtonStyle where Self == LargeButton {
	public static var largeButton: Self { Self() }
}
