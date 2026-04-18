; stage: AfterBackendTransforms  backend: Metal  opt: O1
; module: LessThanKernel  [intptr: i64]

define void @LessThanKernel(i32 %p0, ptr<i32> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4, ptr<i32> addrspace(global) %p5, i64 %p6, i64 %p7, i8 %p8, ptr<i32> addrspace(global) %p9, i64 %p10, i64 %p11, i8 %p12) {
entry:
  %0 = getelementptr i32, ptr %p5, i32 %p0
  %1 = load i32, ptr %0
  %2 = getelementptr i32, ptr %p1, i32 %p0
  %3 = load i32, ptr %2
  %4 = getelementptr i32, ptr %p9, i32 %p0
  %5 = icmp ult i32 %3, %1
  %6 = select i1 %5, i32 1, i32 0
  store i32 %6, ptr %4
  ret void

}

