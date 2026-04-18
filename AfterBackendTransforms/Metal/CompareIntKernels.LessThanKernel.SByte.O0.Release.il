; stage: AfterBackendTransforms  backend: Metal  opt: O0
; module: LessThanKernel  [intptr: i64]

define void @LessThanKernel(i32 %p0, ptr<i8> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4, ptr<i8> addrspace(global) %p5, i64 %p6, i64 %p7, i8 %p8, ptr<i32> addrspace(global) %p9, i64 %p10, i64 %p11, i8 %p12) {
entry:
  %0 = getelementptr i8, ptr %p5, i32 %p0
  %1 = load i8, ptr %0
  %2 = getelementptr i8, ptr %p1, i32 %p0
  %3 = load i8, ptr %2
  %4 = sext i8 %3 to i32
  %5 = sext i8 %1 to i32
  %6 = icmp slt i32 %4, %5
  %7 = getelementptr i32, ptr %p9, i32 %p0
  br i1 %6, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %8 = phi i32 [ 0, %bb1 ], [ 1, %bb2 ]
  store i32 %8, ptr %7
  ret void

}

