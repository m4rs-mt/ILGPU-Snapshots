; stage: AfterBackendTransforms  backend: ROCm  opt: O0
; module: EmptyNotNullKernel  [intptr: i64]

%struct.0 = type { ptr<i32>, i64 }
%struct.1 = type { ptr<i32>, i64, i64, i8 }
%struct.2 = type { ptr<i32> addrspace(local), i64 }

@g0 = internal global i32 zeroinitializer ; local

define void @EmptyNotNullKernel(i32 %p0, %struct.1 %p1) {
entry:
  %0 = icmp sgt i32 %p0, 1
  %1 = { ptr<i32> addrspace(local) @g0, i64 0 }  ; %struct.2
  %2 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %3 = extractvalue %struct.0 %2, 0
  %4 = getelementptr i32, ptr %3, i32 %p0
  br i1 %0, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %5 = phi %struct.2 [ null, %bb1 ], [ %1, %bb2 ]
  %6 = extractvalue %struct.2 %5, 0
  %7 = icmp eq ptr<i32> addrspace(local) %6, null
  %8 = extractvalue %struct.2 %5, 1
  %9 = trunc i64 %8 to i32
  br i1 %7, label %bb5, label %bb4

bb4:
  br label %bb6

bb5:
  br label %bb6

bb6:
  %10 = phi i32 [ %9, %bb4 ], [ -1, %bb5 ]
  store i32 %10, ptr %4
  ret void

}

