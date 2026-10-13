; stage: AfterGlobalOpt  opt: O1
; module: PointerToPointerKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @PointerToPointerKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = alloca i32, i32 1
  store i32 0, ptr %0
  %1 = alloca i32, i32 1
  store i32 0, ptr %1
  %2 = alloca ptr<i32> addrspace(local), i32 1
  store ptr<i32> addrspace(local) null, ptr %2
  %3 = extractvalue %struct.0 %p1, 0
  %4 = getelementptr i32, ptr %3, i32 %p0
  %5 = load i32, ptr %4
  store i32 %5, ptr %0
  store i32 7, ptr %1
  store ptr<i32> addrspace(local) %0, ptr %2
  %6 = and i32 %p0, 1
  %7 = icmp ule i32 %6, 0
  %8 = bitcast ptr %2 to ptr ; ptr<i32> addrspace(local) -> ptr<void> addrspace(local)
  %9 = bitcast ptr %1 to ptr ; i32 -> void
  %10 = bitcast ptr %2 to ptr ; ptr<i32> addrspace(local) -> ptr<void> addrspace(local)
  %11 = extractvalue %struct.0 %p1, 0
  %12 = getelementptr i32, ptr %11, i32 %p0
  br i1 %7, label %bb2, label %bb1

bb1:
  store ptr<void> addrspace(local) %9, ptr %8
  br label %bb2

bb2:
  %13 = load ptr<void> addrspace(local), ptr %10
  %14 = bitcast ptr %13 to ptr ; void -> i32
  %15 = load i32, ptr %14
  %16 = bitcast ptr %13 to ptr ; void -> i32
  %17 = add i32 %15, 1
  store i32 %17, ptr %16
  %18 = load i32, ptr %0
  %19 = load i32, ptr %1
  %20 = load ptr<i32> addrspace(local), ptr %2
  %21 = load i32, ptr %20
  %22 = mul i32 %19, 10
  %23 = add i32 %18, %22
  %24 = mul i32 %21, 100
  %25 = add i32 %23, %24
  store i32 %25, ptr %12
  ret void

}

