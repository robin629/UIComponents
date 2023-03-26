//
//  ListBackgroundModifier.swift
//
//
//  Created by Robin Israel on 3/26/23.
//

import SwiftUI

public struct ListBackgroundModifier<V>: ViewModifier where V: View {
	let view: V

	public func body(content: Content) -> some View {
		if #available(macOS 13.0, iOS 16.0, *) {
			return content
				.scrollContentBackground(.hidden)
				.background(view)
		} else {
			
			return content
				.background(view)
		}
	}
}

public extension View {
	func listBackground<V>(_ view: V?) -> some View where V : View {
		return modifier(ListBackgroundModifier(view: view))
	}
}
