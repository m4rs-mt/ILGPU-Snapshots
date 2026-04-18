; stage: AfterGlobalOpt  opt: O1
; module: BarrierOrderingKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @BarrierOrderingKernel(i32 %p0, %struct.0 %p1, %struct.0 %p2) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = getelementptr i32, ptr %0, i32 %p0
  %2 = shl i32 %p0, 1
  store i32 %2, ptr %1
  call void @ilgpu.barrier.group()
  %3 = extractvalue %struct.0 %p1, 0
  %4 = getelementptr i32, ptr %3, i32 %p0
  %5 = load i32, ptr %4
  %6 = extractvalue %struct.0 %p2, 0
  %7 = getelementptr i32, ptr %6, i32 %p0
  %8 = add i32 %5, 1
  store i32 %8, ptr %7
  ret void

}

