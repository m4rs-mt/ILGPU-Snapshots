; stage: AfterGlobalOpt  opt: O2
; module: NestedCallKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @NestedCallKernel(i32 %p0, %struct.0 %p1, i32 %p2, i32 %p3, i32 %p4) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = getelementptr i32, ptr %0, i32 %p0
  %2 = add i32 %p2, %p3
  %3 = mul i32 %2, %p4
  store i32 %3, ptr %1
  ret void

}

