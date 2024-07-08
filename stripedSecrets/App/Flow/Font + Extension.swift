//
//  Font + Extension.swift

import Foundation
import UIKit

extension UIFont {
    
    enum CustomFonts: String {
        case joti = "JotiOne"
        case inter = "Inter"
        case sofia = "SofiaSans"
    }
    
    enum CustomFontStyle: String {
        case regular = "-Regular"
        case bold = "-Bold"
        case black = "-Black"
        case light = "-Light" 
    }
    
    static func customFont(
        font: CustomFonts,
        style: CustomFontStyle,
        size: Int,
        isScaled: Bool = true) -> UIFont {
            
            let fontName: String = font.rawValue + style.rawValue
            
            guard let font = UIFont(name: fontName, size: CGFloat(size)) else {
                debugPrint("Font can't be loaded")
                return UIFont.systemFont(ofSize: CGFloat(size))
            }
            
            return isScaled ? UIFontMetrics.default.scaledFont(for: font) : font
        }
}

extension UILabel {
    static func createLabel(withText text: String, font: UIFont, textColor: UIColor, paragraphSpacing: CGFloat, lineHeightMultiple: CGFloat, textAlignment: NSTextAlignment = .center) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = textAlignment
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.paragraphSpacing = paragraphSpacing
        paragraphStyle.lineHeightMultiple = lineHeightMultiple
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: textColor,
            .paragraphStyle: paragraphStyle
        ]
        
        let attributedString = NSAttributedString(string: text, attributes: attributes)
        label.attributedText = attributedString
        
        return label
    }
}

extension UITextView {
    static func createTextView(withText text: String, font: UIFont, textColor: UIColor, paragraphSpacing: CGFloat, lineHeightMultiple: CGFloat, textAlignment: NSTextAlignment = .center) -> UITextView {
        let textView = UITextView()
        textView.isEditable = false
        textView.textAlignment = textAlignment
        textView.textContainer.lineFragmentPadding = 0
        textView.textContainerInset = .zero
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.paragraphSpacing = paragraphSpacing
        paragraphStyle.lineHeightMultiple = lineHeightMultiple
        paragraphStyle.alignment = textAlignment
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: textColor,
            .paragraphStyle: paragraphStyle
        ]
        
        let attributedString = NSAttributedString(string: text, attributes: attributes)
        textView.attributedText = attributedString
        
        return textView
    }
}

extension UIButton {
    func configureButton(withTitle title: String, font: UIFont, titleColor: UIColor, normalImage: UIImage?, highlightedImage: UIImage?, kern: CGFloat = 0.0) {
        self.setBackgroundImage(normalImage, for: .normal)
        self.setBackgroundImage(highlightedImage, for: .highlighted)
        
        let attributedTitle = NSAttributedString(
            string: title,
            attributes: [
                .font: font,
                .foregroundColor: titleColor,
                .kern: kern
            ]
        )
        
        self.setAttributedTitle(attributedTitle, for: .normal)
        
        self.titleLabel?.lineBreakMode = .byWordWrapping
        self.titleLabel?.textAlignment = .center
    }
}

extension UIButton {
    func saveImageToLocal(image: UIImage, userID: String) {
        if let data = image.jpegData(compressionQuality: 1.0) {
            let fileURL = getDocumentsDirectory().appendingPathComponent("\(userID).png")
            try? data.write(to: fileURL)
        }
    }
    
    func getImageFromLocal(userID: String) -> UIImage? {
        let fileURL = getDocumentsDirectory().appendingPathComponent("\(userID).png")
        do {
            let data = try Data(contentsOf: fileURL)
            return UIImage(data: data)
        } catch {
            print("Error loading image from local storage")
            return nil
        }
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    
}

extension NSAttributedString {
    static func attributedString(from string: String, boldParts: [String], boldFont: UIFont, regularFont: UIFont, boldColor: UIColor, regularColor: UIColor) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: string, attributes: [
            .font: regularFont,
            .foregroundColor: regularColor
        ])
        
        boldParts.forEach { boldPart in
            let range = (string as NSString).range(of: boldPart)
            attributedString.addAttributes([
                .font: boldFont,
                .foregroundColor: boldColor
            ], range: range)
        }
        
        return attributedString
    }
}

