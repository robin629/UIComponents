//
//  TileGrid.swift
//  
//
//  Created by Robin Israel on 11/16/22.
//

import SwiftUI

public struct TileGrid<Content>: View where Content: View {
	private let content: () -> Content
	
	public init(@ViewBuilder content: @escaping () -> Content) {
		self.content = content
	}

    public var body: some View {
		VStack(alignment: .leading) {
			content()
		}.frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct TileGrid_Previews: PreviewProvider {
	struct Preview: View {
		var body: some View {
			TileGrid {
				TileGridSection(header: "System") {
					Tile {
						
					}
				}
				
				TileGridSection(header: "Partition") {
					Tile {
						
					}
				}
			}
		}
	}

    static var previews: some View {
		Preview()
    }
}
