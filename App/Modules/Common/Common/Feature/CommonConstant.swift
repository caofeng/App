//
//  CommonConstant.swift
//  Common
//
//  Created by Topband on 2020/3/31.
//  Copyright © 2020 深圳拓邦股份有限公司. All rights reserved.
//

import Foundation
import UIKit

public let TBNetworkError = "网络异常"

public func TBLog<T>(_ msg : T, file : String = #file, lineNumber : Int = #line) {
    #if DEBUG
    let fileName = (file as NSString).lastPathComponent
    print("[\(fileName): line: \(lineNumber)] \(msg)")
    #endif
}

public let kcurrentScale = UIScreen.main.scale
/** 系统版本判断 */
public let kLineHeight = Int(kcurrentScale) == 3 ? 0.33:0.5
/** 获取屏幕宽高 */
public let kScreenWidth = UIScreen.main.bounds.size.width
public let kScreenHeight = UIScreen.main.bounds.size.height

public let iPhone5 =         __CGSizeEqualToSize(CGSize(width:kScreenWidth*kcurrentScale,height:kScreenHeight*kcurrentScale), CGSize(width: 640, height: 1136))
public let IOS_11_OR_ABOVE:Bool = Int(UIDevice.current.systemVersion.components(separatedBy: ".")[0])! >= 11
public let IOS_12_OR_ABOVE:Bool = Int(UIDevice.current.systemVersion.components(separatedBy: ".")[0])! >= 12
public let IOS_13_OR_ABOVE:Bool = Int(UIDevice.current.systemVersion.components(separatedBy: ".")[0])! >= 13

public func judgeIPhoneX () ->Bool {
    if let window:UIWindow = UIApplication.shared.delegate?.window ?? nil {
        return (window.safeAreaInsets.bottom > 0)
//        if #available(iOS 11.0, *) {
//            return (window.safeAreaInsets.bottom > 0)
//        } else {
//            return false
//        }
    }
    return false
}

public let iPhone_X_S = judgeIPhoneX()
public let kStatusBarHeight:CGFloat = iPhone_X_S ? 44.0:20.0
public let kNavBarHeight:CGFloat = 44.0
public let kStatusAndNavBarHeight:CGFloat = (kStatusBarHeight + kNavBarHeight)
public let kTabbarHeight:CGFloat = iPhone_X_S ? 83:49
public let kBottomMargin:CGFloat = iPhone_X_S ? 34:0

/** PingFangSC-Regular字体 */
public func regularFont(_ size:CGFloat) -> UIFont {
    let thin:UIFont = UIFont.init(name: "PingFangSC-Regular", size: size) ?? UIFont.systemFont(ofSize: size)
    return thin
}
/** PingFangSC-Bold字体 */
public func boldFont(_ size:CGFloat) -> UIFont {
    
    let thin:UIFont = UIFont.init(name: "PingFangSC-Semibold", size: size) ?? UIFont.systemFont(ofSize: size)
    return thin
}
/** PingFangSC-Medium字体 */
public func mediumFont(_ size:CGFloat) -> UIFont {
    let thin:UIFont = UIFont.init(name: "PingFangSC-Medium", size: size) ?? UIFont.systemFont(ofSize: size)
    return thin
}
/** PingFangSC-Light 字体 */
public func lightFont(_ size:CGFloat) -> UIFont {
    let medium:UIFont = UIFont.init(name: "PingFangSC-Light", size: size) ?? UIFont.systemFont(ofSize: size)
    return medium
}

//---------------颜色---------------
public func rgbh(_ r:CGFloat,_ g:CGFloat,_ b:CGFloat,_ alpha:CGFloat) -> UIColor {
    return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: alpha)
}
public func rgb(_ r:CGFloat,_ g:CGFloat,_ b:CGFloat) -> UIColor {
    return rgbh(r, g, b, 1.0)
}

public let Text_Color_51 = rgb(51, 51, 51)
public let Text_Color_76_136_255 = rgb(76, 136, 255)

public func getImageWithColor(color:UIColor)->UIImage{
    let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
    UIGraphicsBeginImageContext(rect.size)
    let context = UIGraphicsGetCurrentContext()
    context!.setFillColor(color.cgColor)
    context!.fill(rect)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image!
}
