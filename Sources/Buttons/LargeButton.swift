//
//  LargeButton.swift
//  
//
//  Created by Robin Israel on 2/1/23.
//

import SwiftUI

public struct LargeButton: ButtonStyle {
	public func makeBody(configuration: Configuration) -> some View {
		configuration.label
			.padding(15)
			.frame(maxWidth: .infinity)
			.background(Color.accentColor)
			.foregroundColor(Color.white)
			.cornerRadius(10)
			.padding(.horizontal, 40)
	}
}

extension ButtonStyle where Self == LargeButton {
	public static var largeButton: Self { Self() }
}
