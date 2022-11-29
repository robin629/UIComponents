//
//  TileGridSection.swift
//  
//
//  Created by Robin Israel on 11/16/22.
//

import SwiftUI

public struct TileGridSection<Content: View>: View {
	let content: () -> Content
	let header: String?
	let footer: String?
	
	public init(header: String? = nil, footer: String? = nil, @ViewBuilder content: @escaping () -> Content) {
		self.content = content
		self.header = header
		self.footer = footer
	}

	public var body: some View {
		VStack(alignment: .leading) {
			if let header = header {
				Text(header)
					.font(.title)
					.fontWeight(.bold)
					.foregroundColor(.label)
			}
			
			content()
			
			if let footer = footer {
				Text(footer)
			}
		}.frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct TileGridSection_Previews: PreviewProvider {
	struct Preview: View {
		var body: some View {
			TileGrid {
				TileGridSection(header: "System Settings") {
					List {
						Text("Rown 0")
						Text("Row 1")
						
						Section {
							Text("Row 2")
						}
					}
					
				}.background(Color.gray)
				
				TileGridSection(header: "Partition Settings") {
					
				}
			}
		}
	}

    static var previews: some View {
		Preview()
    }
}
