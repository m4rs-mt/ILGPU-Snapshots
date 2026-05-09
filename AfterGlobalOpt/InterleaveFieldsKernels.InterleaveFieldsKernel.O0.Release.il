; stage: AfterGlobalOpt  opt: O0
; module: InterleaveFieldsKernel  [intptr: i64]

%struct.0 = type { i32, i32, i32, i32 }
%struct.1 = type { i32, i32, i32, i32, i32, i32, i32, i32 }
%view.struct = view %struct.1
%struct.2 = type { %view.struct, i64, i8 }
%struct.3 = type { view<%struct.1>, i64, i8 }

define void @InterleaveFieldsKernel(i32 %p0, %struct.3 %p1) {
entry:
  %0 = alloca %struct.3, i32 1
  store %struct.3 %p1, ptr %0
  %1 = addrspacecast ptr %0 to ptr<%struct.3>
  %2 = call %view.struct @get_BaseView(ptr<%struct.3> %1)
  %3 = call i32 @ComputeLinearIndex(ptr<%struct.3> %1, i32 %p0)
  %4 = alloca i32, i32 1
  store i32 %p0, ptr %4
  %5 = addrspacecast ptr %4 to ptr<i32>
  %6 = call i32 @get_X(ptr<i32> %5)
  %7 = getelementptr %struct.1, ptr %2, i32 %3
  %8 = getelementptr inbounds %struct.1, ptr %7, i32 0, i32 0
  %9 = bitcast ptr %8 to ptr ; %struct.0 -> i32
  store i32 %6, ptr %9
  %10 = call %view.struct @get_BaseView(ptr<%struct.3> %1)
  %11 = call i32 @ComputeLinearIndex(ptr<%struct.3> %1, i32 %p0)
  %12 = alloca i32, i32 1
  store i32 0, ptr %12
  %13 = addrspacecast ptr %12 to ptr<i32>
  call void @.ctor(ptr<i32> %13, i32 1)
  %14 = load i32, ptr %12
  %15 = alloca i32, i32 1
  store i32 %p0, ptr %15
  %16 = alloca i32, i32 1
  store i32 %14, ptr %16
  %17 = alloca i32, i32 1
  %18 = addrspacecast ptr %15 to ptr<i32>
  %19 = call i32 @get_X(ptr<i32> %18)
  %20 = addrspacecast ptr %16 to ptr<i32>
  %21 = call i32 @get_X(ptr<i32> %20)
  store i32 0, ptr %17
  %22 = addrspacecast ptr %17 to ptr<i32>
  %23 = add i32 %19, %21
  call void @.ctor(ptr<i32> %22, i32 %23)
  %24 = load i32, ptr %17
  %25 = alloca i32, i32 1
  store i32 %24, ptr %25
  %26 = addrspacecast ptr %25 to ptr<i32>
  %27 = call i32 @get_X(ptr<i32> %26)
  %28 = getelementptr %struct.1, ptr %10, i32 %11
  %29 = getelementptr inbounds %struct.1, ptr %28, i32 0, i32 0
  %30 = bitcast ptr %29 to ptr ; %struct.0 -> i32
  %31 = getelementptr i32, ptr %30, i32 1
  store i32 %27, ptr %31
  %32 = call %view.struct @get_BaseView(ptr<%struct.3> %1)
  %33 = call i32 @ComputeLinearIndex(ptr<%struct.3> %1, i32 %p0)
  %34 = alloca i32, i32 1
  store i32 0, ptr %34
  %35 = addrspacecast ptr %34 to ptr<i32>
  call void @.ctor(ptr<i32> %35, i32 2)
  %36 = load i32, ptr %34
  %37 = alloca i32, i32 1
  store i32 %p0, ptr %37
  %38 = alloca i32, i32 1
  store i32 %36, ptr %38
  %39 = alloca i32, i32 1
  %40 = addrspacecast ptr %37 to ptr<i32>
  %41 = call i32 @get_X(ptr<i32> %40)
  %42 = addrspacecast ptr %38 to ptr<i32>
  %43 = call i32 @get_X(ptr<i32> %42)
  store i32 0, ptr %39
  %44 = addrspacecast ptr %39 to ptr<i32>
  %45 = add i32 %41, %43
  call void @.ctor(ptr<i32> %44, i32 %45)
  %46 = load i32, ptr %39
  %47 = alloca i32, i32 1
  store i32 %46, ptr %47
  %48 = addrspacecast ptr %47 to ptr<i32>
  %49 = call i32 @get_X(ptr<i32> %48)
  %50 = getelementptr %struct.1, ptr %32, i32 %33
  %51 = getelementptr inbounds %struct.1, ptr %50, i32 0, i32 0
  %52 = bitcast ptr %51 to ptr ; %struct.0 -> i32
  %53 = getelementptr i32, ptr %52, i32 2
  store i32 %49, ptr %53
  %54 = call %view.struct @get_BaseView(ptr<%struct.3> %1)
  %55 = call i32 @ComputeLinearIndex(ptr<%struct.3> %1, i32 %p0)
  %56 = alloca i32, i32 1
  store i32 0, ptr %56
  %57 = addrspacecast ptr %56 to ptr<i32>
  call void @.ctor(ptr<i32> %57, i32 3)
  %58 = load i32, ptr %56
  %59 = alloca i32, i32 1
  store i32 %p0, ptr %59
  %60 = alloca i32, i32 1
  store i32 %58, ptr %60
  %61 = alloca i32, i32 1
  %62 = addrspacecast ptr %59 to ptr<i32>
  %63 = call i32 @get_X(ptr<i32> %62)
  %64 = addrspacecast ptr %60 to ptr<i32>
  %65 = call i32 @get_X(ptr<i32> %64)
  store i32 0, ptr %61
  %66 = addrspacecast ptr %61 to ptr<i32>
  %67 = add i32 %63, %65
  call void @.ctor(ptr<i32> %66, i32 %67)
  %68 = load i32, ptr %61
  %69 = alloca i32, i32 1
  store i32 %68, ptr %69
  %70 = addrspacecast ptr %69 to ptr<i32>
  %71 = call i32 @get_X(ptr<i32> %70)
  %72 = getelementptr %struct.1, ptr %54, i32 %55
  %73 = getelementptr inbounds %struct.1, ptr %72, i32 0, i32 0
  %74 = bitcast ptr %73 to ptr ; %struct.0 -> i32
  %75 = getelementptr i32, ptr %74, i32 3
  store i32 %71, ptr %75
  %76 = call %view.struct @get_BaseView(ptr<%struct.3> %1)
  %77 = call i32 @ComputeLinearIndex(ptr<%struct.3> %1, i32 %p0)
  %78 = alloca i32, i32 1
  store i32 0, ptr %78
  %79 = addrspacecast ptr %78 to ptr<i32>
  call void @.ctor(ptr<i32> %79, i32 4)
  %80 = load i32, ptr %78
  %81 = alloca i32, i32 1
  store i32 %p0, ptr %81
  %82 = alloca i32, i32 1
  store i32 %80, ptr %82
  %83 = alloca i32, i32 1
  %84 = addrspacecast ptr %81 to ptr<i32>
  %85 = call i32 @get_X(ptr<i32> %84)
  %86 = addrspacecast ptr %82 to ptr<i32>
  %87 = call i32 @get_X(ptr<i32> %86)
  store i32 0, ptr %83
  %88 = addrspacecast ptr %83 to ptr<i32>
  %89 = add i32 %85, %87
  call void @.ctor(ptr<i32> %88, i32 %89)
  %90 = load i32, ptr %83
  %91 = alloca i32, i32 1
  store i32 %90, ptr %91
  %92 = addrspacecast ptr %91 to ptr<i32>
  %93 = call i32 @get_X(ptr<i32> %92)
  %94 = getelementptr %struct.1, ptr %76, i32 %77
  %95 = getelementptr inbounds %struct.1, ptr %94, i32 0, i32 4
  %96 = bitcast ptr %95 to ptr ; %struct.0 -> i32
  store i32 %93, ptr %96
  %97 = call %view.struct @get_BaseView(ptr<%struct.3> %1)
  %98 = call i32 @ComputeLinearIndex(ptr<%struct.3> %1, i32 %p0)
  %99 = alloca i32, i32 1
  store i32 0, ptr %99
  %100 = addrspacecast ptr %99 to ptr<i32>
  call void @.ctor(ptr<i32> %100, i32 5)
  %101 = load i32, ptr %99
  %102 = alloca i32, i32 1
  store i32 %p0, ptr %102
  %103 = alloca i32, i32 1
  store i32 %101, ptr %103
  %104 = alloca i32, i32 1
  %105 = addrspacecast ptr %102 to ptr<i32>
  %106 = call i32 @get_X(ptr<i32> %105)
  %107 = addrspacecast ptr %103 to ptr<i32>
  %108 = call i32 @get_X(ptr<i32> %107)
  store i32 0, ptr %104
  %109 = addrspacecast ptr %104 to ptr<i32>
  %110 = add i32 %106, %108
  call void @.ctor(ptr<i32> %109, i32 %110)
  %111 = load i32, ptr %104
  %112 = alloca i32, i32 1
  store i32 %111, ptr %112
  %113 = addrspacecast ptr %112 to ptr<i32>
  %114 = call i32 @get_X(ptr<i32> %113)
  %115 = getelementptr %struct.1, ptr %97, i32 %98
  %116 = getelementptr inbounds %struct.1, ptr %115, i32 0, i32 4
  %117 = bitcast ptr %116 to ptr ; %struct.0 -> i32
  %118 = getelementptr i32, ptr %117, i32 1
  store i32 %114, ptr %118
  %119 = call %view.struct @get_BaseView(ptr<%struct.3> %1)
  %120 = call i32 @ComputeLinearIndex(ptr<%struct.3> %1, i32 %p0)
  %121 = alloca i32, i32 1
  store i32 0, ptr %121
  %122 = addrspacecast ptr %121 to ptr<i32>
  call void @.ctor(ptr<i32> %122, i32 6)
  %123 = load i32, ptr %121
  %124 = alloca i32, i32 1
  store i32 %p0, ptr %124
  %125 = alloca i32, i32 1
  store i32 %123, ptr %125
  %126 = alloca i32, i32 1
  %127 = addrspacecast ptr %124 to ptr<i32>
  %128 = call i32 @get_X(ptr<i32> %127)
  %129 = addrspacecast ptr %125 to ptr<i32>
  %130 = call i32 @get_X(ptr<i32> %129)
  store i32 0, ptr %126
  %131 = addrspacecast ptr %126 to ptr<i32>
  %132 = add i32 %128, %130
  call void @.ctor(ptr<i32> %131, i32 %132)
  %133 = load i32, ptr %126
  %134 = alloca i32, i32 1
  store i32 %133, ptr %134
  %135 = addrspacecast ptr %134 to ptr<i32>
  %136 = call i32 @get_X(ptr<i32> %135)
  %137 = getelementptr %struct.1, ptr %119, i32 %120
  %138 = getelementptr inbounds %struct.1, ptr %137, i32 0, i32 4
  %139 = bitcast ptr %138 to ptr ; %struct.0 -> i32
  %140 = getelementptr i32, ptr %139, i32 2
  store i32 %136, ptr %140
  %141 = call %view.struct @get_BaseView(ptr<%struct.3> %1)
  %142 = call i32 @ComputeLinearIndex(ptr<%struct.3> %1, i32 %p0)
  %143 = alloca i32, i32 1
  store i32 0, ptr %143
  %144 = addrspacecast ptr %143 to ptr<i32>
  call void @.ctor(ptr<i32> %144, i32 7)
  %145 = load i32, ptr %143
  %146 = alloca i32, i32 1
  store i32 %p0, ptr %146
  %147 = alloca i32, i32 1
  store i32 %145, ptr %147
  %148 = alloca i32, i32 1
  %149 = addrspacecast ptr %146 to ptr<i32>
  %150 = call i32 @get_X(ptr<i32> %149)
  %151 = addrspacecast ptr %147 to ptr<i32>
  %152 = call i32 @get_X(ptr<i32> %151)
  store i32 0, ptr %148
  %153 = addrspacecast ptr %148 to ptr<i32>
  %154 = add i32 %150, %152
  call void @.ctor(ptr<i32> %153, i32 %154)
  %155 = load i32, ptr %148
  %156 = alloca i32, i32 1
  store i32 %155, ptr %156
  %157 = addrspacecast ptr %156 to ptr<i32>
  %158 = call i32 @get_X(ptr<i32> %157)
  %159 = getelementptr %struct.1, ptr %141, i32 %142
  %160 = getelementptr inbounds %struct.1, ptr %159, i32 0, i32 4
  %161 = bitcast ptr %160 to ptr ; %struct.0 -> i32
  %162 = getelementptr i32, ptr %161, i32 3
  store i32 %158, ptr %162
  ret void

}

define void @.ctor(ptr<i32> %p0, i32 %p1) {
entry:
  store i32 %p1, ptr %p0
  ret void

}

define i32 @ComputeLinearIndex(ptr<%struct.2> %p0, i32 %p1) {
entry:
  %0 = getelementptr inbounds %struct.2, ptr %p0, i32 0, i32 2
  %1 = load i8, ptr %0
  %2 = alloca i64, i32 1
  store i64 0, ptr %2
  %3 = call i64 @get_Extent(ptr<%struct.2> %p0)
  store i64 %3, ptr %2
  %4 = addrspacecast ptr %2 to ptr<i64>
  %5 = call i32 @ToIntIndex(ptr<i64> %4)
  %6 = call i32 @ComputeElementIndexChecked(i8 %1, i32 %p1, i32 %5)
  ret i32 %6

}

define i32 @ComputeElementIndexChecked(i8 %p0, i32 %p1, i32 %p2) {
entry:
  %0 = alloca i8, i32 1
  store i8 %p0, ptr %0
  %1 = alloca i32, i32 1
  store i32 %p1, ptr %1
  %2 = addrspacecast ptr %1 to ptr<i32>
  %3 = call i32 @get_X(ptr<i32> %2)
  %4 = addrspacecast ptr %0 to ptr<i8>
  %5 = call i32 @get_XStride(ptr<i8> %4)
  %6 = mul i32 %3, %5
  ret i32 %6

}

define i32 @get_XStride(ptr<i8> %p0) {
entry:
  ret i32 1

}

define i32 @get_X(ptr<i32> %p0) {
entry:
  %0 = load i32, ptr %p0
  ret i32 %0

}

define i32 @ToIntIndex(ptr<i64> %p0) {
entry:
  %0 = load i64, ptr %p0
  %1 = load i64, ptr %p0
  %2 = trunc i64 %1 to i32
  ret i32 %2

}

define i64 @get_Extent(ptr<%struct.2> %p0) {
entry:
  %0 = getelementptr inbounds %struct.2, ptr %p0, i32 0, i32 1
  %1 = load i64, ptr %0
  ret i64 %1

}

define %view.struct @get_BaseView(ptr<%struct.2> %p0) {
entry:
  %0 = getelementptr inbounds %struct.2, ptr %p0, i32 0, i32 0
  %1 = load %view.struct, ptr %0
  ret %view.struct %1

}

