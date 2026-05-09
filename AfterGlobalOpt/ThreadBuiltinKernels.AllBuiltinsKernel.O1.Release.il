; stage: AfterGlobalOpt  opt: O1
; module: AllBuiltinsKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @AllBuiltinsKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = call i32 @ComputeGlobalIndex()
  %1 = extractvalue %struct.0 %p1, 0
  %2 = getelementptr i32, ptr %1, i32 %p0
  store i32 %0, ptr %2
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
  %9 = select i1 %7, i32 %4, i32 %8
  ret i32 %9

}

