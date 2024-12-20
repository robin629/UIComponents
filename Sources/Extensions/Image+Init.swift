//
//  Image+Init.swift
//  Identity
//
//  Created by Robin Israel on 11/25/24.
//

import SwiftUI

extension Image {
	
	public init?(data: Data) {
		guard let platformImage = PlatformImage(data: data) else { return nil }
		
#if os(macOS)
		self.init(nsImage: platformImage)
#else
		self.init(uiImage: platformImage)
#endif
	}
	
	public init?(platformImage: PlatformImage) {
#if os(macOS)
		self.init(nsImage: platformImage)
#else
		self.init(uiImage: platformImage)
#endif
	}
}
