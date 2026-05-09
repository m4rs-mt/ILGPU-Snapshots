; stage: AfterBackendTransforms  backend: Cuda  opt: O2
; module: ViewOfStructCounterKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64, i64, i8 }
%struct.1 = type { i16, i8, i32 }
%struct.2 = type { ptr<%struct.1> addrspace(global), i64 }

define void @ViewOfStructCounterKernel(i32 %p0, %struct.0 %p1, %struct.2 %p2, i32 %p3) {
entry:
  %0 = extractvalue %struct.0 %p1, 0
  %1 = getelementptr i32, ptr %0, i32 %p0
  %2 = load i32, ptr %1
  %3 = icmp ne i32 %2, %p3
  %4 = extractvalue %struct.2 %p2, 0
  %5 = bitcast ptr %4 to ptr ; %struct.1 -> i8
  %6 = getelementptr i8, ptr %5, i64 4
  %7 = bitcast ptr %6 to ptr ; i8 -> i32
  br i1 %3, label %bb2, label %bb1

bb1:
  %8 = atomicrmw add ptr %7, i32 1 seq_cst
  br label %bb2

bb2:
  ret void

}

