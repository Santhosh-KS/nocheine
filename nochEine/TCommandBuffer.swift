import MetalKit

struct TCommandBuffer {
  
  var commandBuffer:MTLCommandBuffer! = nil
  var offset:UInt8 = 0
  var index:UInt8 = 0
  
  init(commandQueue q:TCommandQueue,
       offset o:UInt8 = 0,
       index i:UInt8 = 0) {
    setup(commandQueue: q, offset: o, index: i)
  }
  
  mutating func setup(commandQueue q:TCommandQueue,
       offset o:UInt8 = 0,
       index i:UInt8 = 0) {
    guard let cb = q.commandQueue.makeCommandBuffer() else {
      fatalError("Cannot create CommandBuffer")
    }
    commandBuffer = cb
    offset = o
    index = i
  }

}
