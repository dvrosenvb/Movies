//
//  UIManager.swift
//  Movies
//
//  Created by Rosendo Vázquez on 18/02/22.
//
import Foundation
import UIKit
import SwiftUI

public struct UIManager {
    
    //MARK: Values
    public static let cornerRadiusBtn = 10.0
    public static let alphaStandard = 0.3
    public static let avatarSize = 120.0
    public static let avatarCurve = avatarSize / 2
    
    public static let nameImageHeadLogin = "headImage"
    public static let nameImageLogo = "logo"
    
    public static let txtPlaceholderUserName = "Username"
    public static let txtPlaceholderPassword = "Password"
    
    public static let txtButtonLogin = "Log in"
    public static let sampleText = " "
    
    public static let txtMsgLogout = "What do you want to do?"
    public static let txtViewProfile = "View profile"
    public static let txtLogout = "Log out"
    public static let txtMsgCancel = "Cancel"
    
    public static let titleProfile = "Profile"
    public static let userRealName = "Rosendo"
    public static let userName = "@Rosenvb"
    public static let txtMovieFavTitle = "Favorites"
    
    
    //MARK: - Colors -
    public static let BLUE_MAIN = #colorLiteral(red: 0.05098039216, green: 0.1450980392, blue: 0.2470588235, alpha: 1)
    public static let GRAY_BASE = #colorLiteral(red: 0.03171499154, green: 0.09323284489, blue: 0.1588344381, alpha: 1)
    public static let DARK = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    public static let BLUE_SECONDARY = #colorLiteral(red: 0.003921568627, green: 0.7058823529, blue: 0.8941176471, alpha: 1)
    public static let GREEN = #colorLiteral(red: 0.5647058824, green: 0.8078431373, blue: 0.631372549, alpha: 1)
    public static let BASIC_WHITE = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    
    public static func RegularFont(_ ofSize: CGFloat) -> UIFont {
        return UIFont(name: "Manrope", size: ofSize) ?? UIFont.systemFont(ofSize: ofSize, weight: .regular)
    }
    
    public static func customizeBar(vc:UIViewController ,vcTitle:String, leftBtnHidden:Bool)  {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIManager.GRAY_BASE
        let titleAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .bold), NSAttributedString.Key.foregroundColor: UIManager.BASIC_WHITE]
        appearance.titleTextAttributes = titleAttribute
        
        vc.navigationItem.hidesBackButton = leftBtnHidden
        vc.title = vcTitle
        vc.navigationController?.navigationBar.standardAppearance = appearance
        vc.navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    
}
