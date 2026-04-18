; stage: AfterBackendTransforms  backend: Cuda  opt: O0
; module: FloatToUInt32Kernel  [intptr: i64]

%struct.0 = type { ptr<float> addrspace(global), i64 }
%struct.1 = type { ptr<float> addrspace(global), i64, i64, i8 }
%struct.2 = type { ptr<i32> addrspace(global), i64 }
%struct.3 = type { ptr<i32> addrspace(global), i64, i64, i8 }

define void @FloatToUInt32Kernel(i32 %p0, %struct.1 %p1, %struct.3 %p2) {
entry:
  %0 = alloca float, i32 1
  store float 0.0, ptr %0
  %1 = extractvalue %struct.1 %p1, 0 [Span: 2]
  %2 = extractvalue %struct.0 %1, 0
  %3 = getelementptr float, ptr %2, i32 %p0
  %4 = load float, ptr %3
  store float %4, ptr %0
  %5 = bitcast ptr %0 to ptr ; float -> i32
  %6 = load i32, ptr %5
  %7 = extractvalue %struct.3 %p2, 0 [Span: 2]
  %8 = extractvalue %struct.2 %7, 0
  %9 = getelementptr i32, ptr %8, i32 %p0
  store i32 %6, ptr %9
  ret void

}

