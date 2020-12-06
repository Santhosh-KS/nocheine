import MetalKit

struct TVertex {
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
