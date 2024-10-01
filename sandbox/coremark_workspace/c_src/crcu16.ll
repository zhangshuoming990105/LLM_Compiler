; ModuleID = 'crcu16.c'
source_filename = "crcu16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local zeroext i16 @crcu16(i16 noundef zeroext %0, i16 noundef zeroext %1) #0 {
  %3 = alloca i16, align 2
  %4 = alloca i16, align 2
  store i16 %0, ptr %3, align 2
  store i16 %1, ptr %4, align 2
  %5 = load i16, ptr %3, align 2
  %6 = trunc i16 %5 to i8
  %7 = load i16, ptr %4, align 2
  %8 = call zeroext i16 @crcu8(i8 noundef zeroext %6, i16 noundef zeroext %7)
  store i16 %8, ptr %4, align 2
  %9 = load i16, ptr %3, align 2
  %10 = zext i16 %9 to i32
  %11 = ashr i32 %10, 8
  %12 = trunc i32 %11 to i8
  %13 = load i16, ptr %4, align 2
  %14 = call zeroext i16 @crcu8(i8 noundef zeroext %12, i16 noundef zeroext %13)
  store i16 %14, ptr %4, align 2
  %15 = load i16, ptr %4, align 2
  ret i16 %15
}

declare zeroext i16 @crcu8(i8 noundef zeroext, i16 noundef zeroext) #1

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
