//
//  UserIcon.swift
//  
//
//  Created by Robin Israel on 10/17/22.
//

import SwiftUI

public struct UserIcon: View {
   private var userIcon: Image?
   private var initials: String
   
	public init(firstName: String, lastName: String, userIcon: Image? = nil) {
	   self.userIcon = userIcon
	   
	   if let firstInital = firstName.first, let lastInital = lastName.first {
		   initials = "\(String(describing: firstInital))\(String(describing: lastInital))"
	   } else {
		   initials = ""
	   }
   }

	public var body: some View {
	   if let icon = userIcon {
		   icon
			   .resizable()
			   .scaledToFill()
			   .frame(width: 50, height: 50)
			   .foregroundColor(.systemGray2)
			   .clipShape(Circle())
			   .scaledToFit()
	   } else {
		   Circle()
			   .frame(width: 50, height: 50)
			   .foregroundColor(.systemGray2)
			   .overlay(
				   Text(initials)
					   .font(.system(.title2, design: .rounded))
					   .foregroundColor(.white)
					   .scaledToFit()
			   )
	   }
   }
}

struct UserIcon_Previews: PreviewProvider {
	static var previews: some View {
		UserIcon(firstName: "Robin", lastName: "Israel", userIcon: Image(uiImage: UIImage(
			contentsOfFile: "/Users/robinisrael/Downloads/TestImage")!))
			.previewLayout(.sizeThatFits)
	}
}
