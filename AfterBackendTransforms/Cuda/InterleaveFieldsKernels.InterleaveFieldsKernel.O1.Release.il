; stage: AfterBackendTransforms  backend: Cuda  opt: O1
; module: InterleaveFieldsKernel  [intptr: i64]

%struct.0 = type { i32, i32, i32, i32 }
%struct.1 = type { i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.2 = type { ptr<%struct.1> addrspace(global), i64, i64, i8 }

define void @InterleaveFieldsKernel(i32 %p0, %struct.2 %p1) {
entry:
  %0 = extractvalue %struct.2 %p1, 0
  %1 = getelementptr %struct.1, ptr %0, i32 %p0
  %2 = getelementptr inbounds %struct.1, ptr %1, i32 0, i32 0
  %3 = bitcast ptr %2 to ptr ; %struct.0 -> i32
  store i32 %p0, ptr %3
  %4 = extractvalue %struct.2 %p1, 0
  %5 = getelementptr %struct.1, ptr %4, i32 %p0
  %6 = getelementptr inbounds %struct.1, ptr %5, i32 0, i32 0
  %7 = bitcast ptr %6 to ptr ; %struct.0 -> i32
  %8 = getelementptr i32, ptr %7, i32 1
  %9 = add i32 %p0, 1
  store i32 %9, ptr %8
  %10 = extractvalue %struct.2 %p1, 0
  %11 = getelementptr %struct.1, ptr %10, i32 %p0
  %12 = getelementptr inbounds %struct.1, ptr %11, i32 0, i32 0
  %13 = bitcast ptr %12 to ptr ; %struct.0 -> i32
  %14 = getelementptr i32, ptr %13, i32 2
  %15 = add i32 %p0, 2
  store i32 %15, ptr %14
  %16 = extractvalue %struct.2 %p1, 0
  %17 = getelementptr %struct.1, ptr %16, i32 %p0
  %18 = getelementptr inbounds %struct.1, ptr %17, i32 0, i32 0
  %19 = bitcast ptr %18 to ptr ; %struct.0 -> i32
  %20 = getelementptr i32, ptr %19, i32 3
  %21 = add i32 %p0, 3
  store i32 %21, ptr %20
  %22 = extractvalue %struct.2 %p1, 0
  %23 = getelementptr %struct.1, ptr %22, i32 %p0
  %24 = getelementptr inbounds %struct.1, ptr %23, i32 0, i32 4
  %25 = bitcast ptr %24 to ptr ; %struct.0 -> i32
  %26 = add i32 %p0, 4
  store i32 %26, ptr %25
  %27 = extractvalue %struct.2 %p1, 0
  %28 = getelementptr %struct.1, ptr %27, i32 %p0
  %29 = getelementptr inbounds %struct.1, ptr %28, i32 0, i32 4
  %30 = bitcast ptr %29 to ptr ; %struct.0 -> i32
  %31 = getelementptr i32, ptr %30, i32 1
  %32 = add i32 %p0, 5
  store i32 %32, ptr %31
  %33 = extractvalue %struct.2 %p1, 0
  %34 = getelementptr %struct.1, ptr %33, i32 %p0
  %35 = getelementptr inbounds %struct.1, ptr %34, i32 0, i32 4
  %36 = bitcast ptr %35 to ptr ; %struct.0 -> i32
  %37 = getelementptr i32, ptr %36, i32 2
  %38 = add i32 %p0, 6
  store i32 %38, ptr %37
  %39 = extractvalue %struct.2 %p1, 0
  %40 = getelementptr %struct.1, ptr %39, i32 %p0
  %41 = getelementptr inbounds %struct.1, ptr %40, i32 0, i32 4
  %42 = bitcast ptr %41 to ptr ; %struct.0 -> i32
  %43 = getelementptr i32, ptr %42, i32 3
  %44 = add i32 %p0, 7
  store i32 %44, ptr %43
  ret void

}

