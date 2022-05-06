//
//  ZJKInitializerSwift.swift
//  JYBInitializerSwift
//
//  Created by zhongjun on 2022/5/6.
//
 
import UIKit

/**
 @discardableResult 不写在全局调用会出现警告⚠️
 */

extension UILabel {
    /** 基本 **/
    @discardableResult
    func zjk_text() -> (_ text: String?) -> UILabel {
        return { [self] text in
            self.text = text
            return self
        }
    }
    @discardableResult
    func zjk_font() -> (_ font:UIFont?) -> UILabel {
        return {[self] font in
            self.font = font
            return self
        }
    }
    @discardableResult
    func zjk_textColor() -> (_ textColor:UIColor?) -> UILabel {
        return {[self] textColor in
            self.textColor = textColor
            return self
        }
    }
    @discardableResult
    func zjk_textBgColor() -> (_ textBgColor:UIColor?) -> UILabel {
        return {[self] textBgColor in
            self.backgroundColor = textBgColor
            return self
        }
    }
    @discardableResult
    func zjk_alignment() -> (_ alignment:NSTextAlignment?) -> UILabel{
        return {[self] alignment in
            self.textAlignment = alignment ?? .left
            return self
        }
    }
    @discardableResult
    func zjk_numberOfLine() -> (_ numberOfLine:Int?) -> UILabel{
        return {[self] numberOfLine in
            self.numberOfLines = numberOfLine ?? 1
            return self
        }
    }
    ///  label间距
    @discardableResult
    func zjk_lineSpacing() -> (_ lineSpacingSize:CGFloat?) ->UILabel{
        return{[self] lineSpacingSzie  in
            let arrib:NSMutableAttributedString = NSMutableAttributedString(string: self.text ?? "")
            let par:NSMutableParagraphStyle = NSMutableParagraphStyle()
            par.lineSpacing = lineSpacingSzie ?? 0.0
            arrib.addAttribute(NSAttributedString.Key.paragraphStyle, value: par, range: NSRange(location: 0,length: self.text!.count))
            self.attributedText = arrib
            self.sizeToFit()
            return self
        }
    }
}


extension UIButton {
    @discardableResult
    class func zjk_init() -> () -> UIButton {
        return {
            return UIButton(type: .system)
        }
    }
    @discardableResult
    class func zjk_initType() -> (_ type: UIButton.ButtonType) -> UIButton {
        return { type in
            return UIButton(type: type)
        }
    }
    @discardableResult
    func zjk_frame() -> (_ frame: CGRect) -> UIButton {
        return { [self] frame in
            self.frame = frame
            return self
        }
    }
    @discardableResult
    func zjk_font() -> (UIFont?) -> UIButton {
        return { [self] font in
            if let font = font {
                titleLabel?.font = font
            }
            return self
        }
    }
    ///  设置的是UIView的背景色，无点击效果
    @discardableResult
    func zjk_bgColor() -> (_ bgColor: UIColor?) -> UIButton {
        return { [self] bgColor in
            if let bgColor = bgColor {
                backgroundColor = bgColor
            }
            return self
        }
    }

    ///  根据颜色生成image, 设置UIButton的backgroundImage, 有点击背景变暗效果
    @discardableResult
    func zjk_bgImgColor() -> (_ bgImgColor: UIColor?) -> UIButton {
        return { [self] bgImgColor in

            let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
            UIGraphicsBeginImageContext(rect.size)
            let context = UIGraphicsGetCurrentContext()
            if let cg = bgImgColor?.cgColor {
                context?.setFillColor(cg)
            }
            context?.fill(rect)
            let theImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()

            return zjk_bgImg()(theImage!)
        }
    }
    @discardableResult
    func zjk_cornerRadius() -> (_ cornerRadius: CGFloat) -> UIButton {
        return { [self] cornerRadius in
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true
            return self
        }
    }
    ///  state default normal
    @discardableResult
    func zjk_title() -> (_ title: String?) -> UIButton {
        return { [self] title in
            return zjk_title_state()(title, UIControl.State.normal)
        }
    }
    @discardableResult
    func zjk_titleColor() -> (_ color: UIColor?) -> UIButton {
        return { [self] color in
            return zjk_titleColor_state()(color, UIControl.State.normal)
        }
    }
    @discardableResult
    func zjk_img() -> (_ image: UIImage?) -> UIButton {
        return { [self] img in
            return zjk_img_state()(img, UIControl.State.normal)
        }
    }
    @discardableResult
    func zjk_bgImg() -> (_ backgroudImg: UIImage?) -> UIButton {
        return { [self] img in
            return zjk_bgImg_state()(img, UIControl.State.normal)
        }
    }
    @discardableResult
    func zjk_title_state() -> (_ title: String?, _ state: UIControl.State) -> UIButton {
        return { [self] title, state in
            setTitle(title, for: state)
            return self
        }
    }
    @discardableResult
    func zjk_titleColor_state() -> (_ color: UIColor?, _ state: UIControl.State) -> UIButton {
        return { [self] color, state in
            if let color = color {
                setTitleColor(color, for: state)
            }
            return self
        }
    }
    @discardableResult
    func zjk_img_state() -> (_ img: UIImage?, _ state: UIControl.State) -> UIButton {
        return { [self] img, state in
            if let img = img {
                setImage(img, for: state)
            }
            return self
        }
    }
    @discardableResult
    func zjk_bgImg_state() -> (_ backgroudImg: UIImage?, _ state: UIControl.State) -> UIButton {
        return { [self] img, state in
            if let img = img {
                setBackgroundImage(img, for: state)
            }
            return self
        }
    }

}


extension UITextField {
    @discardableResult
    class func zjk_init() -> () -> UITextField {
        return {
            return UITextField()
        }
    }
    @discardableResult
    class func zjk_initFrame() -> (CGRect) -> UITextField {
        return { frame in
            return UITextField(frame: frame)
        }
    }
    @discardableResult
    func zjk_frame() -> (CGRect) -> UITextField {
        return { [self] frame in
            self.frame = frame
            return self
        }
    }
    @discardableResult
    func zjk_text() -> (String?) -> UITextField {
        return { [self] text in
            self.text = text
            return self
        }
    }
    @discardableResult
    func zjk_placeholder() -> (String?) -> UITextField {
        return { [self] placeholder in
            self.placeholder = placeholder
            return self
        }
    }
    @discardableResult
    func zjk_textColor() -> (UIColor?) -> UITextField {
        return { [self] textColor in
            if let textColor = textColor {
                self.textColor = textColor
            }
            return self
        }
    }
    @discardableResult
    func zjk_fontSize() -> (CGFloat) -> UITextField {
        return { [self] fontSize in
            let font = UIFont.systemFont(ofSize: fontSize)
            return zjk_font()(font)
        }
    }
    @discardableResult
    func zjk_boldFontSize() -> (CGFloat) -> UITextField {
        return { [self] boldFontSize in
            let font = UIFont.boldSystemFont(ofSize: boldFontSize)
            return zjk_font()(font)
        }
    }
    @discardableResult
    func zjk_font() -> (UIFont?) -> UITextField {
        return { [self] font in
            if let font = font {
                self.font = font
            }
            return self
        }
    }
    @discardableResult
    func zjk_textAlignment() -> (NSTextAlignment) -> UITextField {
        return { [self] textAlignment in
            self.textAlignment = textAlignment
            return self
        }
    }
    @discardableResult
    func zjk_borderStyle() -> (UITextField.BorderStyle) -> UITextField {
        return { [self] style in
            borderStyle = style
            return self
        }
    }
}

extension UIImage{
    @discardableResult
    class func zjk_imgName() -> (_ imgName: String?) -> UIImage {
        return { [self] img_name in
            return self.init(named: img_name ?? "")!
        }
    }
    @discardableResult
    class func zjk_fileImgName() -> (_ imgName: String?) -> UIImage {
        return { img_name in
            let imgPath = URL(fileURLWithPath: Bundle.main.resourcePath ?? "").appendingPathComponent(img_name ?? "").path
            let img = UIImage(contentsOfFile: imgPath)
            return img!
        }
    }
    @discardableResult
    class func zjk_imgFillColor() -> (_ imgFillColor: UIColor?, _ imgSize: CGSize) -> UIImage {
        return { img_color, imgSize in
            let rect = CGRect(x: 0.0, y: 0.0, width: imgSize.width, height: imgSize.height)
            UIGraphicsBeginImageContext(rect.size)
            let context = UIGraphicsGetCurrentContext()
            if let cg = img_color?.cgColor {
                context?.setFillColor(cg)
            }
            context?.fill(rect)
            let theImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return theImage!
        }
    }
    @discardableResult
    func zjk_cornerRadius() -> (_ cornerRadius: CGFloat) -> UIImage {
        return { [self] cornerRadius in
            let targetRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
            UIGraphicsBeginImageContextWithOptions(targetRect.size, false, UIScreen.main.scale)
            let path = UIBezierPath(
                roundedRect: targetRect,
                byRoundingCorners: .allCorners,
                cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
            UIGraphicsGetCurrentContext()?.addPath(path.cgPath)
            UIGraphicsGetCurrentContext()?.clip()
            draw(in: targetRect)

            let finalImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return finalImage!
        }
    }
}

