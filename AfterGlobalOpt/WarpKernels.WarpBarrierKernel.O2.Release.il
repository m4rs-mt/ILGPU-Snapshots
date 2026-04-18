; stage: AfterGlobalOpt  opt: O2
; module: WarpBarrierKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @WarpBarrierKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = getelementptr i32, ptr %0, i32 %p0
  store i32 %p0, ptr %1
  call void @ilgpu.barrier.warp()
  %2 = extractvalue %struct.0 %p1, 0
  %3 = getelementptr i32, ptr %2, i32 %p0
  %4 = load i32, ptr %3
  %5 = extractvalue %struct.0 %p1, 0
  %6 = getelementptr i32, ptr %5, i32 %p0
  %7 = add i32 %4, 1
  store i32 %7, ptr %6
  ret void

}

