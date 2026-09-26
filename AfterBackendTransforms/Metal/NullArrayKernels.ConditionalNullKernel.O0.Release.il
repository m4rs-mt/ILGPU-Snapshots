; stage: AfterBackendTransforms  backend: Metal  opt: O0
; module: ConditionalNullKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(local), i64 }

@g0 = internal global i32 zeroinitializer ; local

define void @ConditionalNullKernel(i32 %p0, ptr<i32> %p1, i64 %p2, i64 %p3, i8 %p4) {
entry:
  %0 = and i32 %p0, 1
  %1 = icmp eq i32 %0, 0
  %2 = { ptr<i32> addrspace(local) @g0, i64 3 }  ; %struct.0
  %3 = getelementptr i32, ptr %p1, i32 %p0
  br i1 %1, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %4 = phi %struct.0 [ null, %bb1 ], [ %2, %bb2 ]
  %5 = extractvalue %struct.0 %4, 0
  %6 = icmp eq ptr<i32> addrspace(local) %5, null
  %7 = extractvalue %struct.0 %4, 1
  %8 = trunc i64 %7 to i32
  br i1 %6, label %bb5, label %bb4

bb4:
  br label %bb6

bb5:
  br label %bb6

bb6:
  %9 = phi i32 [ %8, %bb4 ], [ -1, %bb5 ]
  store i32 %9, ptr %3
  ret void

}

