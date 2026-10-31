; stage: AfterGlobalOpt  opt: O1
; module: ConditionalFieldKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }
%struct.1 = type { ptr<i32> addrspace(local), i32 }

define void @ConditionalFieldKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = alloca i32, i32 1
  store i32 0, ptr %0
  %1 = alloca i32, i32 1
  store i32 0, ptr %1
  %2 = extractvalue %struct.0 %p1, 0
  %3 = getelementptr i32, ptr %2, i32 %p0
  %4 = load i32, ptr %3
  store i32 %4, ptr %0
  store i32 7, ptr %1
  %5 = and i32 %p0, 1
  %6 = icmp ule i32 %5, 0
  %7 = { ptr<i32> addrspace(local) %0, i32 1 }  ; %struct.1
  %8 = { ptr<i32> addrspace(local) %1, i32 1 }  ; %struct.1
  %9 = select i1 %6, %struct.1 %7, %struct.1 %8
  %10 = extractvalue %struct.1 %9, 0
  %11 = load i32, ptr %10
  %12 = extractvalue %struct.0 %p1, 0
  %13 = getelementptr i32, ptr %12, i32 %p0
  %14 = extractvalue %struct.1 %9, 1
  %15 = add i32 %11, %14
  store i32 %15, ptr %13
  ret void

}

