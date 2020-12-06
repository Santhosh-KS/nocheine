import MetalKit

enum TObjectType {
  case triangle, square
}

struct TColor {
  @Clamping(min: 0.0, max: 1.0) var red: Float = 1.0
  @Clamping(min: 0.0, max: 1.0) var green: Float = 1.0
  @Clamping(min: 0.0, max: 1.0) var blue: Float = 1.0
  @Clamping(min: 0.0, max: 1.0) var alpha: Float = 1.0
  init() {
    red = 1.0
    green = 1.0
    blue = 1.0
    alpha = 1.0
  }
}

enum TColorType {
  case red, green, blue, white, black
}

extension TColor {
  func getColor(color c:TColorType) -> SIMD4<Float> {
    switch c {
      case .red:
        return SIMD4<Float>(self.red, 0, 0, self.alpha)
      case .green:
        return SIMD4<Float>(0, self.green, 0, self.alpha)
      case .blue:
        return SIMD4<Float>(0, 0, self.blue, self.alpha)
      case .black:
        return SIMD4<Float>(0, 0, 0, self.alpha)
      default: // white
        return SIMD4<Float>(1, 1, 1, self.alpha)
    }
  }
}

struct TObjectDescriptor {
  var type:TObjectType = .triangle
  var color:TColor = TColor()
  @Clamping(min: 0.0, max: 1.0) var size: Float = 0.5
  
  init(type t:TObjectType, color c:TColor, size s:Float) {
    type = t
    color = c
    size = s
  }
}

