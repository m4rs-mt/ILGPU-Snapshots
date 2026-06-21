; stage: AfterGlobalOpt  opt: O1
; module: LocalRefHelperKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @LocalRefHelperKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = alloca i32, i32 1
  store i32 0, ptr %0
  %1 = mul i32 %p0, 10
  store i32 %1, ptr %0
  call void @Increment(ptr<i32> addrspace(local) %0)
  %2 = load i32, ptr %0
  %3 = extractvalue %struct.0 %p1, 0
  %4 = getelementptr i32, ptr %3, i32 %p0
  store i32 %2, ptr %4
  ret void

}

define void @Increment(ptr<i32> addrspace(local) %p0) {
entry:
  %0 = load i32, ptr %p0
  %1 = add i32 %0, 1
  store i32 %1, ptr %p0
  ret void

}

