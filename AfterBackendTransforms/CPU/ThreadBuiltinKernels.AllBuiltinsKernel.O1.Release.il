; stage: AfterBackendTransforms  backend: CPU  opt: O1
; module: AllBuiltinsKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @AllBuiltinsKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = call i32 @ilgpu.group.index()
  %1 = call i32 @ilgpu.grid.index()
  %2 = call i32 @ilgpu.group.dim()
  %3 = call i32 @ilgpu.grid.dim()
  %4 = call i32 @ComputeGlobalIndex(i32 %0, i32 %1, i32 %2, i32 %3)
  %5 = extractvalue %struct.0 %p1, 0
  %6 = getelementptr i32, ptr %5, i32 %p0
  store i32 %4, ptr %6
  ret void

}

define i32 @ComputeGlobalIndex(i32 %p0, i32 %p1, i32 %p2, i32 %p3) {
entry:
  %0 = mul i32 %p1, %p2
  %1 = add i32 %0, %p0
  %2 = mul i32 %p3, %p2
  %3 = icmp slt i32 %1, %2
  %4 = sub i32 %2, 1
  %5 = select i1 %3, i32 %1, i32 %4
  ret i32 %5

}

