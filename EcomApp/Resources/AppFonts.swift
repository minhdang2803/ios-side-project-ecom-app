//
//  AppFonts.swift
//  EcomApp
//
//  Created by Antigravity on 7/21/26.
//

import UIKit

public extension UIFont {
    
    enum RobotoWeight: String {
        case thin = "Thin"
        case thinItalic = "ThinItalic"
        case light = "Light"
        case lightItalic = "LightItalic"
        case regular = "Regular"
        case italic = "Italic"
        case medium = "Medium"
        case mediumItalic = "MediumItalic"
        case semiBold = "SemiBold"
        case semiBoldItalic = "SemiBoldItalic"
        case bold = "Bold"
        case boldItalic = "BoldItalic"
        case extraBold = "ExtraBold"
        case extraBoldItalic = "ExtraBoldItalic"
        case black = "Black"
        case blackItalic = "BlackItalic"
        
        var systemWeight: UIFont.Weight {
            switch self {
            case .thin, .thinItalic: return .thin
            case .light, .lightItalic: return .light
            case .regular, .italic: return .regular
            case .medium, .mediumItalic: return .medium
            case .semiBold, .semiBoldItalic: return .semibold
            case .bold, .boldItalic: return .bold
            case .extraBold, .extraBoldItalic: return .heavy
            case .black, .blackItalic: return .black
            }
        }
    }
    
    /// Returns a Roboto font with the specified size and weight.
    /// - Parameters:
    ///   - size: The size of the font.
    ///   - weight: The weight of the font.
    /// - Returns: A UIFont object.
    static func roboto(size: CGFloat, weight: RobotoWeight = .regular) -> UIFont {
        let fontName = "Roboto-\(weight.rawValue)"
        return UIFont(name: fontName, size: size) ?? UIFont.systemFont(ofSize: size, weight: weight.systemWeight)
    }
    
    /// Returns a Roboto Condensed font with the specified size and weight.
    /// - Parameters:
    ///   - size: The size of the font.
    ///   - weight: The weight of the font.
    /// - Returns: A UIFont object.
    static func robotoCondensed(size: CGFloat, weight: RobotoWeight = .regular) -> UIFont {
        let fontName = "Roboto_Condensed-\(weight.rawValue)"
        return UIFont(name: fontName, size: size) ?? UIFont.systemFont(ofSize: size, weight: weight.systemWeight)
    }
    
    /// Returns a Roboto SemiCondensed font with the specified size and weight.
    /// - Parameters:
    ///   - size: The size of the font.
    ///   - weight: The weight of the font.
    /// - Returns: A UIFont object.
    static func robotoSemiCondensed(size: CGFloat, weight: RobotoWeight = .regular) -> UIFont {
        let fontName = "Roboto_SemiCondensed-\(weight.rawValue)"
        return UIFont(name: fontName, size: size) ?? UIFont.systemFont(ofSize: size, weight: weight.systemWeight)
    }
}
