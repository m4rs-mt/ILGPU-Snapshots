; stage: AfterBackendTransforms  backend: OpenCL  opt: O1
; module: FixedKernel  [intptr: i64]

@g0 = internal global i32 zeroinitializer ; local

define void @FixedKernel(i32 %p0, ptr<i32> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4) {
entry:
  %0 = and i32 %p0, 3
  %1 = getelementptr i32, ptr @g0, i32 %0
  %2 = mul i32 %p0, 10
  store i32 %2, ptr %1
  %3 = and i32 %p0, 3
  %4 = getelementptr i32, ptr @g0, i32 %3
  %5 = load i32, ptr %4
  %6 = getelementptr i32, ptr %p1, i32 %p0
  store i32 %5, ptr %6
  ret void

}

