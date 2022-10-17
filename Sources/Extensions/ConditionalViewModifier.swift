//
//  ConditionalViewModifier.swift
//  
//
//  Created by Robin Israel on 10/17/22.
//

import SwiftUI

public extension View {

	@ViewBuilder
	func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
		if (condition) {
			transform(self)
		} else {
			self
		}
	}
}
