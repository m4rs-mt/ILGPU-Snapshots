; stage: AfterGlobalOpt  opt: O1
; module: LocalLessKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }
%struct.1 = type { i32, i32, i32, i32 }

define void @LocalLessKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = alloca %struct.1, i32 1
  store %struct.1 null, ptr %0
  %1 = extractvalue %struct.0 %p1, 0
  %2 = getelementptr i32, ptr %1, i32 %p0
  %3 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 0
  %4 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 1
  %5 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 2
  %6 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 3
  %7 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 0
  %8 = getelementptr inbounds %struct.1, ptr %0, i32 0, i32 0
  %9 = getelementptr i32, ptr %8, i32 4
  %10 = extractvalue %struct.0 %p1, 0
  %11 = getelementptr i32, ptr %10, i32 %p0
  br label %bb1

bb1:
  %12 = load i32, ptr %2
  store i32 %12, ptr %3
  store i32 2, ptr %4
  store i32 3, ptr %5
  store i32 4, ptr %6
  br label %bb2

bb2:
  %13 = phi ptr<i32> addrspace(local) [ %7, %bb1 ], [ %15, %bb4 ]
  %14 = phi i32 [ 0, %bb1 ], [ %18, %bb4 ]
  %15 = getelementptr i32, ptr %13, i32 1
  %16 = icmp ult ptr<i32> addrspace(local) %13, %9
  br i1 %16, label %bb4, label %bb3

bb3:
  store i32 %14, ptr %11
  ret void

bb4:
  %17 = load i32, ptr %13
  %18 = add i32 %14, %17
  br label %bb2

}

