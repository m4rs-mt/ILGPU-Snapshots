; stage: AfterBackendTransforms  backend: Cuda  opt: O0
; module: ViewOfStructCounterKernel  [intptr: i64]

%struct.0 = type { ptr<i32> addrspace(global), i64 }
%struct.1 = type { ptr<i32> addrspace(global), i64, i64, i8 }
%struct.2 = type { i16, i8, i32 }
%struct.3 = type { ptr<%struct.2> addrspace(global), i64 }

define void @ViewOfStructCounterKernel(i32 %p0, %struct.1 %p1, %struct.3 %p2, i32 %p3) {
entry:
  %0 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %1 = extractvalue %struct.0 %0, 0
  %2 = getelementptr i32, ptr %1, i32 %p0
  %3 = load i32, ptr %2
  %4 = icmp ne i32 %3, %p3
  %5 = extractvalue %struct.3 %p2, 0
  %6 = bitcast ptr %5 to ptr ; %struct.2 -> i8
  %7 = getelementptr i8, ptr %6, i64 4
  %8 = bitcast ptr %7 to ptr ; i8 -> i32
  br i1 %4, label %bb2, label %bb1

bb1:
  %9 = atomicrmw add ptr %8, i32 1 seq_cst
  br label %bb2

bb2:
  ret void

}

