//
//  SegmentTabView.swift
//  
//
//  Created by Robin Israel on 12/4/22.
//

import SwiftUI

@resultBuilder
public struct SegmentTabViewBuilder {
	public static func buildBlock(_ components: SegmentTab...) -> [SegmentTab] {
		return components
	}
}

public struct SegmentTab: Hashable, Identifiable {
	let name: String
	let view: AnyView?

	public let id = UUID()
	
	internal init() {
		self.name = ""
		self.view = nil
	}
	
	public init<Content: View>(_ name: String, @ViewBuilder content: @escaping () -> Content) {
		self.name = name
		self.view = AnyView(content())
	}
	
	public static func == (lhs: SegmentTab, rhs: SegmentTab) -> Bool {
		return lhs.name == rhs.name
	}
	
	public func hash(into hasher: inout Hasher) {
		hasher.combine(name)
	}
}

public struct SegmentTabView: View {
	private var tabList: [SegmentTab] = []
	
	@State private var selectedTab: SegmentTab = .init()

	public init(@SegmentTabViewBuilder content: @escaping () -> [SegmentTab]) {
		self.tabList = content()
	}

	public var body: some View {
		VStack {
			Picker("", selection: $selectedTab) {
				ForEach(tabList) { tab in
					Text(tab.name)
						.tag(tab)
				}
			}
			.pickerStyle(.segmented)
			.padding([.horizontal])
			
			Spacer()

			selectedTab.view
		}
		.onAppear {
			if (tabList.count > 0) {
				selectedTab = tabList[0]
			}
		}
	}
}

#if DEBUG
struct SwiftUIView_Previews: PreviewProvider {
	struct Preview: View {
		var body: some View {
			SegmentTabView {
				SegmentTab("Test 0") {
					Text("Test View 0")
				}
				
				SegmentTab("Test 1") {
					Text("Test View 1")
				}
			}
		}
	}

    static var previews: some View {
        Preview()
    }
}
#endif
