; stage: AfterBackendTransforms  backend: ROCm  opt: O1
; module: LessThanKernel  [intptr: i64]

%struct.0 = type { ptr<double> addrspace(global), i64, i64, i8 }
%struct.1 = type { ptr<i32> addrspace(global), i64, i64, i8 }

define void @LessThanKernel(i32 %p0, %struct.0 %p1, %struct.0 %p2, %struct.1 %p3) {
entry:
  %0 = extractvalue %struct.0 %p2, 0
  %1 = getelementptr double, ptr %0, i32 %p0
  %2 = load double, ptr %1
  %3 = extractvalue %struct.0 %p1, 0
  %4 = getelementptr double, ptr %3, i32 %p0
  %5 = load double, ptr %4
  %6 = extractvalue %struct.1 %p3, 0
  %7 = getelementptr i32, ptr %6, i32 %p0
  %8 = fcmp olt double %5, %2
  %9 = select i1 %8, i32 1, i32 0
  store i32 %9, ptr %7
  ret void

}

