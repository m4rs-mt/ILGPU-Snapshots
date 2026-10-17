; stage: AfterGlobalOpt  opt: O0
; module: LaunchClosure  [intptr: i64]

%view.i64 = view i64
%struct.0 = type { %view.i64, i64, i8 }

define void @LaunchClosure(i32 %p0, %struct.0 %p1, i32 %p2, i64 %p3) {
entry:
  %0 = alloca %struct.0, i32 1
  store %struct.0 %p1, ptr %0
  %1 = alloca i64, i32 1
  store i64 %p3, ptr %1
  %2 = call %view.i64 @get_BaseView(ptr<%struct.0> addrspace(local) %0)
  %3 = call i32 @ComputeLinearIndex(ptr<%struct.0> addrspace(local) %0, i32 %p0)
  %4 = call i64 @get_Offset(ptr<i64> addrspace(local) %1)
  %5 = call i32 @op_Implicit(i32 %p2)
  %6 = call i32 @op_Multiply(i32 %5, i32 %p0)
  %7 = call i32 @op_Implicit(i32 %6)
  %8 = getelementptr i64, ptr %2, i32 %3
  %9 = sext i32 %7 to i64
  %10 = add i64 %4, %9
  store i64 %10, ptr %8
  ret void

}

define i32 @op_Implicit(i32 %p0) {
entry:
  ret i32 %p0

}

define i32 @op_Multiply(i32 %p0, i32 %p1) {
entry:
  %0 = mul i32 %p0, %p1
  ret i32 %0

}

define i32 @op_Implicit(i32 %p0) {
entry:
  ret i32 %p0

}

define i64 @get_Offset(ptr<i64> addrspace(local) %p0) {
entry:
  %0 = load i64, ptr %p0
  ret i64 %0

}

define i32 @ComputeLinearIndex(ptr<%struct.0> addrspace(local) %p0, i32 %p1) {
entry:
  %0 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 2
  %1 = load i8, ptr %0
  %2 = alloca i64, i32 1
  store i64 0, ptr %2
  %3 = call i64 @get_Extent(ptr<%struct.0> addrspace(local) %p0)
  store i64 %3, ptr %2
  %4 = call i32 @ToIntIndex(ptr<i64> addrspace(local) %2)
  %5 = call i32 @ComputeElementIndexChecked(i8 %1, i32 %p1, i32 %4)
  ret i32 %5

}

define i32 @ComputeElementIndexChecked(i8 %p0, i32 %p1, i32 %p2) {
entry:
  %0 = alloca i32, i32 1
  store i32 %p1, ptr %0
  %1 = call i32 @get_X(ptr<i32> addrspace(local) %0)
  ret i32 %1

}

define i32 @get_X(ptr<i32> addrspace(local) %p0) {
entry:
  %0 = load i32, ptr %p0
  ret i32 %0

}

define i32 @ToIntIndex(ptr<i64> addrspace(local) %p0) {
entry:
  %0 = load i64, ptr %p0
  %1 = load i64, ptr %p0
  %2 = trunc i64 %1 to i32
  ret i32 %2

}

define i64 @get_Extent(ptr<%struct.0> addrspace(local) %p0) {
entry:
  %0 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 1
  %1 = load i64, ptr %0
  ret i64 %1

}

define %view.i64 @get_BaseView(ptr<%struct.0> addrspace(local) %p0) {
entry:
  %0 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 0
  %1 = load %view.i64, ptr %0
  ret %view.i64 %1

}

