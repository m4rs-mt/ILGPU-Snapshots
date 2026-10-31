; stage: AfterBackendTransforms  backend: OpenCL  opt: O0
; module: EmptyNotNullKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(local), i64 }

@g0 = internal global i32 zeroinitializer ; local

define void @EmptyNotNullKernel(i32 %p0, ptr<i32> %p1, i64 %p2, i64 %p3, i8 %p4) {
entry:
  %0 = icmp sgt i32 %p0, 1
  %1 = { ptr<i32> addrspace(local) @g0, i64 0 }  ; %struct.0
  %2 = getelementptr i32, ptr %p1, i32 %p0
  br i1 %0, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %3 = phi %struct.0 [ null, %bb1 ], [ %1, %bb2 ]
  %4 = extractvalue %struct.0 %3, 0
  %5 = icmp eq ptr<i32> addrspace(local) %4, null
  %6 = extractvalue %struct.0 %3, 1
  %7 = trunc i64 %6 to i32
  br i1 %5, label %bb5, label %bb4

bb4:
  br label %bb6

bb5:
  br label %bb6

bb6:
  %8 = phi i32 [ %7, %bb4 ], [ -1, %bb5 ]
  store i32 %8, ptr %2
  ret void

}

