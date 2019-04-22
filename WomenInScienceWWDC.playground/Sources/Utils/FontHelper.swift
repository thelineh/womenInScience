import Foundation
import UIKit

enum CustomFonts {
    case montserratBold
    case montserrat
    case openSans
    case openSansBold
    
    static func allFonts() -> [CustomFonts] {
        return [.montserratBold, .montserrat, .openSans, .openSansBold]
    }
    
    var fontName: String {
        switch self {
        case .montserrat:
            return "Montserrat-Regular"
        case .montserratBold:
            return "Montserrat-Bold"
        case .openSansBold:
            return "OpenSans-Bold"
        case .openSans:
            return "OpenSans-Regular"
        }
    }
}

enum RegisterFontError: Error {
    case fontPathNotFound
    case registerFailed
}

extension UIFont {
    static func nonNilFont(name fontName: String, size fontSize: CGFloat) -> UIFont {
        guard let font = UIFont(name: fontName, size: fontSize) else {
            fatalError("\(fontName) was not found")
        }
        return font
    }
    
    static func register(fileNameString: String, type: String) -> RegisterFontError? {
        guard let fontURL = Bundle.main.url(forResource: fileNameString, withExtension: type) else {
            return RegisterFontError.fontPathNotFound
        }
        
        guard CTFontManagerRegisterFontsForURL(fontURL as CFURL, CTFontManagerScope.process, nil) else {
            return RegisterFontError.registerFailed
        }
        
        return nil
    }
}

public class FontHelper {
    static var registerFonts: [RegisterFontError?] = {
        let fontNames = CustomFonts.allFonts().map({$0.fontName})
        return fontNames.map({UIFont.register(fileNameString: $0, type: "ttf")})
    }()
    
    static func font(for name: CustomFonts, and size: CGFloat) -> UIFont {
        let _ = FontHelper.registerFonts
        return UIFont.nonNilFont(name: name.fontName, size: size)
    }
}
