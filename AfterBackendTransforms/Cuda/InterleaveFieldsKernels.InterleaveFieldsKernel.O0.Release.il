; stage: AfterBackendTransforms  backend: Cuda  opt: O0
; module: InterleaveFieldsKernel  [intptr: i64]

%struct.0 = type { i32, i32, i32, i32 }
%struct.1 = type { i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.2 = type { ptr<%struct.1> addrspace(global), i64 }
%struct.3 = type { ptr<%struct.1> addrspace(global), i64, i64, i8 }

define void @InterleaveFieldsKernel(i32 %p0, %struct.3 %p1) {
entry:
  %0 = extractvalue %struct.3 %p1, 0 [Span: 2]
  %1 = extractvalue %struct.2 %0, 0
  %2 = getelementptr %struct.1, ptr %1, i32 %p0
  %3 = getelementptr inbounds %struct.1, ptr %2, i32 0, i32 0
  %4 = bitcast ptr %3 to ptr ; %struct.0 -> i32
  store i32 %p0, ptr %4
  %5 = extractvalue %struct.3 %p1, 0 [Span: 2]
  %6 = extractvalue %struct.2 %5, 0
  %7 = getelementptr %struct.1, ptr %6, i32 %p0
  %8 = getelementptr inbounds %struct.1, ptr %7, i32 0, i32 0
  %9 = bitcast ptr %8 to ptr ; %struct.0 -> i32
  %10 = getelementptr i32, ptr %9, i32 1
  %11 = add i32 %p0, 1
  store i32 %11, ptr %10
  %12 = extractvalue %struct.3 %p1, 0 [Span: 2]
  %13 = extractvalue %struct.2 %12, 0
  %14 = getelementptr %struct.1, ptr %13, i32 %p0
  %15 = getelementptr inbounds %struct.1, ptr %14, i32 0, i32 0
  %16 = bitcast ptr %15 to ptr ; %struct.0 -> i32
  %17 = getelementptr i32, ptr %16, i32 2
  %18 = add i32 %p0, 2
  store i32 %18, ptr %17
  %19 = extractvalue %struct.3 %p1, 0 [Span: 2]
  %20 = extractvalue %struct.2 %19, 0
  %21 = getelementptr %struct.1, ptr %20, i32 %p0
  %22 = getelementptr inbounds %struct.1, ptr %21, i32 0, i32 0
  %23 = bitcast ptr %22 to ptr ; %struct.0 -> i32
  %24 = getelementptr i32, ptr %23, i32 3
  %25 = add i32 %p0, 3
  store i32 %25, ptr %24
  %26 = extractvalue %struct.3 %p1, 0 [Span: 2]
  %27 = extractvalue %struct.2 %26, 0
  %28 = getelementptr %struct.1, ptr %27, i32 %p0
  %29 = getelementptr inbounds %struct.1, ptr %28, i32 0, i32 4
  %30 = bitcast ptr %29 to ptr ; %struct.0 -> i32
  %31 = add i32 %p0, 4
  store i32 %31, ptr %30
  %32 = extractvalue %struct.3 %p1, 0 [Span: 2]
  %33 = extractvalue %struct.2 %32, 0
  %34 = getelementptr %struct.1, ptr %33, i32 %p0
  %35 = getelementptr inbounds %struct.1, ptr %34, i32 0, i32 4
  %36 = bitcast ptr %35 to ptr ; %struct.0 -> i32
  %37 = getelementptr i32, ptr %36, i32 1
  %38 = add i32 %p0, 5
  store i32 %38, ptr %37
  %39 = extractvalue %struct.3 %p1, 0 [Span: 2]
  %40 = extractvalue %struct.2 %39, 0
  %41 = getelementptr %struct.1, ptr %40, i32 %p0
  %42 = getelementptr inbounds %struct.1, ptr %41, i32 0, i32 4
  %43 = bitcast ptr %42 to ptr ; %struct.0 -> i32
  %44 = getelementptr i32, ptr %43, i32 2
  %45 = add i32 %p0, 6
  store i32 %45, ptr %44
  %46 = extractvalue %struct.3 %p1, 0 [Span: 2]
  %47 = extractvalue %struct.2 %46, 0
  %48 = getelementptr %struct.1, ptr %47, i32 %p0
  %49 = getelementptr inbounds %struct.1, ptr %48, i32 0, i32 4
  %50 = bitcast ptr %49 to ptr ; %struct.0 -> i32
  %51 = getelementptr i32, ptr %50, i32 3
  %52 = add i32 %p0, 7
  store i32 %52, ptr %51
  ret void

}

