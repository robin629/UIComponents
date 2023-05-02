//
//  SimpleListRow.swift
//  
//
//  Created by Robin Israel on 5/2/23.
//

import SwiftUI

public struct SimpleListRow: View {
    private let icon:     Image?
    private let title:    String
    private let subTitle: String?
    private let info:     String?
    
    public init(_ title: String) {
        self.icon     = nil
        self.title    = title
        self.subTitle = nil
        self.info     = nil
    }
    
    public init(_ title: String, systemName: String) {
        self.icon     = Image(systemName: systemName)
        self.title    = title
        self.subTitle = nil
        self.info     = nil
    }
    
    public init(_ title: String, icon: Image) {
        self.icon     = icon
        self.title    = title
        self.subTitle = nil
        self.info     = nil
    }

    
    public init(_ title: String, subTitle: String) {
        self.icon     = nil
        self.title    = title
        self.subTitle = subTitle
        self.info     = nil
    }
    
    public init(_ title: String, subTitle: String, systemName: String) {
        self.icon     = Image(systemName: systemName)
        self.title    = title
        self.subTitle = subTitle
        self.info     = nil
    }
    
    public init(_ title: String, subTitle: String, icon: Image) {
        self.icon     = icon
        self.title    = title
        self.subTitle = subTitle
        self.info     = nil
    }
    
    public init(_ title: String, info: String) {
        self.icon     = nil
        self.title    = title
        self.subTitle = nil
        self.info     = info
    }
    
    public init(_ title: String, subTitle: String, info: String) {
        self.icon     = nil
        self.title    = title
        self.subTitle = subTitle
        self.info     = info
    }
    
    public init(_ title: String, subTitle: String, info: String, systemName: String) {
        self.icon     = Image(systemName: systemName)
        self.title    = title
        self.subTitle = subTitle
        self.info     = info
    }
    
    public init(_ title: String, subTitle: String, info: String, icon: Image) {
        self.icon     = icon
        self.title    = title
        self.subTitle = subTitle
        self.info     = info
    }

    public var body: some View {
        HStack(alignment: .center) {
            if let icon = icon {
                icon
            }

            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .foregroundColor(.label)
                
                if let subTitle = subTitle {
                    Text(subTitle)
                        .foregroundColor(.secondaryLabel)
                        .font(.caption)
                }
            }

            Spacer()
            
            if let info = info {
                Text(info)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .foregroundColor(.secondaryLabel)
            }
        }
    }
}

struct SimpleListRow_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            List {
                SimpleListRow("Row Title", systemName: "gear")
                
                SimpleListRow("Row Title", subTitle: "Subtitle")
                
                SimpleListRow("Row Title", info: "Row Info")
                
                SimpleListRow("Row Title", subTitle: "Subtitle", info: "Row Info")
                SimpleListRow("Row Title", subTitle: "Subtitle", info: "Row Info")
                
                NavigationLink {
                    
                } label: {
                    SimpleListRow("Row Title", info: "Row Info")
                }
            }
        }
    }
}
