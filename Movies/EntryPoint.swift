//
//  EntryPoint.swift
//  Movies
//
//  Created by Rosendo Vázquez on 18/02/22.
//


import UIKit

public class EntryPoint {
    
    public static let bundle = Bundle(for: EntryPoint.self)
    public static let shared = EntryPoint()
    
    public static func startViperModule() -> UIViewController {
        return LoginRouter.createModule()
    }
}
