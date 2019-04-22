import Foundation
import UIKit

extension String {
    func attributedString(font: CustomFonts, size: CGFloat, color: UIColor) -> NSAttributedString {
        let font = FontHelper.font(for: font, and: size)
        let attributes: [NSAttributedString.Key: Any] =
            [ NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: color ]
        return NSAttributedString(string: self, attributes: attributes)
    }
}
