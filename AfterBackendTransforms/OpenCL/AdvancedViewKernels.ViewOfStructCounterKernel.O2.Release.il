; stage: AfterBackendTransforms  backend: OpenCL  opt: O2
; module: ViewOfStructCounterKernel  [intptr: i64]

%struct.0 = type { i16, i8, i32 }

define void @ViewOfStructCounterKernel(i32 %p0, i32 %p1, ptr<i32> addrspace(global) %p2, i64 %p3, i64 %p4, i8 %p5, ptr<%struct.0> addrspace(global) %p6, i64 %p7) {
entry:
  %0 = getelementptr i32, ptr %p2, i32 %p0
  %1 = load i32, ptr %0
  %2 = icmp ne i32 %1, %p1
  %3 = bitcast ptr %p6 to ptr ; %struct.0 -> i8
  %4 = getelementptr i8, ptr %3, i64 4
  %5 = bitcast ptr %4 to ptr ; i8 -> i32
  br i1 %2, label %bb2, label %bb1

bb1:
  %6 = atomicrmw add ptr %5, i32 1 seq_cst
  br label %bb2

bb2:
  ret void

}

