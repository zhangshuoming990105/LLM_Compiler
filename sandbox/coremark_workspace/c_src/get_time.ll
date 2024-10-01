; ModuleID = 'get_time.c'
source_filename = "get_time.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.timespec = type { i64, i64 }

@stop_time_val = external global %struct.timespec, align 8
@start_time_val = external global %struct.timespec, align 8

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @get_time() #0 {
  %1 = alloca i64, align 8
  %2 = load i64, ptr @stop_time_val, align 8
  %3 = load i64, ptr @start_time_val, align 8
  %4 = sub nsw i64 %2, %3
  %5 = mul nsw i64 %4, 1000
  %6 = load i64, ptr getelementptr inbounds (%struct.timespec, ptr @stop_time_val, i32 0, i32 1), align 8
  %7 = load i64, ptr getelementptr inbounds (%struct.timespec, ptr @start_time_val, i32 0, i32 1), align 8
  %8 = sub nsw i64 %6, %7
  %9 = sdiv i64 %8, 1000000
  %10 = add nsw i64 %5, %9
  store i64 %10, ptr %1, align 8
  %11 = load i64, ptr %1, align 8
  ret i64 %11
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
