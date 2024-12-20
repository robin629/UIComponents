//
//  CachedImageView.swift
//  UIComponents
//
//  Created by Robin Israel on 11/30/24.
//

import SwiftUI

public struct CachedImageView: View {
	@ObservedObject private var imageCache = ImageCache.shared
	@State private var imageState: ImageCacheItem = .empty
	
	public let url: URL?
	public let downloadImage: (URL) async -> ImageCacheItem
	
	public var body: some View {
		GeometryReader { g in
			Group {
				
				switch imageState {
					case .empty:
						EmptyImageView()
					case .loading:
						LoadingImageView()
					case .failure:
						FailureImageView()
					case .success(let image):
						image
							.resizable()
							.scaledToFill()
				}
				
			}
			.frame(width: g.size.width, height: g.size.height, alignment: .center)
		}
		.onAppear {
			getImage()
		}
		.onReceive(imageCache.$cacheVersion) { _ in
			getImage()
		}
	}
	
	private func getImage() {
		guard let url else {
			self.imageState = .failure
			
			return
		}
		
		if let item = ImageCache.shared.get(for: url.absoluteString) {
			var expired = false
			
			if case .loading(let date) = item, date > .now + 10 {
				expired = true
			}
			
			if !expired {
				self.imageState = item
				
				return
			}
			
			print("Item is loading, but expired... downloading again.")
		}
		
		Task {
			let cacheState = await downloadImage(url)
			
			await MainActor.run {
				self.imageState = cacheState
			}
		}
	}
}

// MARK: - EmptyImageView placeholder when no image is found

fileprivate struct EmptyImageView: View {
	var body: some View {
		ZStack {
			Circle()
				.foregroundStyle(Color.accentColor)
			
			Image(systemName: "person.fill")
				.resizable()
				.scaledToFit()
				.foregroundStyle(.white)
				.scaleEffect(0.5)
		}
	}
}

// MARK: - LoadingImageView placeholder when the image is being downloaded

fileprivate struct LoadingImageView: View {
	var body: some View {
		ZStack {
			Circle()
				.foregroundStyle(.quaternary)
			
			ProgressView()
				.scaleEffect(0.7)
		}
	}
}

// MARK: - FailureImageView placeholder when the image failed to load

fileprivate struct FailureImageView: View {
	var body: some View {
		ZStack {
			Circle()
				.foregroundStyle(Color.accentColor)
			
			Image(systemName: "questionmark")
				.resizable()
				.scaledToFit()
				.foregroundStyle(.white)
				.scaleEffect(0.5)
		}
	}
}
