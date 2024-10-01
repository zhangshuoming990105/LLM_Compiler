; ModuleID = 'copy_info.c'
source_filename = "copy_info.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.list_data_s = type { i16, i16 }

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @copy_info(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr inbounds %struct.list_data_s, ptr %5, i32 0, i32 0
  %7 = load i16, ptr %6, align 2
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds %struct.list_data_s, ptr %8, i32 0, i32 0
  store i16 %7, ptr %9, align 2
  %10 = load ptr, ptr %4, align 8
  %11 = getelementptr inbounds %struct.list_data_s, ptr %10, i32 0, i32 1
  %12 = load i16, ptr %11, align 2
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds %struct.list_data_s, ptr %13, i32 0, i32 1
  store i16 %12, ptr %14, align 2
  ret void
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
