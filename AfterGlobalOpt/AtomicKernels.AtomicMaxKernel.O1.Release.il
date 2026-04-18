; stage: AfterGlobalOpt  opt: O1
; module: AtomicMaxKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @AtomicMaxKernel(i32 %p0, %struct.0 %p1, i32 %p2) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = getelementptr i32, ptr %0, i32 0
  %2 = atomicrmw max ptr %1, i32 %p2 seq_cst
  ret void

}

