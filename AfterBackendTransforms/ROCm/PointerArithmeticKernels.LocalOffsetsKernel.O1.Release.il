; stage: AfterBackendTransforms  backend: ROCm  opt: O1
; module: LocalOffsetsKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64, i64, i8 }
%struct.1 = type { i32, i32, i32 }

define void @LocalOffsetsKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = alloca %struct.1, i32 1
  store %struct.1 null, ptr %0
  %1 = extractvalue %struct.0 %p1, 0
  %2 = getelementptr i32, ptr %1, i32 %p0
  %3 = load i32, ptr %2
  %4 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 0
  store i32 %3, ptr %4
  %5 = extractvalue %struct.0 %p1, 0
  %6 = getelementptr i32, ptr %5, i32 %p0
  %7 = load i32, ptr %6
  %8 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 1
  %9 = shl i32 %7, 1
  store i32 %9, ptr %8
  %10 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 2
  store i32 3, ptr %10
  %11 = bitcast ptr %0 to ptr ; %struct.1 -> i8
  %12 = getelementptr i8, ptr %11, i32 4
  %13 = bitcast ptr %12 to ptr ; i8 -> i32
  %14 = load i32, ptr %13
  %15 = bitcast ptr %0 to ptr ; %struct.1 -> i32
  %16 = getelementptr i32, ptr %15, i32 2
  %17 = load i32, ptr %16
  %18 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 0
  %19 = getelementptr i32, ptr %18, i32 1
  %20 = load i32, ptr %19
  %21 = getelementptr i32, ptr %18, i32 2
  %22 = load i32, ptr %21
  %23 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 0
  %24 = getelementptr i32, ptr %23, i32 2
  %25 = load i32, ptr %24
  %26 = extractvalue %struct.0 %p1, 0
  %27 = getelementptr i32, ptr %26, i32 %p0
  %28 = add i32 %14, %17
  %29 = add i32 %28, %20
  %30 = add i32 %29, %22
  %31 = add i32 %30, %25
  store i32 %31, ptr %27
  ret void

}

