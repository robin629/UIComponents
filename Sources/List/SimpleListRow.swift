//
//  SimpleListRow.swift
//  
//
//  Created by Robin Israel on 5/2/23.
//

import SwiftUI

public struct ListRow: View {
    private let icon:     Image?
    private let title:    String
    private let subTitle: String?
    private let detail:     String?
    
    public init(_ title: String) {
        self.icon     = nil
        self.title    = title
        self.subTitle = nil
        self.detail	  = nil
    }
    
    public init(_ title: String, systemName: String) {
        self.icon     = Image(systemName: systemName)
        self.title    = title
        self.subTitle = nil
        self.detail	  = nil
    }
    
    public init(_ title: String, icon: Image) {
        self.icon     = icon
        self.title    = title
        self.subTitle = nil
        self.detail	  = nil
    }

    
    public init(_ title: String, subTitle: String) {
        self.icon     = nil
        self.title    = title
        self.subTitle = subTitle
        self.detail	  = nil
    }
    
    public init(_ title: String, subTitle: String, systemName: String) {
        self.icon     = Image(systemName: systemName)
        self.title    = title
        self.subTitle = subTitle
        self.detail	  = nil
    }
    
    public init(_ title: String, subTitle: String, icon: Image) {
        self.icon     = icon
        self.title    = title
        self.subTitle = subTitle
        self.detail	  = nil
    }
    
    public init(_ title: String, detail: String) {
        self.icon     = nil
        self.title    = title
        self.subTitle = nil
        self.detail	  = detail
    }
    
    public init(_ title: String, subTitle: String, detail: String) {
        self.icon     = nil
        self.title    = title
        self.subTitle = subTitle
        self.detail	  = detail
    }
    
    public init(_ title: String, subTitle: String, detail: String, systemName: String) {
        self.icon     = Image(systemName: systemName)
        self.title    = title
        self.subTitle = subTitle
        self.detail	  = detail
    }
    
    public init(_ title: String, subTitle: String, detail: String, icon: Image) {
        self.icon     = icon
        self.title    = title
        self.subTitle = subTitle
        self.detail	  = detail
    }

    public var body: some View {
		HStack {
			if let icon = icon {
				icon
			}

			VStack(alignment: .leading) {
				Text(title)
				
				if let subTitle = subTitle {
					Text(subTitle)
						.foregroundColor(.secondary)
						.font(.caption)
				}
			}
			
			Spacer()
			
			if let detail = detail {
				Text(detail)
					.foregroundColor(.secondary)
					.frame(alignment: .trailing)
			}
		}
    }
}

struct ListRow_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            List {
                ListRow("Row Title", systemName: "gear")
                
				ListRow("Row Title", subTitle: "Subtitle")
                
				ListRow("Row Title", detail: "Row Info")
                
				ListRow("Row Title", subTitle: "Subtitle", detail: "Row Info")
				ListRow("Row Title", subTitle: "Subtitle", detail: "Row Info")
                
				ListRow("Row Title", detail: "Row Info")
					.navigationLink {
						Text("View")
					}
            }
        }
    }
}
