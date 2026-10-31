; stage: AfterBackendTransforms  backend: Metal  opt: O2
; module: LocalOffsetsKernel  [intptr: i64]

%struct.0 = type { i32, i32, i32 }

define void @LocalOffsetsKernel(i32 %p0, ptr<i32> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4) {
entry:
  %0 = alloca %struct.0, i32 1
  store %struct.0 null, ptr %0
  %1 = getelementptr i32, ptr %p1, i32 %p0
  %2 = load i32, ptr %1
  %3 = getelementptr inbounds %struct.0, ptr %0, i32 0, i32 0
  store i32 %2, ptr %3
  %4 = getelementptr i32, ptr %p1, i32 %p0
  %5 = load i32, ptr %4
  %6 = getelementptr inbounds %struct.0, ptr %0, i32 0, i32 1
  %7 = shl i32 %5, 1
  store i32 %7, ptr %6
  %8 = getelementptr inbounds %struct.0, ptr %0, i32 0, i32 2
  store i32 3, ptr %8
  %9 = bitcast ptr %0 to ptr ; %struct.0 -> i8
  %10 = getelementptr i8, ptr %9, i32 4
  %11 = bitcast ptr %10 to ptr ; i8 -> i32
  %12 = load i32, ptr %11
  %13 = bitcast ptr %0 to ptr ; %struct.0 -> i32
  %14 = getelementptr i32, ptr %13, i32 2
  %15 = load i32, ptr %14
  %16 = getelementptr inbounds %struct.0, ptr %0, i32 0, i32 0
  %17 = getelementptr i32, ptr %16, i32 1
  %18 = load i32, ptr %17
  %19 = getelementptr i32, ptr %16, i32 2
  %20 = load i32, ptr %19
  %21 = getelementptr inbounds %struct.0, ptr %0, i32 0, i32 0
  %22 = getelementptr i32, ptr %21, i32 2
  %23 = load i32, ptr %22
  %24 = getelementptr i32, ptr %p1, i32 %p0
  %25 = add i32 %12, %15
  %26 = add i32 %25, %18
  %27 = add i32 %26, %20
  %28 = add i32 %27, %23
  store i32 %28, ptr %24
  ret void

}

