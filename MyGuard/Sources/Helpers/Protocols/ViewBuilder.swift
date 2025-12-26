//
//  ViewBuilder.swift
//  MyGuard
//
//  Created by Иван Спирин on 26.06.2025.
//

import SwiftUI

protocol ViewsBuilder {
    associatedtype ContentType: View
    
    @ViewBuilder var view: ContentType { get }
}
