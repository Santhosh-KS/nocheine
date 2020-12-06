import MetalKit

protocol TVertexable {
  var position:SIMD3<Float> {get}
}

struct TVertex : TVertexable {
  var position:SIMD3<Float>
}

struct TVertexWithColor : TVertexable {
  var position:SIMD3<Float>
  var color:SIMD4<Float>
   init(position pos:SIMD3<Float>,
   color col:SIMD4<Float> = SIMD4<Float>(repeating: 0.0)) {
   self.position = pos
   self.color = col
   }
}
