; stage: AfterBackendTransforms  backend: Cuda  opt: O0
; module: LocalOffsetsKernel  [intptr: i64]

%struct.0 = type { ptr<i32>, i64 }
%struct.1 = type { ptr<i32>, i64, i64, i8 }
%struct.2 = type { i32, i32, i32 }

define void @LocalOffsetsKernel(i32 %p0, %struct.1 %p1) {
entry:
  %0 = alloca %struct.2, i32 1
  store %struct.2 null, ptr %0
  %1 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %2 = extractvalue %struct.0 %1, 0
  %3 = getelementptr i32, ptr %2, i32 %p0
  %4 = load i32, ptr %3
  %5 = getelementptr inbounds %struct.2, ptr %0, i32 0, i32 0
  store i32 %4, ptr %5
  %6 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %7 = extractvalue %struct.0 %6, 0
  %8 = getelementptr i32, ptr %7, i32 %p0
  %9 = load i32, ptr %8
  %10 = getelementptr inbounds %struct.2, ptr %0, i32 0, i32 1
  %11 = shl i32 %9, 1
  store i32 %11, ptr %10
  %12 = getelementptr inbounds %struct.2, ptr %0, i32 0, i32 2
  store i32 3, ptr %12
  %13 = bitcast ptr %0 to ptr ; %struct.2 -> i8
  %14 = getelementptr i8, ptr %13, i32 4
  %15 = bitcast ptr %14 to ptr ; i8 -> i32
  %16 = load i32, ptr %15
  %17 = bitcast ptr %0 to ptr ; %struct.2 -> i32
  %18 = getelementptr i32, ptr %17, i32 2
  %19 = load i32, ptr %18
  %20 = getelementptr inbounds %struct.2, ptr %0, i32 0, i32 0
  %21 = getelementptr i32, ptr %20, i32 1
  %22 = load i32, ptr %21
  %23 = getelementptr i32, ptr %20, i32 2
  %24 = load i32, ptr %23
  %25 = getelementptr inbounds %struct.2, ptr %0, i32 0, i32 0
  %26 = getelementptr i32, ptr %25, i32 2
  %27 = load i32, ptr %26
  %28 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %29 = extractvalue %struct.0 %28, 0
  %30 = getelementptr i32, ptr %29, i32 %p0
  %31 = add i32 %16, %19
  %32 = add i32 %31, %22
  %33 = add i32 %32, %24
  %34 = add i32 %33, %27
  store i32 %34, ptr %30
  ret void

}

