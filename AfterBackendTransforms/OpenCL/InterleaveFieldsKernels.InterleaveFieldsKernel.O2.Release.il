; stage: AfterBackendTransforms  backend: OpenCL  opt: O2
; module: InterleaveFieldsKernel  [intptr: i64]

%struct.0 = type { i32, i32, i32, i32 }
%struct.1 = type { i32, i32, i32, i32, i32, i32, i32, i32 }

define void @InterleaveFieldsKernel(i32 %p0, ptr<%struct.1> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4) {
entry:
  %0 = getelementptr %struct.1, ptr %p1, i32 %p0
  %1 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 0
  %2 = bitcast ptr %1 to ptr ; %struct.0 -> i32
  store i32 %p0, ptr %2
  %3 = getelementptr %struct.1, ptr %p1, i32 %p0
  %4 = getelementptr inbounds %struct.1, ptr %3, i32 0, i32 0
  %5 = bitcast ptr %4 to ptr ; %struct.0 -> i32
  %6 = getelementptr i32, ptr %5, i32 1
  %7 = add i32 %p0, 1
  store i32 %7, ptr %6
  %8 = getelementptr %struct.1, ptr %p1, i32 %p0
  %9 = getelementptr inbounds %struct.1, ptr %8, i32 0, i32 0
  %10 = bitcast ptr %9 to ptr ; %struct.0 -> i32
  %11 = getelementptr i32, ptr %10, i32 2
  %12 = add i32 %p0, 2
  store i32 %12, ptr %11
  %13 = getelementptr %struct.1, ptr %p1, i32 %p0
  %14 = getelementptr inbounds %struct.1, ptr %13, i32 0, i32 0
  %15 = bitcast ptr %14 to ptr ; %struct.0 -> i32
  %16 = getelementptr i32, ptr %15, i32 3
  %17 = add i32 %p0, 3
  store i32 %17, ptr %16
  %18 = getelementptr %struct.1, ptr %p1, i32 %p0
  %19 = getelementptr inbounds %struct.1, ptr %18, i32 0, i32 4
  %20 = bitcast ptr %19 to ptr ; %struct.0 -> i32
  %21 = add i32 %p0, 4
  store i32 %21, ptr %20
  %22 = getelementptr %struct.1, ptr %p1, i32 %p0
  %23 = getelementptr inbounds %struct.1, ptr %22, i32 0, i32 4
  %24 = bitcast ptr %23 to ptr ; %struct.0 -> i32
  %25 = getelementptr i32, ptr %24, i32 1
  %26 = add i32 %p0, 5
  store i32 %26, ptr %25
  %27 = getelementptr %struct.1, ptr %p1, i32 %p0
  %28 = getelementptr inbounds %struct.1, ptr %27, i32 0, i32 4
  %29 = bitcast ptr %28 to ptr ; %struct.0 -> i32
  %30 = getelementptr i32, ptr %29, i32 2
  %31 = add i32 %p0, 6
  store i32 %31, ptr %30
  %32 = getelementptr %struct.1, ptr %p1, i32 %p0
  %33 = getelementptr inbounds %struct.1, ptr %32, i32 0, i32 4
  %34 = bitcast ptr %33 to ptr ; %struct.0 -> i32
  %35 = getelementptr i32, ptr %34, i32 3
  %36 = add i32 %p0, 7
  store i32 %36, ptr %35
  ret void

}

