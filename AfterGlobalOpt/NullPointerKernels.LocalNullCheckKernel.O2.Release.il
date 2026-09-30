; stage: AfterGlobalOpt  opt: O2
; module: LocalNullCheckKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @LocalNullCheckKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = alloca i32, i32 1
  store i32 0, ptr %0
  %1 = extractvalue %struct.0 %p1, 0
  %2 = getelementptr i32, ptr %1, i32 %p0
  %3 = load i32, ptr %2
  store i32 %3, ptr %0
  %4 = load i32, ptr %0
  %5 = icmp sle i32 %4, 15
  %6 = select i1 %5, ptr<i32> addrspace(local) null, ptr<i32> addrspace(local) %0
  %7 = icmp eq ptr<i32> addrspace(local) %6, null
  %8 = extractvalue %struct.0 %p1, 0
  %9 = getelementptr i32, ptr %8, i32 %p0
  %10 = icmp eq ptr<i32> addrspace(local) %6, null
  %11 = select i1 %10, i32 1, i32 2
  br i1 %7, label %bb2, label %bb1

bb1:
  %12 = load i32, ptr %6
  %13 = add i32 %12, 100
  store i32 %13, ptr %6
  br label %bb2

bb2:
  %14 = load i32, ptr %0
  %15 = add i32 %14, %11
  store i32 %15, ptr %9
  ret void

}

