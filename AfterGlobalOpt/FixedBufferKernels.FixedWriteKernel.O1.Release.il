; stage: AfterGlobalOpt  opt: O1
; module: FixedWriteKernel  [intptr: i64]

%struct.0 = type { i32 }
%view.struct = view %struct.0
%struct.1 = type { %view.struct, i64, i8 }

define void @FixedWriteKernel(i32 %p0, %struct.1 %p1, i32 %p2) {
entry:
  %0 = alloca %struct.0, i32 1
  store %struct.0 null, ptr %0
  %1 = getelementptr inbounds %struct.0, ptr %0, i32 0, i32 0
  store i32 %p2, ptr %1
  %2 = getelementptr inbounds %struct.0, ptr %0, i32 0, i32 0
  %3 = getelementptr i32, ptr %2, i32 1
  %4 = shl i32 %p2, 1
  store i32 %4, ptr %3
  %5 = getelementptr inbounds %struct.0, ptr %0, i32 0, i32 0
  %6 = getelementptr i32, ptr %5, i32 2
  %7 = mul i32 %p2, 3
  store i32 %7, ptr %6
  %8 = getelementptr inbounds %struct.0, ptr %0, i32 0, i32 0
  %9 = getelementptr i32, ptr %8, i32 3
  %10 = shl i32 %p2, 2
  store i32 %10, ptr %9
  %11 = load %struct.0, ptr %0
  %12 = extractvalue %struct.1 %p1, 0
  %13 = getelementptr %struct.0, ptr %12, i32 %p0
  store %struct.0 %11, ptr %13
  ret void

}

