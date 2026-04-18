; stage: AfterGlobalOpt  opt: O2
; module: Index3DKernel  [intptr: i64]

%struct.0 = type { i32, i32, i32 }
%view.i32 = view i32
%struct.1 = type { %view.i32, i64, i8 }

define void @Index3DKernel(%struct.0 %p0, %struct.1 %p1, i32 %p2, i32 %p3) {
entry:
  %0 = extractvalue %struct.1 %p1, 0
  %1 = extractvalue %struct.0 %p0, 0
  %2 = extractvalue %struct.0 %p0, 1
  %3 = mul i32 %2, %p2
  %4 = add i32 %1, %3
  %5 = extractvalue %struct.0 %p0, 2
  %6 = mul i32 %5, %p2
  %7 = mul i32 %6, %p3
  %8 = add i32 %4, %7
  %9 = getelementptr i32, ptr %0, i32 %8
  %10 = extractvalue %struct.0 %p0, 0
  %11 = extractvalue %struct.0 %p0, 1
  %12 = mul i32 %11, 100
  %13 = add i32 %10, %12
  %14 = extractvalue %struct.0 %p0, 2
  %15 = mul i32 %14, 10000
  %16 = add i32 %13, %15
  store i32 %16, ptr %9
  ret void

}

