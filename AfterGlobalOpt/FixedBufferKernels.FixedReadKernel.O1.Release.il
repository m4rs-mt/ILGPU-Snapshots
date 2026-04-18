; stage: AfterGlobalOpt  opt: O1
; module: FixedReadKernel  [intptr: i64]

%struct.0 = type { i32 }
%view.struct = view %struct.0
%struct.1 = type { %view.struct, i64, i8 }
%view.i32 = view i32
%struct.2 = type { %view.i32, i64, i8 }

define void @FixedReadKernel(i32 %p0, %struct.1 %p1, %struct.2 %p2) {
entry:
  %0 = alloca %struct.0, i32 1
  store %struct.0 null, ptr %0
  %1 = extractvalue %struct.1 %p1, 0
  %2 = getelementptr %struct.0, ptr %1, i32 %p0
  %3 = load %struct.0, ptr %2
  store %struct.0 %3, ptr %0
  %4 = getelementptr inbounds %struct.0, ptr %0, i32 0, i32 0
  %5 = load i32, ptr %4
  %6 = getelementptr inbounds %struct.0, ptr %0, i32 0, i32 0
  %7 = getelementptr i32, ptr %6, i32 1
  %8 = load i32, ptr %7
  %9 = getelementptr inbounds %struct.0, ptr %0, i32 0, i32 0
  %10 = getelementptr i32, ptr %9, i32 2
  %11 = load i32, ptr %10
  %12 = getelementptr inbounds %struct.0, ptr %0, i32 0, i32 0
  %13 = getelementptr i32, ptr %12, i32 3
  %14 = load i32, ptr %13
  %15 = extractvalue %struct.2 %p2, 0
  %16 = getelementptr i32, ptr %15, i32 %p0
  %17 = add i32 %5, %8
  %18 = add i32 %17, %11
  %19 = add i32 %18, %14
  store i32 %19, ptr %16
  ret void

}

