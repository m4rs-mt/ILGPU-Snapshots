; stage: AfterBackendTransforms  backend: Metal  opt: O1
; module: LessThanKernel  [intptr: i64]

define void @LessThanKernel(i32 %p0, ptr<i8> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4, ptr<i8> addrspace(global) %p5, i64 %p6, i64 %p7, i8 %p8, ptr<i32> addrspace(global) %p9, i64 %p10, i64 %p11, i8 %p12) {
entry:
  %0 = getelementptr i8, ptr %p5, i32 %p0
  %1 = load i8, ptr %0
  %2 = getelementptr i8, ptr %p1, i32 %p0
  %3 = load i8, ptr %2
  %4 = getelementptr i32, ptr %p9, i32 %p0
  %5 = sext i8 %3 to i32
  %6 = sext i8 %1 to i32
  %7 = icmp slt i32 %5, %6
  %8 = select i1 %7, i32 1, i32 0
  store i32 %8, ptr %4
  ret void

}

