; stage: AfterBackendTransforms  backend: OpenCL  opt: O0
; module: SwitchMapKernel  [intptr: i64]

define void @SwitchMapKernel(i32 %p0, i32 %p1, ptr<i32> addrspace(global) %p2, i64 %p3, i64 %p4, i8 %p5) {
entry:
  %0 = getelementptr i32, ptr %p2, i32 %p0
  switch i32 %p1, label %bb5 [
    i32 0, label %bb4
    i32 1, label %bb3
    i32 2, label %bb2
    i32 3, label %bb1
  ]

bb1:
  br label %bb7

bb2:
  br label %bb7

bb3:
  br label %bb7

bb4:
  br label %bb7

bb5:
  br label %bb6

bb6:
  br label %bb7

bb7:
  %1 = phi i32 [ 40, %bb1 ], [ 30, %bb2 ], [ 20, %bb3 ], [ 10, %bb4 ], [ -1, %bb6 ]
  store i32 %1, ptr %0
  ret void

}

