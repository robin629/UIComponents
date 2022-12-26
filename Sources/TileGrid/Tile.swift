//
//  Tile.swift
//  
//
//  Created by Robin Israel on 11/16/22.
//

import SwiftUI

struct Tile<Content>: View where Content: View {
	let content: () -> Content
	
	init(@ViewBuilder content: @escaping () -> Content) {
		self.content = content
	}

	var body: some View {
		VStack {
			content()
		}
	}
}

struct Tile_Previews: PreviewProvider {
	struct Preview: View {
		var body: some View {
			TileGrid {
				Tile {
					Text("Tile Example")
				}
			}
		}
	}

	static var previews: some View {
		Preview()
	}
}
