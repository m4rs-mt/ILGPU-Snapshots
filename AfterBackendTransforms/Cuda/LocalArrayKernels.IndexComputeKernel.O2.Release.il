; stage: AfterBackendTransforms  backend: Cuda  opt: O2
; module: IndexComputeKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64, i64, i8 }

@g0 = internal global i32 zeroinitializer ; local

define void @IndexComputeKernel(i32 %p0, %struct.0 %p1) {
entry:
  store i32 100, ptr @g0
  %0 = getelementptr i32, ptr @g0, i32 1
  store i32 200, ptr %0
  %1 = getelementptr i32, ptr @g0, i32 2
  store i32 300, ptr %1
  %2 = getelementptr i32, ptr @g0, i32 3
  store i32 400, ptr %2
  %3 = getelementptr i32, ptr @g0, i32 %p0
  %4 = load i32, ptr %3
  %5 = extractvalue %struct.0 %p1, 0
  %6 = getelementptr i32, ptr %5, i32 %p0
  store i32 %4, ptr %6
  ret void

}

