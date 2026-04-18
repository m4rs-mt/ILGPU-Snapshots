; stage: AfterBackendTransforms  backend: OpenCL  opt: O0
; module: GridDimensionKernel  [intptr: i64]

define void @GridDimensionKernel(i32 %p0, ptr<i64> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4) {
entry:
  %0 = getelementptr i64, ptr %p1, i32 %p0
  %1 = call i32 @ilgpu.grid.dim()
  %2 = sext i32 %1 to i64
  store i64 %2, ptr %0
  ret void

}

