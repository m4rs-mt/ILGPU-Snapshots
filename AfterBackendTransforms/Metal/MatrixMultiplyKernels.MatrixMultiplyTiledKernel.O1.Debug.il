; stage: AfterBackendTransforms  backend: Metal  opt: O1
; module: MatrixMultiplyTiledKernel  [intptr: i64]

%struct.0 = type { i64, i32 }

@g0 = internal global float zeroinitializer ; shared
@g1 = internal global float zeroinitializer ; shared

define void @MatrixMultiplyTiledKernel(%struct.0 %p0, i32 %p1, ptr<float> addrspace(global) %p2, i64 %p3, i64 %p4, i64 %p5, i32 %p6, ptr<float> addrspace(global) %p7, i64 %p8, i64 %p9, i64 %p10, i32 %p11, ptr<float> addrspace(global) %p12, i64 %p13, i64 %p14, i64 %p15, i32 %p16) {
entry:
  %0 = icmp sge i64 %p4, -2147483648
  %1 = icmp sle i64 %p4, 2147483647
  %2 = and i1 %0, %1
  %3 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %4 = icmp sge i64 %p5, -2147483648
  %5 = icmp sle i64 %p5, 2147483647
  %6 = and i1 %4, %5
  %7 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %8 = trunc i64 %p5 to i32
  %9 = icmp sge i64 %p14, -2147483648
  %10 = icmp sle i64 %p14, 2147483647
  %11 = and i1 %9, %10
  %12 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %13 = icmp sge i64 %p15, -2147483648
  %14 = icmp sle i64 %p15, 2147483647
  %15 = and i1 %13, %14
  %16 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %17 = extractvalue %struct.0 %p0, 0
  %18 = sext i32 %p1 to i64
  %19 = extractvalue %struct.0 %p0, 1
  %20 = sdiv i32 %19, 2
  %21 = trunc i64 %p14 to i32
  %22 = icmp sge i64 %p14, -2147483648
  %23 = icmp sle i64 %p14, 2147483647
  %24 = and i1 %22, %23
  %25 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %26 = icmp sge i64 %p15, -2147483648
  %27 = icmp sle i64 %p15, 2147483647
  %28 = and i1 %26, %27
  %29 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %30 = extractvalue %struct.0 %p0, 0
  %31 = sext i32 %p1 to i64
  %32 = extractvalue %struct.0 %p0, 1
  %33 = srem i32 %32, 2
  %34 = trunc i64 %p15 to i32
  %35 = icmp sge i64 %p14, -2147483648
  %36 = icmp sle i64 %p14, 2147483647
  %37 = and i1 %35, %36
  %38 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %39 = icmp sge i64 %p15, -2147483648
  %40 = icmp sle i64 %p15, 2147483647
  %41 = and i1 %39, %40
  %42 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %43 = trunc i64 %p14 to i32
  %44 = icmp eq i32 %43, 0
  %45 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %46 = trunc i64 %p15 to i32
  %47 = icmp eq i32 %46, 0
  %48 = call ptr @ilgpu.string("Y_index_out_of_bounds")
  %49 = icmp sge i32 %20, 0
  %50 = icmp slt i32 %20, 2
  %51 = and i1 %49, %50
  %52 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %53 = icmp sge i32 %33, 0
  %54 = icmp slt i32 %33, 2
  %55 = and i1 %53, %54
  %56 = call ptr @ilgpu.string("Y_index_out_of_bounds")
  %57 = icmp sge i64 %p4, -2147483648
  %58 = icmp sle i64 %p4, 2147483647
  %59 = and i1 %57, %58
  %60 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %61 = icmp sge i64 %p5, -2147483648
  %62 = icmp sle i64 %p5, 2147483647
  %63 = and i1 %61, %62
  %64 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %65 = trunc i64 %p4 to i32
  %66 = icmp eq i32 %65, 0
  %67 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %68 = trunc i64 %p5 to i32
  %69 = icmp eq i32 %68, 0
  %70 = call ptr @ilgpu.string("Y_index_out_of_bounds")
  %71 = shl i32 %33, 1
  %72 = add i32 %20, %71
  %73 = getelementptr float, ptr @g0, i32 %72
  %74 = icmp sge i32 %20, 0
  %75 = icmp slt i32 %20, 2
  %76 = and i1 %74, %75
  %77 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %78 = icmp sge i32 %33, 0
  %79 = icmp slt i32 %33, 2
  %80 = and i1 %78, %79
  %81 = call ptr @ilgpu.string("Y_index_out_of_bounds")
  %82 = icmp sge i64 %p9, -2147483648
  %83 = icmp sle i64 %p9, 2147483647
  %84 = and i1 %82, %83
  %85 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %86 = icmp sge i64 %p10, -2147483648
  %87 = icmp sle i64 %p10, 2147483647
  %88 = and i1 %86, %87
  %89 = call ptr @ilgpu.string("32_bit_index_out_of_range")
  %90 = trunc i64 %p9 to i32
  %91 = icmp eq i32 %90, 0
  %92 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %93 = trunc i64 %p10 to i32
  %94 = icmp eq i32 %93, 0
  %95 = call ptr @ilgpu.string("Y_index_out_of_bounds")
  %96 = shl i32 %33, 1
  %97 = add i32 %20, %96
  %98 = getelementptr float, ptr @g1, i32 %97
  %99 = icmp sge i32 %20, 0
  %100 = icmp slt i32 %20, 2
  %101 = and i1 %99, %100
  %102 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %103 = getelementptr float, ptr @g0, i32 %20
  %104 = icmp sge i32 %33, 0
  %105 = icmp slt i32 %33, 2
  %106 = and i1 %104, %105
  %107 = call ptr @ilgpu.string("Y_index_out_of_bounds")
  %108 = shl i32 %33, 1
  %109 = getelementptr float, ptr @g1, i32 %108
  %110 = icmp sge i32 %20, 0
  %111 = icmp slt i32 %20, 2
  %112 = and i1 %110, %111
  %113 = call ptr @ilgpu.string("X_index_out_of_bounds")
  %114 = add i32 %20, 2
  %115 = getelementptr float, ptr @g0, i32 %114
  %116 = icmp sge i32 %33, 0
  %117 = icmp slt i32 %33, 2
  %118 = and i1 %116, %117
  %119 = call ptr @ilgpu.string("Y_index_out_of_bounds")
  %120 = shl i32 %33, 1
  %121 = add i32 %120, 1
  %122 = getelementptr float, ptr @g1, i32 %121
  br label %bb1

bb1:
  br label %bb2

bb2:
  %123 = phi i32 [ 0, %bb1 ], [ %125, %bb11 ]
  %124 = phi float [ 0.0, %bb1 ], [ %195, %bb11 ]
  call void @ilgpu.debug.assert(i1 %2, ptr %3)
  call void @ilgpu.debug.assert(i1 %6, ptr %7)
  %125 = add i32 %123, 2
  %126 = icmp slt i32 %123, %8
  %127 = sdiv i64 %17, %18
  %128 = trunc i64 %127 to i32
  %129 = shl i32 %128, 1
  %130 = add i32 %129, %20
  %131 = icmp sge i32 %130, %21
  %132 = srem i64 %30, %31
  %133 = trunc i64 %132 to i32
  %134 = shl i32 %133, 1
  %135 = add i32 %134, %33
  %136 = icmp slt i32 %135, %34
  %137 = icmp sge i32 %130, 0
  %138 = icmp slt i32 %130, %43
  %139 = and i1 %137, %138
  %140 = icmp eq i32 %130, 0
  %141 = and i1 %140, %44
  %142 = or i1 %139, %141
  %143 = icmp sge i32 %135, 0
  %144 = icmp slt i32 %135, %46
  %145 = and i1 %143, %144
  %146 = icmp eq i32 %135, 0
  %147 = and i1 %146, %47
  %148 = or i1 %145, %147
  %149 = mul i32 %135, %p16
  %150 = add i32 %130, %149
  %151 = getelementptr float, ptr %p12, i32 %150
  %152 = icmp sge i32 %130, 0
  %153 = icmp slt i32 %130, %65
  %154 = and i1 %152, %153
  %155 = icmp eq i32 %130, 0
  %156 = and i1 %155, %66
  %157 = or i1 %154, %156
  %158 = add i32 %33, %123
  %159 = icmp sge i32 %158, 0
  %160 = icmp slt i32 %158, %68
  %161 = and i1 %159, %160
  %162 = icmp eq i32 %158, 0
  %163 = and i1 %162, %69
  %164 = or i1 %161, %163
  %165 = mul i32 %158, %p6
  %166 = add i32 %130, %165
  %167 = getelementptr float, ptr %p2, i32 %166
  %168 = add i32 %20, %123
  %169 = icmp sge i32 %168, 0
  %170 = icmp slt i32 %168, %90
  %171 = and i1 %169, %170
  %172 = icmp eq i32 %168, 0
  %173 = and i1 %172, %91
  %174 = or i1 %171, %173
  %175 = icmp sge i32 %135, 0
  %176 = icmp slt i32 %135, %93
  %177 = and i1 %175, %176
  %178 = icmp eq i32 %135, 0
  %179 = and i1 %178, %94
  %180 = or i1 %177, %179
  %181 = mul i32 %135, %p11
  %182 = add i32 %168, %181
  %183 = getelementptr float, ptr %p7, i32 %182
  br i1 %126, label %bb10, label %bb3

bb3:
  call void @ilgpu.debug.assert(i1 %11, ptr %12)
  call void @ilgpu.debug.assert(i1 %15, ptr %16)
  br i1 %131, label %bb6, label %bb4

bb4:
  call void @ilgpu.debug.assert(i1 %24, ptr %25)
  call void @ilgpu.debug.assert(i1 %28, ptr %29)
  br label %bb5

bb5:
  br label %bb7

bb6:
  br label %bb7

bb7:
  %184 = phi i1 [ %136, %bb5 ], [ false, %bb6 ]
  %185 = xor i1 %184, -1
  br i1 %185, label %bb9, label %bb8

bb8:
  call void @ilgpu.debug.assert(i1 %37, ptr %38)
  call void @ilgpu.debug.assert(i1 %41, ptr %42)
  call void @ilgpu.debug.assert(i1 %142, ptr %45)
  call void @ilgpu.debug.assert(i1 %148, ptr %48)
  store float %124, ptr %151
  br label %bb9

bb9:
  ret void

bb10:
  call void @ilgpu.debug.assert(i1 %51, ptr %52)
  call void @ilgpu.debug.assert(i1 %55, ptr %56)
  call void @ilgpu.debug.assert(i1 %59, ptr %60)
  call void @ilgpu.debug.assert(i1 %63, ptr %64)
  call void @ilgpu.debug.assert(i1 %157, ptr %67)
  call void @ilgpu.debug.assert(i1 %164, ptr %70)
  %186 = load float, ptr %167
  store float %186, ptr %73
  call void @ilgpu.debug.assert(i1 %76, ptr %77)
  call void @ilgpu.debug.assert(i1 %80, ptr %81)
  call void @ilgpu.debug.assert(i1 %84, ptr %85)
  call void @ilgpu.debug.assert(i1 %88, ptr %89)
  call void @ilgpu.debug.assert(i1 %174, ptr %92)
  call void @ilgpu.debug.assert(i1 %180, ptr %95)
  %187 = load float, ptr %183
  store float %187, ptr %98
  call void @ilgpu.barrier.group()
  call void @ilgpu.debug.assert(i1 %101, ptr %102)
  %188 = load float, ptr %103
  call void @ilgpu.debug.assert(i1 %106, ptr %107)
  %189 = load float, ptr %109
  call void @ilgpu.debug.assert(i1 %112, ptr %113)
  %190 = load float, ptr %115
  call void @ilgpu.debug.assert(i1 %118, ptr %119)
  %191 = fmul float %188, %189
  %192 = fadd float %124, %191
  br label %bb11

bb11:
  %193 = load float, ptr %122
  call void @ilgpu.barrier.group()
  %194 = fmul float %190, %193
  %195 = fadd float %192, %194
  br label %bb2

}

