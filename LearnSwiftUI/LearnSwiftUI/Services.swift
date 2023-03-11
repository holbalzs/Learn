//
//  Services.swift
//  LearnSwiftUI
//
//  Created by Holló Balázs on 2023. 03. 11..
//

import Foundation

protocol Writing: AnyObject {}
class WritingService: Writing {}

protocol ServiceType: AnyObject {}
class BookPublisherService: ServiceType {}

protocol ServiceType2: AnyObject {}
class PurchaseService: ServiceType2 {}

protocol ServiceType3: AnyObject {}
class SubscriberService: ServiceType3 {}
