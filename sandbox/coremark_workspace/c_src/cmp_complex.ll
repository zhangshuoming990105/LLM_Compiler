; ModuleID = 'cmp_complex.c'
source_filename = "cmp_complex.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.list_data_s = type { i16, i16 }

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @cmp_complex(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i16, align 2
  %8 = alloca i16, align 2
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %9 = load ptr, ptr %4, align 8
  %10 = getelementptr inbounds %struct.list_data_s, ptr %9, i32 0, i32 0
  %11 = load ptr, ptr %6, align 8
  %12 = call signext i16 @calc_func(ptr noundef %10, ptr noundef %11)
  store i16 %12, ptr %7, align 2
  %13 = load ptr, ptr %5, align 8
  %14 = getelementptr inbounds %struct.list_data_s, ptr %13, i32 0, i32 0
  %15 = load ptr, ptr %6, align 8
  %16 = call signext i16 @calc_func(ptr noundef %14, ptr noundef %15)
  store i16 %16, ptr %8, align 2
  %17 = load i16, ptr %7, align 2
  %18 = sext i16 %17 to i32
  %19 = load i16, ptr %8, align 2
  %20 = sext i16 %19 to i32
  %21 = sub nsw i32 %18, %20
  ret i32 %21
}

declare signext i16 @calc_func(ptr noundef, ptr noundef) #1

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
