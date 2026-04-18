; stage: AfterBackendTransforms  backend: Cuda  opt: O0
; module: LessThanKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64 }
%struct.1 = type { ptr<i32> addrspace(global), i64, i64, i8 }

define void @LessThanKernel(i32 %p0, %struct.1 %p1, %struct.1 %p2, %struct.1 %p3) {
entry:
  %0 = extractvalue %struct.1 %p2, 0 [Span: 2]
  %1 = extractvalue %struct.0 %0, 0
  %2 = getelementptr i32, ptr %1, i32 %p0
  %3 = load i32, ptr %2
  %4 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %5 = extractvalue %struct.0 %4, 0
  %6 = getelementptr i32, ptr %5, i32 %p0
  %7 = load i32, ptr %6
  %8 = icmp ult i32 %7, %3
  %9 = extractvalue %struct.1 %p3, 0 [Span: 2]
  %10 = extractvalue %struct.0 %9, 0
  %11 = getelementptr i32, ptr %10, i32 %p0
  br i1 %8, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %12 = phi i32 [ 0, %bb1 ], [ 1, %bb2 ]
  store i32 %12, ptr %11
  ret void

}

