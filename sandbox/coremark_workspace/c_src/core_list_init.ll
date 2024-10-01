; ModuleID = 'core_list_init.c'
source_filename = "core_list_init.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.list_data_s = type { i16, i16 }
%struct.list_head_s = type { ptr, ptr }

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @core_list_init(i32 noundef %0, ptr noundef %1, i16 noundef signext %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i16, align 2
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca %struct.list_data_s, align 2
  %16 = alloca i16, align 2
  %17 = alloca i16, align 2
  %18 = alloca i16, align 2
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store i16 %2, ptr %6, align 2
  store i32 20, ptr %7, align 4
  %19 = load i32, ptr %4, align 4
  %20 = load i32, ptr %7, align 4
  %21 = udiv i32 %19, %20
  %22 = sub i32 %21, 2
  store i32 %22, ptr %8, align 4
  %23 = load ptr, ptr %5, align 8
  %24 = load i32, ptr %8, align 4
  %25 = zext i32 %24 to i64
  %26 = getelementptr inbounds %struct.list_head_s, ptr %23, i64 %25
  store ptr %26, ptr %9, align 8
  %27 = load ptr, ptr %9, align 8
  store ptr %27, ptr %10, align 8
  %28 = load ptr, ptr %10, align 8
  %29 = load i32, ptr %8, align 4
  %30 = zext i32 %29 to i64
  %31 = getelementptr inbounds %struct.list_data_s, ptr %28, i64 %30
  store ptr %31, ptr %11, align 8
  %32 = load ptr, ptr %5, align 8
  store ptr %32, ptr %14, align 8
  %33 = load ptr, ptr %14, align 8
  %34 = getelementptr inbounds %struct.list_head_s, ptr %33, i32 0, i32 0
  store ptr null, ptr %34, align 8
  %35 = load ptr, ptr %10, align 8
  %36 = load ptr, ptr %14, align 8
  %37 = getelementptr inbounds %struct.list_head_s, ptr %36, i32 0, i32 1
  store ptr %35, ptr %37, align 8
  %38 = load ptr, ptr %14, align 8
  %39 = getelementptr inbounds %struct.list_head_s, ptr %38, i32 0, i32 1
  %40 = load ptr, ptr %39, align 8
  %41 = getelementptr inbounds %struct.list_data_s, ptr %40, i32 0, i32 1
  store i16 0, ptr %41, align 2
  %42 = load ptr, ptr %14, align 8
  %43 = getelementptr inbounds %struct.list_head_s, ptr %42, i32 0, i32 1
  %44 = load ptr, ptr %43, align 8
  %45 = getelementptr inbounds %struct.list_data_s, ptr %44, i32 0, i32 0
  store i16 -32640, ptr %45, align 2
  %46 = load ptr, ptr %5, align 8
  %47 = getelementptr inbounds %struct.list_head_s, ptr %46, i32 1
  store ptr %47, ptr %5, align 8
  %48 = load ptr, ptr %10, align 8
  %49 = getelementptr inbounds %struct.list_data_s, ptr %48, i32 1
  store ptr %49, ptr %10, align 8
  %50 = getelementptr inbounds %struct.list_data_s, ptr %15, i32 0, i32 1
  store i16 32767, ptr %50, align 2
  %51 = getelementptr inbounds %struct.list_data_s, ptr %15, i32 0, i32 0
  store i16 -1, ptr %51, align 2
  %52 = load ptr, ptr %14, align 8
  %53 = load ptr, ptr %9, align 8
  %54 = load ptr, ptr %11, align 8
  %55 = call ptr @core_list_insert_new(ptr noundef %52, ptr noundef %15, ptr noundef %5, ptr noundef %10, ptr noundef %53, ptr noundef %54)
  store i32 0, ptr %12, align 4
  br label %56

56:                                               ; preds = %88, %3
  %57 = load i32, ptr %12, align 4
  %58 = load i32, ptr %8, align 4
  %59 = icmp ult i32 %57, %58
  br i1 %59, label %60, label %91

60:                                               ; preds = %56
  %61 = load i16, ptr %6, align 2
  %62 = sext i16 %61 to i32
  %63 = load i32, ptr %12, align 4
  %64 = xor i32 %62, %63
  %65 = trunc i32 %64 to i16
  %66 = zext i16 %65 to i32
  %67 = and i32 %66, 15
  %68 = trunc i32 %67 to i16
  store i16 %68, ptr %16, align 2
  %69 = load i16, ptr %16, align 2
  %70 = zext i16 %69 to i32
  %71 = shl i32 %70, 3
  %72 = load i32, ptr %12, align 4
  %73 = and i32 %72, 7
  %74 = or i32 %71, %73
  %75 = trunc i32 %74 to i16
  store i16 %75, ptr %17, align 2
  %76 = load i16, ptr %17, align 2
  %77 = zext i16 %76 to i32
  %78 = shl i32 %77, 8
  %79 = load i16, ptr %17, align 2
  %80 = zext i16 %79 to i32
  %81 = or i32 %78, %80
  %82 = trunc i32 %81 to i16
  %83 = getelementptr inbounds %struct.list_data_s, ptr %15, i32 0, i32 0
  store i16 %82, ptr %83, align 2
  %84 = load ptr, ptr %14, align 8
  %85 = load ptr, ptr %9, align 8
  %86 = load ptr, ptr %11, align 8
  %87 = call ptr @core_list_insert_new(ptr noundef %84, ptr noundef %15, ptr noundef %5, ptr noundef %10, ptr noundef %85, ptr noundef %86)
  br label %88

88:                                               ; preds = %60
  %89 = load i32, ptr %12, align 4
  %90 = add i32 %89, 1
  store i32 %90, ptr %12, align 4
  br label %56, !llvm.loop !6

91:                                               ; preds = %56
  %92 = load ptr, ptr %14, align 8
  %93 = getelementptr inbounds %struct.list_head_s, ptr %92, i32 0, i32 0
  %94 = load ptr, ptr %93, align 8
  store ptr %94, ptr %13, align 8
  store i32 1, ptr %12, align 4
  br label %95

95:                                               ; preds = %132, %91
  %96 = load ptr, ptr %13, align 8
  %97 = getelementptr inbounds %struct.list_head_s, ptr %96, i32 0, i32 0
  %98 = load ptr, ptr %97, align 8
  %99 = icmp ne ptr %98, null
  br i1 %99, label %100, label %136

100:                                              ; preds = %95
  %101 = load i32, ptr %12, align 4
  %102 = load i32, ptr %8, align 4
  %103 = udiv i32 %102, 5
  %104 = icmp ult i32 %101, %103
  br i1 %104, label %105, label %113

105:                                              ; preds = %100
  %106 = load i32, ptr %12, align 4
  %107 = add i32 %106, 1
  store i32 %107, ptr %12, align 4
  %108 = trunc i32 %106 to i16
  %109 = load ptr, ptr %13, align 8
  %110 = getelementptr inbounds %struct.list_head_s, ptr %109, i32 0, i32 1
  %111 = load ptr, ptr %110, align 8
  %112 = getelementptr inbounds %struct.list_data_s, ptr %111, i32 0, i32 1
  store i16 %108, ptr %112, align 2
  br label %132

113:                                              ; preds = %100
  %114 = load i32, ptr %12, align 4
  %115 = add i32 %114, 1
  store i32 %115, ptr %12, align 4
  %116 = load i16, ptr %6, align 2
  %117 = sext i16 %116 to i32
  %118 = xor i32 %114, %117
  %119 = trunc i32 %118 to i16
  store i16 %119, ptr %18, align 2
  %120 = load i32, ptr %12, align 4
  %121 = and i32 %120, 7
  %122 = shl i32 %121, 8
  %123 = load i16, ptr %18, align 2
  %124 = zext i16 %123 to i32
  %125 = or i32 %122, %124
  %126 = and i32 16383, %125
  %127 = trunc i32 %126 to i16
  %128 = load ptr, ptr %13, align 8
  %129 = getelementptr inbounds %struct.list_head_s, ptr %128, i32 0, i32 1
  %130 = load ptr, ptr %129, align 8
  %131 = getelementptr inbounds %struct.list_data_s, ptr %130, i32 0, i32 1
  store i16 %127, ptr %131, align 2
  br label %132

132:                                              ; preds = %113, %105
  %133 = load ptr, ptr %13, align 8
  %134 = getelementptr inbounds %struct.list_head_s, ptr %133, i32 0, i32 0
  %135 = load ptr, ptr %134, align 8
  store ptr %135, ptr %13, align 8
  br label %95, !llvm.loop !8

136:                                              ; preds = %95
  %137 = load ptr, ptr %14, align 8
  %138 = call ptr @core_list_mergesort(ptr noundef %137, ptr noundef @cmp_idx, ptr noundef null)
  store ptr %138, ptr %14, align 8
  %139 = load ptr, ptr %14, align 8
  ret ptr %139
}

declare ptr @core_list_insert_new(ptr noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef) #1

declare ptr @core_list_mergesort(ptr noundef, ptr noundef, ptr noundef) #1

declare i32 @cmp_idx(ptr noundef, ptr noundef, ptr noundef) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
