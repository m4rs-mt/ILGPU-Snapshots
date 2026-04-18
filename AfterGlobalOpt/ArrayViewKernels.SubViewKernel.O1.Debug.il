; stage: AfterGlobalOpt  opt: O1
; module: SubViewKernel  [intptr: i64]

%view.i32 = view i32
%struct.0 = type { %view.i32, i64, i8 }

define void @SubViewKernel(i32 %p0, %struct.0 %p1, %struct.0 %p2, i32 %p3) {
entry:
  %0 = extractvalue %struct.0 %p1, 1
  %1 = icmp sge i64 %0, -2147483648
  %2 = icmp sle i64 %0, 2147483647
  %3 = and i1 %1, %2
  %4 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %3, ptr %4)
  %5 = icmp sge i32 %p3, 0
  %6 = trunc i64 %0 to i32
  %7 = sub i32 %6, %p3
  %8 = add i32 %p3, %7
  %9 = extractvalue %struct.0 %p1, 1
  %10 = trunc i64 %9 to i32
  %11 = icmp sle i32 %8, %10
  %12 = icmp eq i32 %p3, 0
  %13 = icmp eq i32 %7, 0
  %14 = and i1 %12, %13
  %15 = or i1 %11, %14
  %16 = and i1 %5, %15
  %17 = call ptr @ilgpu.string("Index_Extent_X_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %16, ptr %17)
  %18 = extractvalue %struct.0 %p1, 1
  %19 = icmp sge i64 %18, -2147483648
  %20 = icmp sle i64 %18, 2147483647
  %21 = and i1 %19, %20
  %22 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %21, ptr %22)
  %23 = icmp sge i32 %p3, 0
  %24 = trunc i64 %18 to i32
  %25 = icmp slt i32 %p3, %24
  %26 = and i1 %23, %25
  %27 = icmp eq i32 %p3, 0
  %28 = icmp eq i32 %24, 0
  %29 = and i1 %27, %28
  %30 = or i1 %26, %29
  %31 = call ptr @ilgpu.string("X_index_out_of_bounds")
  call void @ilgpu.debug.assert(i1 %30, ptr %31)
  %32 = sext i32 %7 to i64
  %33 = icmp sge i64 %32, -2147483648
  %34 = icmp sle i64 %32, 2147483647
  %35 = and i1 %33, %34
  %36 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  call void @ilgpu.debug.assert(i1 %35, ptr %36)
  %37 = icmp sge i32 %p0, %7
  %38 = extractvalue %struct.0 %p2, 1
  %39 = icmp sge i64 %38, -2147483648
  %40 = icmp sle i64 %38, 2147483647
  %41 = and i1 %39, %40
  %42 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %43 = icmp sge i32 %p0, 0
  %44 = trunc i64 %38 to i32
  %45 = icmp slt i32 %p0, %44
  %46 = and i1 %43, %45
  %47 = icmp eq i32 %p0, 0
  %48 = icmp eq i32 %44, 0
  %49 = and i1 %47, %48
  %50 = or i1 %46, %49
  %51 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %52 = icmp sge i64 %32, -2147483648
  %53 = icmp sle i64 %32, 2147483647
  %54 = and i1 %52, %53
  %55 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %56 = icmp sge i32 %p0, 0
  %57 = icmp slt i32 %p0, %7
  %58 = and i1 %56, %57
  %59 = icmp eq i32 %p0, 0
  %60 = icmp eq i32 %7, 0
  %61 = and i1 %59, %60
  %62 = or i1 %58, %61
  %63 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %64 = extractvalue %struct.0 %p1, 0
  %65 = call %view.i32 @ilgpu.view.sub(%view.i32 %64, i64 %p3, i64 %7)
  %66 = getelementptr i32, ptr %65, i32 %p0
  %67 = extractvalue %struct.0 %p2, 0
  %68 = getelementptr i32, ptr %67, i32 %p0
  %69 = extractvalue %struct.0 %p2, 1
  %70 = icmp sge i64 %69, -2147483648
  %71 = icmp sle i64 %69, 2147483647
  %72 = and i1 %70, %71
  %73 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %74 = icmp sge i32 %p0, 0
  %75 = trunc i64 %69 to i32
  %76 = icmp slt i32 %p0, %75
  %77 = and i1 %74, %76
  %78 = icmp eq i32 %p0, 0
  %79 = icmp eq i32 %75, 0
  %80 = and i1 %78, %79
  %81 = or i1 %77, %80
  %82 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %83 = extractvalue %struct.0 %p2, 0
  %84 = getelementptr i32, ptr %83, i32 %p0
  br i1 %37, label %bb2, label %bb1

bb1:
  call void @ilgpu.debug.assert(i1 %41, ptr %42)
  call void @ilgpu.debug.assert(i1 %50, ptr %51)
  call void @ilgpu.debug.assert(i1 %54, ptr %55)
  call void @ilgpu.debug.assert(i1 %62, ptr %63)
  %85 = load i32, ptr %66
  store i32 %85, ptr %68
  br label %bb3

bb2:
  call void @ilgpu.debug.assert(i1 %72, ptr %73)
  call void @ilgpu.debug.assert(i1 %81, ptr %82)
  store i32 -1, ptr %84
  br label %bb3

bb3:
  ret void

}

