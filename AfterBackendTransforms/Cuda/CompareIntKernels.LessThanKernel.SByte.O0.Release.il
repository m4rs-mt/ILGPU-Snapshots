; stage: AfterBackendTransforms  backend: Cuda  opt: O0
; module: LessThanKernel  [intptr: i64]

%struct.0 = type { ptr<i8> addrspace(global), i64 }
%struct.1 = type { ptr<i8> addrspace(global), i64, i64, i8 }
%struct.2 = type { ptr<i32> addrspace(global), i64 }
%struct.3 = type { ptr<i32> addrspace(global), i64, i64, i8 }

define void @LessThanKernel(i32 %p0, %struct.1 %p1, %struct.1 %p2, %struct.3 %p3) {
entry:
  %0 = extractvalue %struct.1 %p2, 0 [Span: 2]
  %1 = extractvalue %struct.0 %0, 0
  %2 = getelementptr i8, ptr %1, i32 %p0
  %3 = load i8, ptr %2
  %4 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %5 = extractvalue %struct.0 %4, 0
  %6 = getelementptr i8, ptr %5, i32 %p0
  %7 = load i8, ptr %6
  %8 = sext i8 %7 to i32
  %9 = sext i8 %3 to i32
  %10 = icmp slt i32 %8, %9
  %11 = extractvalue %struct.3 %p3, 0 [Span: 2]
  %12 = extractvalue %struct.2 %11, 0
  %13 = getelementptr i32, ptr %12, i32 %p0
  br i1 %10, label %bb2, label %bb1

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %14 = phi i32 [ 0, %bb1 ], [ 1, %bb2 ]
  store i32 %14, ptr %13
  ret void

}

