//
//  ConditionalViewModifier.swift
//  
//
//  Created by Robin Israel on 10/17/22.
//

import SwiftUI

public extension View {

	@ViewBuilder
	func `if`<Transform: View>(_ condition: Bool, transform: (Self) -> Transform) -> some View {
		if (condition) {
			transform(self)
		} else {
			self
		}
	}
	
	@ViewBuilder
	func `if`<TransformIf: View, TransformElse: View>(_ condition: Bool, if: (Self) -> TransformIf, else: (Self) -> TransformElse) -> some View {
		if (condition) {
			`if`(self)
		} else {
			`else`(self)
		}
	}
}
