//
//  SidebarItem.swift
//  
//
//  Created by Robin Israel on 10/10/22.
//

import SwiftUI

public struct SidebarItem<V, Label, Destination>: View where V: Hashable, Label: View, Destination: View {
	let destination: Destination
	let label: 	 	 Label
	var tag: 		 V?
	var selection: 	 Binding<V?>? = nil
	
	public init(tag: V, selection: Binding<V?>, destination: Destination, label: Label) {
		self.destination = destination
		self.label 	 	 = label
		self.selection	 = selection
		self.tag		 = tag
	}
	
	public init(tag: V, selection: Binding<V?>, label: Label, @ViewBuilder destination: @escaping () -> Destination) {
		self.destination = destination()
		self.label 	 	 = label
		self.selection	 = selection
		self.tag		 = tag
	}
	
	public init(tag: V, selection: Binding<V?>, destination: Destination, @ViewBuilder label: @escaping () -> Label) {
		self.destination = destination
		self.label 	 	 = label()
		self.selection	 = selection
		self.tag		 = tag
	}
	
	public init(tag: V, selection: Binding<V?>, @ViewBuilder destination: @escaping () -> Destination, @ViewBuilder label: @escaping () -> Label) {
		self.destination = destination()
		self.label 	 	 = label()
		self.selection	 = selection
		self.tag 		 = tag
	}

	public var body: some View {
		if let tag = self.tag, let selection = self.selection {
			NavigationLink(tag: tag, selection: selection) {
				destination
			} label: {
				label
			}
		} else {
			NavigationLink {
				destination
			} label: {
				label
			}
		}
    }
}

extension SidebarItem where V == Never {
	public init(destination: Destination, label: Label) {
		self.destination = destination
		self.label		 = label
	}
	
	public init(label: Label, @ViewBuilder destination: @escaping () -> Destination) {
		self.destination = destination()
		self.label		 = label
	}
	
	public init(destination: Destination, @ViewBuilder label: @escaping () -> Label) {
		self.destination = destination
		self.label		 = label()
	}
	
	public init(@ViewBuilder destination: @escaping () -> Destination, @ViewBuilder label: @escaping () -> Label) {
		self.destination = destination()
		self.label		 = label()
	}
}

struct SidebarItem_Previews: PreviewProvider {
	enum Views {
		case View0
		case View1
		case View2
	}

	struct Preview: View {
		@State private var selection: Views? = .View0

		var body: some View {
			NavigationView {
				Sidebar {
					SidebarItem(tag: Views.View1, selection: $selection, destination: Text("Detail View 0"), label: Text("Detail 0"))

					SidebarItem(tag: Views.View1, selection: $selection, destination: Text("Detail View 1")) {
						Text("Detail 1")
					}
					
					SidebarItem(tag: Views.View2, selection: $selection, label: Text("Detail 2")) {
						Text("Detail View 2")
					}

					SidebarItem(tag: Views.View0, selection: $selection) {
						Text("Detail View 3")
					} label: {
						Text("Detail 3")
					}
					
					SidebarItem(destination: Text("Detail View 4"), label: Text("Detail 4"))
					
					SidebarItem(destination: Text("Detail View 5")) {
						Text("Detail 5")
					}
					
					SidebarItem(label: Text("Detail 6")) {
						Text("Detail View 6")
					}
					
					SidebarItem {
						Text("Detail View 7")
					} label: {
						Text("Detail 7")
					}

				}
			}
		}
	}

    static var previews: some View {
		Preview()
    }
}
