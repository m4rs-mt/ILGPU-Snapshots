; stage: AfterBackendTransforms  backend: ROCm  opt: O0
; module: ConditionalNullKernel  [intptr: i64]

%struct.0 = type { ptr<i32>, i64 }
%struct.1 = type { ptr<i32>, i64, i64, i8 }
%struct.2 = type { ptr<i32> addrspace(local), i64 }

@g0 = internal global i32 zeroinitializer ; local

define void @ConditionalNullKernel(i32 %p0, %struct.1 %p1) {
entry:
  %0 = and i32 %p0, 1
  %1 = icmp eq i32 %0, 0
  %2 = { ptr<i32> addrspace(local) @g0, i64 3 }  ; %struct.2
  %3 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %4 = extractvalue %struct.0 %3, 0
  %5 = getelementptr i32, ptr %4, i32 %p0
  br i1 %1, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %6 = phi %struct.2 [ null, %bb1 ], [ %2, %bb2 ]
  %7 = extractvalue %struct.2 %6, 0
  %8 = icmp eq ptr<i32> addrspace(local) %7, null
  %9 = extractvalue %struct.2 %6, 1
  %10 = trunc i64 %9 to i32
  br i1 %8, label %bb5, label %bb4

bb4:
  br label %bb6

bb5:
  br label %bb6

bb6:
  %11 = phi i32 [ %10, %bb4 ], [ -1, %bb5 ]
  store i32 %11, ptr %5
  ret void

}

