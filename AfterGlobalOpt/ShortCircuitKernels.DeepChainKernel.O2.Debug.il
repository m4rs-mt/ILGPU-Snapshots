; stage: AfterGlobalOpt  opt: O2
; module: DeepChainKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @DeepChainKernel(i32 %p0, %struct.0 %p1, i32 %p2) {
entry:
  %0 = and i32 %p2, 2
  %1 = icmp eq i32 %0, 0
  %2 = and i32 %p2, 1
  %3 = icmp eq i32 %2, 0
  %4 = or i1 %1, %3
  %5 = icmp ne i32 %2, 0
  %6 = icmp ne i32 %0, 0
  %7 = and i1 %5, %6
  %8 = and i32 %p2, 4
  %9 = icmp eq i32 %8, 0
  %10 = and i1 %7, %9
  %11 = or i1 %4, %10
  %12 = icmp ne i32 %8, 0
  %13 = and i1 %7, %12
  %14 = and i32 %p2, 8
  %15 = icmp eq i32 %14, 0
  %16 = and i1 %13, %15
  %17 = or i1 %11, %16
  %18 = icmp ne i32 %14, 0
  %19 = and i1 %13, %18
  %20 = and i32 %p2, 16
  %21 = icmp eq i32 %20, 0
  %22 = and i1 %19, %21
  %23 = or i1 %17, %22
  %24 = icmp ne i32 %20, 0
  %25 = and i1 %19, %24
  %26 = and i32 %p2, 32
  %27 = icmp eq i32 %26, 0
  %28 = and i1 %25, %27
  %29 = or i1 %23, %28
  %30 = icmp ne i32 %26, 0
  %31 = and i1 %25, %30
  %32 = and i32 %p2, 64
  %33 = icmp eq i32 %32, 0
  %34 = and i1 %31, %33
  %35 = or i1 %29, %34
  %36 = icmp ne i32 %32, 0
  %37 = and i1 %31, %36
  %38 = and i32 %p2, 128
  %39 = icmp eq i32 %38, 0
  %40 = and i1 %37, %39
  %41 = or i1 %35, %40
  %42 = icmp ne i32 %38, 0
  %43 = and i1 %37, %42
  %44 = and i32 %p2, 256
  %45 = icmp eq i32 %44, 0
  %46 = and i1 %43, %45
  %47 = or i1 %41, %46
  %48 = and i32 %p2, 512
  %49 = icmp ule i32 %48, 0
  %50 = or i1 %47, %49
  %51 = extractvalue %struct.0 %p1, 1
  %52 = icmp sge i64 %51, -2147483648
  %53 = icmp sle i64 %51, 2147483647
  %54 = and i1 %52, %53
  %55 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %56 = icmp sge i32 %p0, 0
  %57 = trunc i64 %51 to i32
  %58 = icmp slt i32 %p0, %57
  %59 = and i1 %56, %58
  %60 = icmp eq i32 %p0, 0
  %61 = icmp eq i32 %57, 0
  %62 = and i1 %60, %61
  %63 = or i1 %59, %62
  %64 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %65 = extractvalue %struct.0 %p1, 0
  %66 = getelementptr i32, ptr %65, i32 %p0
  %67 = extractvalue %struct.0 %p1, 1
  %68 = icmp sge i64 %67, -2147483648
  %69 = icmp sle i64 %67, 2147483647
  %70 = and i1 %68, %69
  %71 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %72 = icmp sge i32 %p0, 0
  %73 = trunc i64 %67 to i32
  %74 = icmp slt i32 %p0, %73
  %75 = and i1 %72, %74
  %76 = icmp eq i32 %p0, 0
  %77 = icmp eq i32 %73, 0
  %78 = and i1 %76, %77
  %79 = or i1 %75, %78
  %80 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %81 = extractvalue %struct.0 %p1, 0
  %82 = getelementptr i32, ptr %81, i32 %p0
  br i1 %50, label %bb2, label %bb1

bb1:
  call void @ilgpu.debug.assert(i1 %54, ptr %55)
  call void @ilgpu.debug.assert(i1 %63, ptr %64)
  store i32 1, ptr %66
  br label %bb3

bb2:
  call void @ilgpu.debug.assert(i1 %70, ptr %71)
  call void @ilgpu.debug.assert(i1 %79, ptr %80)
  store i32 0, ptr %82
  br label %bb3

bb3:
  ret void

}

