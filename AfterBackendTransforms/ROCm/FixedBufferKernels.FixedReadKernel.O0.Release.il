; stage: AfterBackendTransforms  backend: ROCm  opt: O0
; module: FixedReadKernel  [intptr: i64]

%struct.0 = type { i32 }
%struct.1 = type { ptr<%struct.0> addrspace(global), i64 }
%struct.2 = type { ptr<%struct.0> addrspace(global), i64, i64, i8 }
%struct.3 = type { ptr<i32> addrspace(global), i64 }
%struct.4 = type { ptr<i32> addrspace(global), i64, i64, i8 }

define void @FixedReadKernel(i32 %p0, %struct.2 %p1, %struct.4 %p2) {
entry:
  %0 = alloca %struct.0, i32 1
  store %struct.0 null, ptr %0
  %1 = extractvalue %struct.2 %p1, 0 [Span: 2]
  %2 = extractvalue %struct.1 %1, 0
  %3 = getelementptr %struct.0, ptr %2, i32 %p0
  %4 = load %struct.0, ptr %3
  store %struct.0 %4, ptr %0
  %5 = getelementptr inbounds %struct.0, ptr %0, i32 0, i32 0
  %6 = load i32, ptr %5
  %7 = getelementptr inbounds %struct.0, ptr %0, i32 0, i32 0
  %8 = getelementptr i32, ptr %7, i32 1
  %9 = load i32, ptr %8
  %10 = getelementptr inbounds %struct.0, ptr %0, i32 0, i32 0
  %11 = getelementptr i32, ptr %10, i32 2
  %12 = load i32, ptr %11
  %13 = getelementptr inbounds %struct.0, ptr %0, i32 0, i32 0
  %14 = getelementptr i32, ptr %13, i32 3
  %15 = load i32, ptr %14
  %16 = extractvalue %struct.4 %p2, 0 [Span: 2]
  %17 = extractvalue %struct.3 %16, 0
  %18 = getelementptr i32, ptr %17, i32 %p0
  %19 = add i32 %6, %9
  %20 = add i32 %19, %12
  %21 = add i32 %20, %15
  store i32 %21, ptr %18
  ret void

}

