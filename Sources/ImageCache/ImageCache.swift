//
//  ImageCache.swift
//  UIComponents
//
//  Created by Robin Israel on 11/30/24.
//

import SwiftUI

#if canImport(AppKit)
public typealias PlatformImage = NSImage
#endif

#if canImport(UIKit)
public typealias PlatformImage = UIImage
#endif

@MainActor
public class ImageCache: ObservableObject {
	@Published public var cacheVersion = UUID()
	
	private var cache: NSCache<NSString, ImageCacheItemWrapper> = {
		let cache = NSCache<NSString, ImageCacheItemWrapper>()
		
		cache.countLimit = 100
		cache.totalCostLimit = 100 * 1024 * 1024
		
		return cache
	}()
	
	static public let shared = ImageCache()
	
	public func set(for key: String, item: ImageCacheItem) {
		cache.setObject(ImageCacheItemWrapper(item), forKey: key as NSString)
		
		cacheVersion = UUID()
	}
	
	public func get(for key: String) -> ImageCacheItem? {
		guard let item = cache.object(forKey: key as NSString) else {
			return nil
		}
		
		return item.state
	}
	
	public func remove(for key: String) {
		cache.removeObject(forKey: key as NSString)
		
		cacheVersion = UUID()
	}
	
	public func removeAll() {
		cache.removeAllObjects()
		
		cacheVersion = UUID()
	}
}

public enum ImageCacheItem: Equatable {
	case empty
	case loading(Date)
	case success(Image)
	case failure
}

// MARK: Wrapper for ImageCacheState to use with NSCache

fileprivate class ImageCacheItemWrapper {
	let state: ImageCacheItem
	
	init(_ state: ImageCacheItem) {
		self.state = state
	}
}
