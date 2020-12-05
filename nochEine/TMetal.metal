#include <metal_stdlib>
using namespace metal;


[[host_name("vertexFunctionInUse")]]
vertex float4 basic_vertex_function()
{
  return float4(1);
}

[[host_name("fragmentFunctionInUse")]]
fragment float4 basic_fragment_function()
{
  return float4(1);
}
