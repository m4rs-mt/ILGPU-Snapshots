; stage: AfterGlobalOpt  opt: O1
; module: WarpRadixSortAscendingInt32Kernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @WarpRadixSortAscendingInt32Kernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = getelementptr i32, ptr %0, i32 %p0
  %2 = load i32, ptr %1
  %3 = ; unhandled: WarpRadixSort
  %4 = extractvalue %struct.0 %p1, 0
  %5 = getelementptr i32, ptr %4, i32 %p0
  store i32 %3, ptr %5
  ret void

}

define i32 @ExtractRadixBits(i32 %p0, i32 %p1, i32 %p2) {
entry:
  %0 = xor i32 %p0, -2147483648
  %1 = and i32 %p1, 31
  %2 = ashr i32 %0, %1
  %3 = and i32 %2, %p2
  ret i32 %3

}

