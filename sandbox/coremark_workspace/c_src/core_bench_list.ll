; ModuleID = 'core_bench_list.c'
source_filename = "core_bench_list.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.list_data_s = type { i16, i16 }
%struct.RESULTS_S = type { i16, i16, i16, [4 x ptr], i32, i32, i32, ptr, %struct.MAT_PARAMS_S, i16, i16, i16, i16, i16, %struct.CORE_PORTABLE_S }
%struct.MAT_PARAMS_S = type { i32, ptr, ptr, ptr }
%struct.CORE_PORTABLE_S = type { i8 }
%struct.list_head_s = type { ptr, ptr }

; Function Attrs: noinline nounwind optnone uwtable
define dso_local zeroext i16 @core_bench_list(ptr noundef %0, i16 noundef signext %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i16, align 2
  %5 = alloca i16, align 2
  %6 = alloca i16, align 2
  %7 = alloca i16, align 2
  %8 = alloca ptr, align 8
  %9 = alloca i16, align 2
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca %struct.list_data_s, align 2
  %14 = alloca i16, align 2
  store ptr %0, ptr %3, align 8
  store i16 %1, ptr %4, align 2
  store i16 0, ptr %5, align 2
  store i16 0, ptr %6, align 2
  store i16 0, ptr %7, align 2
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds %struct.RESULTS_S, ptr %15, i32 0, i32 7
  %17 = load ptr, ptr %16, align 8
  store ptr %17, ptr %8, align 8
  %18 = load ptr, ptr %3, align 8
  %19 = getelementptr inbounds %struct.RESULTS_S, ptr %18, i32 0, i32 2
  %20 = load i16, ptr %19, align 4
  store i16 %20, ptr %9, align 2
  call void @llvm.memset.p0.i64(ptr align 2 %13, i8 0, i64 4, i1 false)
  %21 = load i16, ptr %4, align 2
  %22 = getelementptr inbounds %struct.list_data_s, ptr %13, i32 0, i32 1
  store i16 %21, ptr %22, align 2
  store i16 0, ptr %14, align 2
  br label %23

23:                                               ; preds = %115, %2
  %24 = load i16, ptr %14, align 2
  %25 = sext i16 %24 to i32
  %26 = load i16, ptr %9, align 2
  %27 = sext i16 %26 to i32
  %28 = icmp slt i32 %25, %27
  br i1 %28, label %29, label %118

29:                                               ; preds = %23
  %30 = load i16, ptr %14, align 2
  %31 = sext i16 %30 to i32
  %32 = and i32 %31, 255
  %33 = trunc i32 %32 to i16
  %34 = getelementptr inbounds %struct.list_data_s, ptr %13, i32 0, i32 0
  store i16 %33, ptr %34, align 2
  %35 = load ptr, ptr %8, align 8
  %36 = call ptr @core_list_find(ptr noundef %35, ptr noundef %13)
  store ptr %36, ptr %10, align 8
  %37 = load ptr, ptr %8, align 8
  %38 = call ptr @core_list_reverse(ptr noundef %37)
  store ptr %38, ptr %8, align 8
  %39 = load ptr, ptr %10, align 8
  %40 = icmp eq ptr %39, null
  br i1 %40, label %41, label %58

41:                                               ; preds = %29
  %42 = load i16, ptr %7, align 2
  %43 = add i16 %42, 1
  store i16 %43, ptr %7, align 2
  %44 = load ptr, ptr %8, align 8
  %45 = getelementptr inbounds %struct.list_head_s, ptr %44, i32 0, i32 0
  %46 = load ptr, ptr %45, align 8
  %47 = getelementptr inbounds %struct.list_head_s, ptr %46, i32 0, i32 1
  %48 = load ptr, ptr %47, align 8
  %49 = getelementptr inbounds %struct.list_data_s, ptr %48, i32 0, i32 0
  %50 = load i16, ptr %49, align 2
  %51 = sext i16 %50 to i32
  %52 = ashr i32 %51, 8
  %53 = and i32 %52, 1
  %54 = load i16, ptr %5, align 2
  %55 = zext i16 %54 to i32
  %56 = add nsw i32 %55, %53
  %57 = trunc i32 %56 to i16
  store i16 %57, ptr %5, align 2
  br label %105

58:                                               ; preds = %29
  %59 = load i16, ptr %6, align 2
  %60 = add i16 %59, 1
  store i16 %60, ptr %6, align 2
  %61 = load ptr, ptr %10, align 8
  %62 = getelementptr inbounds %struct.list_head_s, ptr %61, i32 0, i32 1
  %63 = load ptr, ptr %62, align 8
  %64 = getelementptr inbounds %struct.list_data_s, ptr %63, i32 0, i32 0
  %65 = load i16, ptr %64, align 2
  %66 = sext i16 %65 to i32
  %67 = and i32 %66, 1
  %68 = icmp ne i32 %67, 0
  br i1 %68, label %69, label %82

69:                                               ; preds = %58
  %70 = load ptr, ptr %10, align 8
  %71 = getelementptr inbounds %struct.list_head_s, ptr %70, i32 0, i32 1
  %72 = load ptr, ptr %71, align 8
  %73 = getelementptr inbounds %struct.list_data_s, ptr %72, i32 0, i32 0
  %74 = load i16, ptr %73, align 2
  %75 = sext i16 %74 to i32
  %76 = ashr i32 %75, 9
  %77 = and i32 %76, 1
  %78 = load i16, ptr %5, align 2
  %79 = zext i16 %78 to i32
  %80 = add nsw i32 %79, %77
  %81 = trunc i32 %80 to i16
  store i16 %81, ptr %5, align 2
  br label %82

82:                                               ; preds = %69, %58
  %83 = load ptr, ptr %10, align 8
  %84 = getelementptr inbounds %struct.list_head_s, ptr %83, i32 0, i32 0
  %85 = load ptr, ptr %84, align 8
  %86 = icmp ne ptr %85, null
  br i1 %86, label %87, label %104

87:                                               ; preds = %82
  %88 = load ptr, ptr %10, align 8
  %89 = getelementptr inbounds %struct.list_head_s, ptr %88, i32 0, i32 0
  %90 = load ptr, ptr %89, align 8
  store ptr %90, ptr %11, align 8
  %91 = load ptr, ptr %11, align 8
  %92 = getelementptr inbounds %struct.list_head_s, ptr %91, i32 0, i32 0
  %93 = load ptr, ptr %92, align 8
  %94 = load ptr, ptr %10, align 8
  %95 = getelementptr inbounds %struct.list_head_s, ptr %94, i32 0, i32 0
  store ptr %93, ptr %95, align 8
  %96 = load ptr, ptr %8, align 8
  %97 = getelementptr inbounds %struct.list_head_s, ptr %96, i32 0, i32 0
  %98 = load ptr, ptr %97, align 8
  %99 = load ptr, ptr %11, align 8
  %100 = getelementptr inbounds %struct.list_head_s, ptr %99, i32 0, i32 0
  store ptr %98, ptr %100, align 8
  %101 = load ptr, ptr %11, align 8
  %102 = load ptr, ptr %8, align 8
  %103 = getelementptr inbounds %struct.list_head_s, ptr %102, i32 0, i32 0
  store ptr %101, ptr %103, align 8
  br label %104

104:                                              ; preds = %87, %82
  br label %105

105:                                              ; preds = %104, %41
  %106 = getelementptr inbounds %struct.list_data_s, ptr %13, i32 0, i32 1
  %107 = load i16, ptr %106, align 2
  %108 = sext i16 %107 to i32
  %109 = icmp sge i32 %108, 0
  br i1 %109, label %110, label %114

110:                                              ; preds = %105
  %111 = getelementptr inbounds %struct.list_data_s, ptr %13, i32 0, i32 1
  %112 = load i16, ptr %111, align 2
  %113 = add i16 %112, 1
  store i16 %113, ptr %111, align 2
  br label %114

114:                                              ; preds = %110, %105
  br label %115

115:                                              ; preds = %114
  %116 = load i16, ptr %14, align 2
  %117 = add i16 %116, 1
  store i16 %117, ptr %14, align 2
  br label %23, !llvm.loop !6

118:                                              ; preds = %23
  %119 = load i16, ptr %6, align 2
  %120 = zext i16 %119 to i32
  %121 = mul nsw i32 %120, 4
  %122 = load i16, ptr %7, align 2
  %123 = zext i16 %122 to i32
  %124 = sub nsw i32 %121, %123
  %125 = load i16, ptr %5, align 2
  %126 = zext i16 %125 to i32
  %127 = add nsw i32 %126, %124
  %128 = trunc i32 %127 to i16
  store i16 %128, ptr %5, align 2
  %129 = load i16, ptr %4, align 2
  %130 = sext i16 %129 to i32
  %131 = icmp sgt i32 %130, 0
  br i1 %131, label %132, label %136

132:                                              ; preds = %118
  %133 = load ptr, ptr %8, align 8
  %134 = load ptr, ptr %3, align 8
  %135 = call ptr @core_list_mergesort(ptr noundef %133, ptr noundef @cmp_complex, ptr noundef %134)
  store ptr %135, ptr %8, align 8
  br label %136

136:                                              ; preds = %132, %118
  %137 = load ptr, ptr %8, align 8
  %138 = getelementptr inbounds %struct.list_head_s, ptr %137, i32 0, i32 0
  %139 = load ptr, ptr %138, align 8
  %140 = call ptr @core_list_remove(ptr noundef %139)
  store ptr %140, ptr %12, align 8
  %141 = load ptr, ptr %8, align 8
  %142 = call ptr @core_list_find(ptr noundef %141, ptr noundef %13)
  store ptr %142, ptr %11, align 8
  %143 = load ptr, ptr %11, align 8
  %144 = icmp ne ptr %143, null
  br i1 %144, label %149, label %145

145:                                              ; preds = %136
  %146 = load ptr, ptr %8, align 8
  %147 = getelementptr inbounds %struct.list_head_s, ptr %146, i32 0, i32 0
  %148 = load ptr, ptr %147, align 8
  store ptr %148, ptr %11, align 8
  br label %149

149:                                              ; preds = %145, %136
  br label %150

150:                                              ; preds = %153, %149
  %151 = load ptr, ptr %11, align 8
  %152 = icmp ne ptr %151, null
  br i1 %152, label %153, label %164

153:                                              ; preds = %150
  %154 = load ptr, ptr %8, align 8
  %155 = getelementptr inbounds %struct.list_head_s, ptr %154, i32 0, i32 1
  %156 = load ptr, ptr %155, align 8
  %157 = getelementptr inbounds %struct.list_data_s, ptr %156, i32 0, i32 0
  %158 = load i16, ptr %157, align 2
  %159 = load i16, ptr %5, align 2
  %160 = call zeroext i16 @crc16(i16 noundef signext %158, i16 noundef zeroext %159)
  store i16 %160, ptr %5, align 2
  %161 = load ptr, ptr %11, align 8
  %162 = getelementptr inbounds %struct.list_head_s, ptr %161, i32 0, i32 0
  %163 = load ptr, ptr %162, align 8
  store ptr %163, ptr %11, align 8
  br label %150, !llvm.loop !8

164:                                              ; preds = %150
  %165 = load ptr, ptr %12, align 8
  %166 = load ptr, ptr %8, align 8
  %167 = getelementptr inbounds %struct.list_head_s, ptr %166, i32 0, i32 0
  %168 = load ptr, ptr %167, align 8
  %169 = call ptr @core_list_undo_remove(ptr noundef %165, ptr noundef %168)
  store ptr %169, ptr %12, align 8
  %170 = load ptr, ptr %8, align 8
  %171 = call ptr @core_list_mergesort(ptr noundef %170, ptr noundef @cmp_idx, ptr noundef null)
  store ptr %171, ptr %8, align 8
  %172 = load ptr, ptr %8, align 8
  %173 = getelementptr inbounds %struct.list_head_s, ptr %172, i32 0, i32 0
  %174 = load ptr, ptr %173, align 8
  store ptr %174, ptr %11, align 8
  br label %175

175:                                              ; preds = %178, %164
  %176 = load ptr, ptr %11, align 8
  %177 = icmp ne ptr %176, null
  br i1 %177, label %178, label %189

178:                                              ; preds = %175
  %179 = load ptr, ptr %8, align 8
  %180 = getelementptr inbounds %struct.list_head_s, ptr %179, i32 0, i32 1
  %181 = load ptr, ptr %180, align 8
  %182 = getelementptr inbounds %struct.list_data_s, ptr %181, i32 0, i32 0
  %183 = load i16, ptr %182, align 2
  %184 = load i16, ptr %5, align 2
  %185 = call zeroext i16 @crc16(i16 noundef signext %183, i16 noundef zeroext %184)
  store i16 %185, ptr %5, align 2
  %186 = load ptr, ptr %11, align 8
  %187 = getelementptr inbounds %struct.list_head_s, ptr %186, i32 0, i32 0
  %188 = load ptr, ptr %187, align 8
  store ptr %188, ptr %11, align 8
  br label %175, !llvm.loop !9

189:                                              ; preds = %175
  %190 = load i16, ptr %5, align 2
  ret i16 %190
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #1

declare ptr @core_list_find(ptr noundef, ptr noundef) #2

declare ptr @core_list_reverse(ptr noundef) #2

declare ptr @core_list_mergesort(ptr noundef, ptr noundef, ptr noundef) #2

declare i32 @cmp_complex(ptr noundef, ptr noundef, ptr noundef) #2

declare ptr @core_list_remove(ptr noundef) #2

declare zeroext i16 @crc16(i16 noundef signext, i16 noundef zeroext) #2

declare ptr @core_list_undo_remove(ptr noundef, ptr noundef) #2

declare i32 @cmp_idx(ptr noundef, ptr noundef, ptr noundef) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

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
!9 = distinct !{!9, !7}
