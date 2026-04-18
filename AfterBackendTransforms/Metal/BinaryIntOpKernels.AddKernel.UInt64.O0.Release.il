; stage: AfterBackendTransforms  backend: Metal  opt: O0
; module: AddKernel  [intptr: i64]

define void @AddKernel(i32 %p0, ptr<i64> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4, ptr<i64> addrspace(global) %p5, i64 %p6, i64 %p7, i8 %p8, ptr<i64> addrspace(global) %p9, i64 %p10, i64 %p11, i8 %p12) {
entry:
  %0 = getelementptr i64, ptr %p5, i32 %p0
  %1 = load i64, ptr %0
  %2 = getelementptr i64, ptr %p1, i32 %p0
  %3 = load i64, ptr %2
  %4 = getelementptr i64, ptr %p9, i32 %p0
  %5 = add i64 %3, %1
  store i64 %5, ptr %4
  ret void

}

