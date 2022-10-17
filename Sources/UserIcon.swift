//
//  UserIcon.swift
//  
//
//  Created by Robin Israel on 10/17/22.
//

import SwiftUI

public struct UserIcon: View {
	private var iconSize: CGFloat
	private var userIcon: Image?
	private var initials: String
   
	public init(firstName: String, lastName: String, userIcon: Image? = nil, iconSize: CGFloat? = nil) {
		self.userIcon = userIcon

		if let firstInitial = firstName.first, let lastInitial = lastName.first {
		   initials = "\(String(describing: firstInitial))\(String(describing: lastInitial))"
		} else {
		   initials = ""
		}
		
		if let iconSize = iconSize {
			self.iconSize = iconSize
		} else {
			self.iconSize = UserIcon.getDefaultIconSize()
		}
   }

	public var body: some View {
	   if let icon = userIcon {
		   icon
			   .resizable()
			   .scaledToFill()
			   .frame(width: iconSize, height: iconSize)
			   .clipShape(Circle())
			   .scaledToFit()
			#if os(iOS)
				.foregroundColor(.systemGray2)
			#else
				.foregroundColor(.gray)
			#endif
	   } else {
		   Circle()
		   #if os(iOS)
			   .foregroundColor(.systemGray2)
		   #else
			   .foregroundColor(.gray)
		   #endif
			   .frame(width: iconSize, height: iconSize)
			   .overlay(
					Text(initials)
						.font(.system(.title2, design: .rounded))
						.foregroundColor(.white)
						.scaledToFit()
			   )
	   }
   }
}

private extension UserIcon {
	static func getDefaultIconSize() -> CGFloat {
#if os(tvOS)
		return 115
#elseif os(macOS)
		return 38
#else
		if (Device.Platform.iPad) {
			return 45
		} else {
			return 50
		}
#endif
	}
}

struct UserIcon_Previews: PreviewProvider {
	static var previews: some View {
		List {
			Section {
				UserIcon(firstName: "Robin", lastName: "Israel")
			}
			
			Text("Example Row")
		}
	}
}
