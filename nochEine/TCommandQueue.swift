import MetalKit

struct TCommandQueue {
  
  public var commandQueue:MTLCommandQueue! = nil
  public var count:Int = 0
  
  init(device d:MTLDevice,
       withLimit maxBuffer:Int=100) {
    setup(device: d, withLimit: maxBuffer)
  }
  mutating func setup(device d:MTLDevice,
       withLimit mb:Int) {
    
    guard let q = d.makeCommandQueue() else {
      fatalError("Failed to create a CommandQueue!")
    }
    commandQueue = q
    count = mb
  }
}
