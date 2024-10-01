; ModuleID = 'crcu32.c'
source_filename = "crcu32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local zeroext i16 @crcu32(i32 noundef %0, i16 noundef zeroext %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i16, align 2
  store i32 %0, ptr %3, align 4
  store i16 %1, ptr %4, align 2
  %5 = load i32, ptr %3, align 4
  %6 = trunc i32 %5 to i16
  %7 = load i16, ptr %4, align 2
  %8 = call zeroext i16 @crc16(i16 noundef signext %6, i16 noundef zeroext %7)
  store i16 %8, ptr %4, align 2
  %9 = load i32, ptr %3, align 4
  %10 = lshr i32 %9, 16
  %11 = trunc i32 %10 to i16
  %12 = load i16, ptr %4, align 2
  %13 = call zeroext i16 @crc16(i16 noundef signext %11, i16 noundef zeroext %12)
  store i16 %13, ptr %4, align 2
  %14 = load i16, ptr %4, align 2
  ret i16 %14
}

declare zeroext i16 @crc16(i16 noundef signext, i16 noundef zeroext) #1

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
