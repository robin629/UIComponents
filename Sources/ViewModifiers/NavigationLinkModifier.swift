//
//  NavigationLinkModifier.swift
//
//
//  Created by Robin Israel on 10/23/23.
//

import SwiftUI

public struct NavigationLinkModifier<Destination: View>: ViewModifier {
	let destination: () -> Destination

	public func body(content: Content) -> some View {
		NavigationLink(destination: destination) {
			content
		}
	}
}

extension View {
	public func navigationLink(_ destination: @escaping () -> some View) -> some View {
		modifier(NavigationLinkModifier(destination: destination))
	}
}
