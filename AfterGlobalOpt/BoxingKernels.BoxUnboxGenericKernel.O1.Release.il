; stage: AfterGlobalOpt  opt: O1
; module: BoxUnboxGenericKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @BoxUnboxGenericKernel(i32 %p0, %struct.0 %p1, i32 %p2) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = getelementptr i32, ptr %0, i32 %p0
  %2 = add i32 %p2, 1
  %3 = mul i32 %p2, 3
  %4 = sub i32 %2, %3
  store i32 %4, ptr %1
  ret void

}

