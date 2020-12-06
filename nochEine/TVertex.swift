import MetalKit

struct TVertex  {
  var position:SIMD3<Float>
}

struct TVertexWithColor {
  var position:SIMD3<Float>
  var color:SIMD4<Float>
  
  init(position pos:SIMD3<Float>,
     color col:SIMD4<Float> = SIMD4<Float>(repeating: 0.0)) {
     self.position = pos
     self.color = col
  }
}

/* /// Try this option later
struct TPosition {
  @Clamping(min: 0.0, max: 1.0) var x: Float = 0.0
  @Clamping(min: 0.0, max: 1.0) var y: Float = 0.0
  @Clamping(min: 0.0, max: 1.0) var z: Float = 0.0
  init(x:Float=0.0, y:Float=0.0, z:Float=0.0) {
    self.x = x
    self.y = y
    self.z = z
  }
}
*/
