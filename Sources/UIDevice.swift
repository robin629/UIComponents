//
//  UIDevice.swift
//  
//
//  Created by Robin Israel on 10/17/22.
//

import Foundation

#if os(iOS)

import UIKit

public class Device {
	
	// MARK: Device Platform Types
	
	public class Platform {
		public static var iPhone: Bool {
			return .phone == UIDevice.current.userInterfaceIdiom
		}
		
		public static var iPad: Bool {
			return .pad == UIDevice.current.userInterfaceIdiom
		}
		
		public static var mac: Bool {
			return .mac == UIDevice.current.userInterfaceIdiom
		}
		
		public static var tv: Bool {
			return .tv == UIDevice.current.userInterfaceIdiom
		}
		
		public static var carPlay: Bool {
			return .carPlay == UIDevice.current.userInterfaceIdiom
		}
		
		public static var watch: Bool {
			return false;
		}
	}
	
	// MARK: Device Orientations
	
	public class Orientation {
		public static var isPortrait: Bool {
			return UIDevice.current.orientation.isPortrait
		}

		public static var isLandscape: Bool {
			return UIDevice.current.orientation.isLandscape
		}
		
		public static var isFLat: Bool {
			return UIDevice.current.orientation.isFlat
		}
	}
}

#else

public class Device {

	// MARK: Device Platform Types
	
	public class Platform {
		public static var iPhone: Bool {
			return false
		}
		
		public static var iPad: Bool {
			return false
		}
		
		public static var mac: Bool {
#if os(macOS)
			return true
#else
			return false
#endif
		}
		
		public static var tv: Bool {
#if os(tvOS)
			return true
#else
			return false
#endif
		}
		
		public static var carPlay: Bool {
			return false
		}
		
		public static var watch: Bool {
#if os(watchOS)
			return true
#else
			return false
#endif
		}
	}
}

#endif
