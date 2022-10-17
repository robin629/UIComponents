//
//  UserCard.swift
//  
//
//  Created by Robin Israel on 10/16/22.
//

import SwiftUI

public struct UserCard: View {
	private var firstName: String
	private var lastName:  String
	private var userIcon:  Image?
	private var iconSize:  CGFloat?

	public init(firstName: String, lastName: String, userIcon: Image? = nil) {
		self.firstName = firstName
		self.lastName  = lastName
		self.userIcon  = userIcon
	}

	public var body: some View {
		HStack(spacing: 10) {
			UserIcon(firstName: firstName, lastName: lastName, userIcon: userIcon, iconSize: iconSize)

			VStack(alignment: .leading, spacing: 5) {
				Text("\(firstName) \(lastName)")
					.fontWeight(.medium)
			}
			
			Spacer()
		}
	}
}

public extension UserCard {
	func iconSize(_ size: CGFloat) -> some View {
		var newView = self
		
		newView.iconSize = size
		
		return newView
	}
}

struct UserCard_Previews: PreviewProvider {
	struct Preview: View {
		var body: some View {
			GeometryReader { g in
				List {
					Section {
						UserCard(firstName: "Example", lastName: "User")
						UserCard(firstName: "Robin", lastName: "Israel", userIcon: Image(systemName:  "person.circle.fill"))
					}
					
					Text("Example Row")
				}
				.if (Device.Platform.iPad) { myView in
					myView.padding(.horizontal, g.size.width/8)
				}
				
				#if os(iOS)
				.background(Color.systemGroupedBackground.ignoresSafeArea())
				#endif
			}
		}
	}

	static var previews: some View {
		Preview()
			.previewLayout(.device)
	}
}
