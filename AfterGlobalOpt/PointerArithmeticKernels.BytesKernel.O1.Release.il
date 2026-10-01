; stage: AfterGlobalOpt  opt: O1
; module: BytesKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }
%struct.1 = type { i32, i32, i32 }

define void @BytesKernel(i32 %p0, %struct.0 %p1) {
entry:
  %0 = alloca i32, i32 1
  store i32 0, ptr %0
  %1 = alloca %struct.1, i32 1
  store %struct.1 null, ptr %1
  %2 = extractvalue %struct.0 %p1, 0
  %3 = getelementptr i32, ptr %2, i32 %p0
  %4 = load i32, ptr %3
  %5 = add i32 %4, 16909056
  store i32 %5, ptr %0
  %6 = getelementptr inbounds %struct.1, ptr %1, i32 0, i32 0
  store i32 256, ptr %6
  %7 = getelementptr inbounds %struct.1, ptr %1, i32 0, i32 1
  store i32 2, ptr %7
  %8 = getelementptr inbounds %struct.1, ptr %1, i32 0, i32 2
  store i32 3, ptr %8
  %9 = bitcast ptr %0 to ptr ; i32 -> i8
  %10 = load i8, ptr %9
  %11 = getelementptr i8, ptr %9, i32 1
  %12 = load i8, ptr %11
  %13 = getelementptr i8, ptr %9, i32 2
  %14 = load i8, ptr %13
  %15 = and i32 %p0, 3
  %16 = getelementptr i8, ptr %9, i32 %15
  %17 = load i8, ptr %16
  %18 = getelementptr inbounds %struct.1, ptr %1, i32 0, i32 0
  %19 = bitcast ptr %18 to ptr ; i32 -> i8
  %20 = getelementptr i8, ptr %19, i32 1
  %21 = load i8, ptr %20
  %22 = getelementptr i32, ptr %18, i32 1
  %23 = load i32, ptr %22
  %24 = extractvalue %struct.0 %p1, 0
  %25 = getelementptr i32, ptr %24, i32 %p0
  %26 = zext i8 %10 to i32
  %27 = zext i8 %12 to i32
  %28 = mul i32 %27, 10
  %29 = add i32 %26, %28
  %30 = zext i8 %14 to i32
  %31 = mul i32 %30, 100
  %32 = add i32 %29, %31
  %33 = zext i8 %17 to i32
  %34 = mul i32 %33, 1000
  %35 = add i32 %32, %34
  %36 = zext i8 %21 to i32
  %37 = add i32 %36, %23
  %38 = mul i32 %37, 10000
  %39 = add i32 %35, %38
  store i32 %39, ptr %25
  ret void

}

