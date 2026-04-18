; stage: AfterBackendTransforms  backend: OpenCL  opt: O1
; module: AddKernel  [intptr: i64]

define void @AddKernel(i32 %p0, ptr<i8> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4, ptr<i8> addrspace(global) %p5, i64 %p6, i64 %p7, i8 %p8, ptr<i8> addrspace(global) %p9, i64 %p10, i64 %p11, i8 %p12) {
entry:
  %0 = getelementptr i8, ptr %p5, i32 %p0
  %1 = load i8, ptr %0
  %2 = getelementptr i8, ptr %p1, i32 %p0
  %3 = load i8, ptr %2
  %4 = getelementptr i8, ptr %p9, i32 %p0
  %5 = sext i8 %3 to i32
  %6 = sext i8 %1 to i32
  %7 = add i32 %5, %6
  %8 = trunc i32 %7 to i8
  store i8 %8, ptr %4
  ret void

}

