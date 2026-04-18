; stage: AfterBackendTransforms  backend: OpenCL  opt: O0
; module: FixedReadKernel  [intptr: i64]

%struct.0 = type { i32 }

define void @FixedReadKernel(i32 %p0, ptr<%struct.0> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4, ptr<i32> addrspace(global) %p5, i64 %p6, i64 %p7, i8 %p8) {
entry:
  %0 = alloca %struct.0, i32 1
  store %struct.0 null, ptr %0
  %1 = getelementptr %struct.0, ptr %p1, i32 %p0
  %2 = load %struct.0, ptr %1
  store %struct.0 %2, ptr %0
  %3 = getelementptr inbounds %struct.0, ptr %0, i32 0, i32 0
  %4 = load i32, ptr %3
  %5 = getelementptr inbounds %struct.0, ptr %0, i32 0, i32 0
  %6 = getelementptr i32, ptr %5, i32 1
  %7 = load i32, ptr %6
  %8 = getelementptr inbounds %struct.0, ptr %0, i32 0, i32 0
  %9 = getelementptr i32, ptr %8, i32 2
  %10 = load i32, ptr %9
  %11 = getelementptr inbounds %struct.0, ptr %0, i32 0, i32 0
  %12 = getelementptr i32, ptr %11, i32 3
  %13 = load i32, ptr %12
  %14 = getelementptr i32, ptr %p5, i32 %p0
  %15 = add i32 %4, %7
  %16 = add i32 %15, %10
  %17 = add i32 %16, %13
  store i32 %17, ptr %14
  ret void

}

