// MARK: - color from hex color code
extension UIColor {
    
    convenience init(hexCode: String) {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 1
        
        var hexColor: String
        if hexCode.hasPrefix("#") {
            let start = hexCode.index(hexCode.startIndex, offsetBy: 1)
            hexColor = hexCode.substring(from: start)
        } else {
            hexColor = hexCode
        }
        
        if hexColor.count == 2 {
            hexColor = String(format: "%@%@%@", hexColor, hexColor, hexColor)
        }
        
        if hexColor.count == 8 {
            let scanner = Scanner(string: hexColor)
            var hexNumber: UInt64 = 0
            
            if scanner.scanHexInt64(&hexNumber) {
                r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                a = CGFloat(hexNumber & 0x000000ff) / 255
            }
        } else if hexColor.count == 6 {
            let scanner = Scanner(string: hexColor)
            var hexNumber: UInt64 = 0
            
            if scanner.scanHexInt64(&hexNumber) {
                r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                b = CGFloat(hexNumber & 0x0000ff) / 255
            }
        }
        
        self.init(red: r, green: g, blue: b, alpha: a)
    }
    
}
