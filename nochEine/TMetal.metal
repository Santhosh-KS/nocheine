#include <metal_stdlib>
using namespace metal;


[[host_name("vertexFunctionInUse")]]
vertex float4 vertex_function(const device float3 *verticies [[buffer(0)]],
                              uint vertexId [[vertex_id]])
{
  return float4(verticies[vertexId], 1);
}

[[host_name("fragmentFunctionInUse")]]
fragment float4 fragment_function()
{
  return float4(1);
}



// setp-1 V&F Functions
[[host_name("RGBVertexScreenUse")]]
vertex float4 basic_vertex_function()
{
  return float4(1);
}

[[host_name("RGBfragmentScreenUse")]]
fragment float4 basic_fragment_function()
{
  return float4(1);
}
