; stage: AfterBackendTransforms  backend: Metal  opt: O0
; module: AllBuiltinsKernel  [intptr: i64]

define void @AllBuiltinsKernel(i32 %p0, ptr<i32> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4) {
entry:
  %0 = call i32 @ilgpu.group.index()
  %1 = call i32 @ilgpu.grid.index()
  %2 = call i32 @ilgpu.group.dim()
  %3 = call i32 @ilgpu.grid.dim()
  %4 = call i32 @ComputeGlobalIndex(i32 %0, i32 %1, i32 %2, i32 %3)
  %5 = getelementptr i32, ptr %p1, i32 %p0
  store i32 %4, ptr %5
  ret void

}

define i32 @ComputeGlobalIndex(i32 %p0, i32 %p1, i32 %p2, i32 %p3) {
entry:
  %0 = mul i32 %p1, %p2
  %1 = add i32 %0, %p0
  %2 = mul i32 %p3, %p2
  %3 = icmp slt i32 %1, %2
  %4 = sub i32 %2, 1
  br i1 %3, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %5 = phi i32 [ %4, %bb1 ], [ %1, %bb2 ]
  ret i32 %5

}

