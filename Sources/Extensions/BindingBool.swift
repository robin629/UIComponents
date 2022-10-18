//
//  BindingBool.swift
//  
//
//  Created by Robin Israel on 10/18/22.
//

import SwiftUI

public extension Binding where Value == Bool {
	
	static prefix func ! (_ rhs: Binding<Bool>) -> Binding<Bool> {
		return Binding<Bool>(get: { !rhs.wrappedValue }, set: { rhs.wrappedValue = !$0 })
	}
}
