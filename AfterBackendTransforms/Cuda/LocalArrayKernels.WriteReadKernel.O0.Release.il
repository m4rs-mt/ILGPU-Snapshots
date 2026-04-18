; stage: AfterBackendTransforms  backend: Cuda  opt: O0
; module: WriteReadKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64 }
%struct.1 = type { ptr<i32> addrspace(global), i64, i64, i8 }

@g0 = internal global i32 zeroinitializer ; local

define void @WriteReadKernel(i32 %p0, %struct.1 %p1) {
entry:
  store i32 10, ptr @g0
  %0 = getelementptr i32, ptr @g0, i32 1
  store i32 20, ptr %0
  %1 = getelementptr i32, ptr @g0, i32 2
  store i32 30, ptr %1
  %2 = getelementptr i32, ptr @g0, i32 3
  store i32 40, ptr %2
  %3 = getelementptr i32, ptr @g0, i32 %p0
  %4 = load i32, ptr %3
  %5 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %6 = extractvalue %struct.0 %5, 0
  %7 = getelementptr i32, ptr %6, i32 %p0
  store i32 %4, ptr %7
  ret void

}

