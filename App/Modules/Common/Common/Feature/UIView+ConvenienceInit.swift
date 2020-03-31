//
//  UIView+ConvenienceInit.swift
//  Common
//
//  Created by Topband on 2020/3/31.
//  Copyright © 2020 深圳拓邦股份有限公司. All rights reserved.
//

import Foundation
import UIKit

// ******************常用控件初始化******************

extension UIView {
    
   public class func t_viewWith(_ bgColor:UIColor?,_ superView:UIView?)->UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = bgColor
        if superView != nil {
            superView?.addSubview(view)
        }
        return view
    }
    
    // Mark -- Additions
    public func t_cornerRadius(_ radius:CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    public func t_addBorder(_ borderWidth:CGFloat = 1,_ borderColor:UIColor) {
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
    
    /** 完整约束之后计算View高度 */
    public func calculateSize() -> CGSize {
        self.layoutIfNeeded()
        self.setNeedsLayout()
       return self.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
    }
}

extension UILabel {
    
   public class func t_labelWith(_ text:String?,_ textColor:UIColor?,_ textFont:UIFont?,_ textAlignment:NSTextAlignment?,_ numberOfLines:Int?,_ superView:UIView?)->UILabel {
        let label:UILabel = UILabel(frame: .zero)
        label.text = text
        label.textColor = textColor
        label.font = textFont
        label.textAlignment = textAlignment ?? .left
        label.numberOfLines = numberOfLines ?? 1
        if superView != nil {
            superView?.addSubview(label)
        }
        return label
    }
}

extension UIButton {
    
    public class func t_buttonWith(_ title:String?,_ titleColor:UIColor?,_ titleFont:UIFont?,_ imageName:String?,_ highlightImageName:String?,_ bgImageName:String?,_ bgHighlightImageName:String?,_ bgColor:UIColor?,_ bgHighlightColor:UIColor?,_ bundle:Bundle?,_ superView:UIView?) -> UIButton {
        
        let button:UIButton = UIButton(type: .custom)
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = titleFont
        
        if imageName?.count ?? 0 > 0 {
            button.setImage(UIImage(named: imageName ?? "", in: bundle, compatibleWith: nil), for: .normal)
        }
        
        if highlightImageName?.count ?? 0 > 0 {
            button.setImage(UIImage(named: highlightImageName ?? "", in: bundle, compatibleWith: nil), for: .highlighted)
        }
        
        if bgImageName?.count ?? 0 > 0 {
            button.setBackgroundImage(UIImage(named: bgImageName ?? "", in: bundle, compatibleWith: nil), for: .normal)
        }
        
        if bgHighlightImageName?.count ?? 0 > 0 {
            button.setBackgroundImage(UIImage(named: bgHighlightImageName ?? "", in: bundle, compatibleWith: nil), for: .highlighted)
        }
        
        if bgColor != nil {
            button.setBackgroundImage(getImageWithColor(color: bgColor!), for: .normal)
        }
        
        if bgHighlightColor != nil {
            button.setBackgroundImage(getImageWithColor(color: bgHighlightColor!), for: .highlighted)
        }
        
        if superView != nil {
            superView?.addSubview(button)
        }
        return button
    }
}

extension UIImageView {
    
    public class func t_imageViewWith(_ imageName:String?,_ contentMode:UIView.ContentMode?,_ bundle:Bundle?,_ superView:UIView?)->UIImageView {
                
         let imageView:UIImageView = UIImageView(image: UIImage(named: imageName ?? "", in: bundle, compatibleWith: nil))
        imageView.contentMode = contentMode ?? .scaleToFill
        if superView != nil {
            superView?.addSubview(imageView)
        }
        return imageView
    }
}

extension UITextField {
    
    public class func t_textFieldWith(_ textColor:UIColor?,_ textFont:UIFont?,_ borderStyle:UITextField.BorderStyle?,_ isSecureText:Bool?,_ placeholder:String?,_ attrbutedPlaceholder:NSAttributedString?,_ superView:UIView?)->UITextField {
        let textField:UITextField = UITextField(frame: .zero)
        textField.isSecureTextEntry = isSecureText ?? false
        textField.textColor = textColor
        textField.font = textFont
        textField.borderStyle = borderStyle ?? .none
        textField.placeholder = placeholder
        if attrbutedPlaceholder != nil {
            textField.attributedPlaceholder = attrbutedPlaceholder
        }
        if superView != nil {
            superView?.addSubview(textField)
        }
        return textField
    }
}





