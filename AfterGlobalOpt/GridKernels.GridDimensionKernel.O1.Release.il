; stage: AfterGlobalOpt  opt: O1
; module: GridDimensionKernel  [intptr: i64]

%view.i64 = view i64
%struct.0 = type { %view.i64, i64, i8 }

define void @GridDimensionKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = getelementptr i64, ptr %0, i32 %p0
  %2 = call i32 @ilgpu.grid.dim()
  %3 = sext i32 %2 to i64
  store i64 %3, ptr %1
  ret void

}

