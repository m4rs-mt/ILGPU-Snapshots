; stage: AfterBackendTransforms  backend: OpenCL  opt: O1
; module: IndexComputeKernel  [intptr: i64]

@g0 = internal global i32 zeroinitializer ; local

define void @IndexComputeKernel(i32 %p0, ptr<i32> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4) {
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
  %5 = getelementptr i32, ptr %p1, i32 %p0
  store i32 %4, ptr %5
  ret void

}

