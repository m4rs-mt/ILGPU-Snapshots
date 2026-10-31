; stage: AfterBackendTransforms  backend: Metal  opt: O2
; module: LocalNullCheckKernel  [intptr: i64]

define void @LocalNullCheckKernel(i32 %p0, ptr<i32> addrspace(global) %p1, i64 %p2, i64 %p3, i8 %p4) {
entry:
  %0 = alloca i32, i32 1
  store i32 0, ptr %0
  %1 = getelementptr i32, ptr %p1, i32 %p0
  %2 = load i32, ptr %1
  store i32 %2, ptr %0
  %3 = load i32, ptr %0
  %4 = icmp sle i32 %3, 15
  %5 = select i1 %4, ptr<i32> addrspace(local) null, ptr<i32> addrspace(local) %0
  %6 = icmp eq ptr<i32> addrspace(local) %5, null
  %7 = getelementptr i32, ptr %p1, i32 %p0
  %8 = icmp eq ptr<i32> addrspace(local) %5, null
  %9 = select i1 %8, i32 1, i32 2
  br i1 %6, label %bb2, label %bb1

bb1:
  %10 = load i32, ptr %5
  %11 = add i32 %10, 100
  store i32 %11, ptr %5
  br label %bb2

bb2:
  %12 = load i32, ptr %0
  %13 = add i32 %12, %9
  store i32 %13, ptr %7
  ret void

}

