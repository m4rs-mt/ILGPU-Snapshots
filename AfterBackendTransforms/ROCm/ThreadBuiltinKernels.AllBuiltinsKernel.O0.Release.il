; stage: AfterBackendTransforms  backend: ROCm  opt: O0
; module: AllBuiltinsKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64 }
%struct.1 = type { ptr<i32> addrspace(global), i64, i64, i8 }

define void @AllBuiltinsKernel(i32 %p0, %struct.1 %p1) {
entry:
  %0 = call i32 @ComputeGlobalIndex()
  %1 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %2 = extractvalue %struct.0 %1, 0
  %3 = getelementptr i32, ptr %2, i32 %p0
  store i32 %0, ptr %3
  ret void

}

define i32 @ComputeGlobalIndex() {
entry:
  %0 = call i32 @ilgpu.grid.index()
  %1 = call i32 @ilgpu.group.dim()
  %2 = mul i32 %0, %1
  %3 = call i32 @ilgpu.group.index()
  %4 = add i32 %2, %3
  %5 = call i32 @ilgpu.grid.dim()
  %6 = mul i32 %5, %1
  %7 = icmp slt i32 %4, %6
  %8 = sub i32 %6, 1
  br i1 %7, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %9 = phi i32 [ %8, %bb1 ], [ %4, %bb2 ]
  ret i32 %9

}

