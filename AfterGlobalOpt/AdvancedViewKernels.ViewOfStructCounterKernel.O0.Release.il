; stage: AfterGlobalOpt  opt: O0
; module: ViewOfStructCounterKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }
%struct.1 = type { i16, i8, i32 }
%view.struct = view %struct.1
%view.i8 = view i8

define void @ViewOfStructCounterKernel(i32 %p0, %struct.0 %p1, %view.struct %p2, i32 %p3) {
entry:
  %0 = alloca %struct.0, i32 1
  store %struct.0 %p1, ptr %0
  %1 = call %view.i32 @get_BaseView(ptr<%struct.0> addrspace(local) %0)
  %2 = call i32 @ComputeLinearIndex(ptr<%struct.0> addrspace(local) %0, i32 %p0)
  %3 = getelementptr i32, ptr %1, i32 %2
  %4 = load i32, ptr %3
  %5 = icmp ne i32 %4, %p3
  %6 = call %view.i8 @ilgpu.view.cast(%view.struct %p2)
  %7 = call i64 @ilgpu.view.length(%view.i8 %6)
  %8 = sub i64 %7, 4
  %9 = call %view.i8 @ilgpu.view.sub(%view.i8 %6, i64 4, i64 %8)
  %10 = call %view.i32 @ilgpu.view.cast(%view.i8 %9)
  %11 = getelementptr i32, ptr %10, i32 0
  br i1 %5, label %bb2, label %bb1

bb1:
  %12 = atomicrmw add ptr %11, i32 1 seq_cst
  br label %bb2

bb2:
  ret void

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
  %0 = alloca i8, i32 1
  store i8 %p0, ptr %0
  %1 = alloca i32, i32 1
  store i32 %p1, ptr %1
  %2 = call i32 @get_X(ptr<i32> addrspace(local) %1)
  %3 = addrspacecast ptr %0 to ptr<i8>
  %4 = call i32 @get_XStride(ptr<i8> %3)
  %5 = mul i32 %2, %4
  ret i32 %5

}

define i32 @get_XStride(ptr<i8> %p0) {
entry:
  ret i32 1

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

define %view.i32 @get_BaseView(ptr<%struct.0> addrspace(local) %p0) {
entry:
  %0 = getelementptr inbounds %struct.0, ptr %p0, i32 0, i32 0
  %1 = load %view.i32, ptr %0
  ret %view.i32 %1

}

