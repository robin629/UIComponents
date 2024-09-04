//
//  FlowLayout.swift
//
//
//  Created by Robin Israel on 9/4/24.
//

import SwiftUI

@available(iOS 16.0, macOS 13.0, *)
public struct FlowLayout: Layout {
	public var alignment: Alignment
	public var spacing: CGFloat
	
	public init(alignment: Alignment = .leading, spacing: CGFloat = 10) {
		self.alignment = alignment
		self.spacing = spacing
	}
	
	public func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
		let maxWidth = proposal.replacingUnspecifiedDimensions().width
		let sizes 	 = subviews.map { $0.sizeThatFits(.unspecified) }
		
		return generateLayout(maxWidth: maxWidth, subviewSizes: sizes).containerSize
	}
	
	public func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
		let sizes 	= subviews.map { $0.sizeThatFits(.unspecified) }
		let offsets = generateLayout(maxWidth: bounds.width, subviewSizes: sizes).itemOffsets
		
		for (offset, subview) in zip(offsets, subviews) {
			subview.place(
				at: CGPoint(x: bounds.minX + offset.x, y: bounds.minY + offset.y),
				proposal: .unspecified
			)
		}
	}
	
	private func generateLayout(maxWidth: CGFloat, subviewSizes: [CGSize]) -> (itemOffsets: [CGPoint], containerSize: CGSize) {
		var offsets  = [CGPoint]()
		var position = CGPoint()
		var height   = CGFloat(0)
		var maxX	 = CGFloat(0)
		
		for size in subviewSizes {
			
			// Reset the X coordinate if needed
			if (position.x + size.width > maxWidth) {
				position.x = 0
				position.y += height + spacing
				
				height = 0
			}
			
			// Add item to offsets
			offsets.append(position)
			
			// Update the view's X offset
			position.x += size.width
			
			// Find the new max X position after adding item to view
			maxX = max(maxX, position.x)
			
			// Update the next item's starting X by adding the padding
			position.x += spacing
			
			// Update the total flow layout height
			height = max(height, size.height)
		}
		
		return (offsets, CGSize(width: maxX, height: position.y + height))
	}
}
