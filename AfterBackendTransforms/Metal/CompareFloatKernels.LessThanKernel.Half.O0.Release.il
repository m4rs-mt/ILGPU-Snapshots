; stage: AfterBackendTransforms  backend: Metal  opt: O0
; module: LessThanKernel  [intptr: i64]

define void @LessThanKernel(i32 %p0, ptr<i16> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4, ptr<i16> addrspace(global) %p5, i64 %p6, i64 %p7, i8 %p8, ptr<i32> addrspace(global) %p9, i64 %p10, i64 %p11, i8 %p12) {
entry:
  %0 = getelementptr i16, ptr %p1, i32 %p0
  %1 = load i16, ptr %0
  %2 = getelementptr i16, ptr %p5, i32 %p0
  %3 = load i16, ptr %2
  %4 = icmp slt i16 %1, %3
  %5 = getelementptr i32, ptr %p9, i32 %p0
  br i1 %4, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %6 = phi i32 [ 0, %bb1 ], [ 1, %bb2 ]
  store i32 %6, ptr %5
  ret void

}

