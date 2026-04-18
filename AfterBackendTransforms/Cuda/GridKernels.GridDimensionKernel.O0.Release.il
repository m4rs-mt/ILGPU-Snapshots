; stage: AfterBackendTransforms  backend: Cuda  opt: O0
; module: GridDimensionKernel  [intptr: i64]

%struct.0 = type { ptr<i64> addrspace(global), i64 }
%struct.1 = type { ptr<i64> addrspace(global), i64, i64, i8 }

define void @GridDimensionKernel(i32 %p0, %struct.1 %p1) {
entry:
  %0 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %1 = extractvalue %struct.0 %0, 0
  %2 = getelementptr i64, ptr %1, i32 %p0
  %3 = call i32 @ilgpu.grid.dim()
  %4 = sext i32 %3 to i64
  store i64 %4, ptr %2
  ret void

}

