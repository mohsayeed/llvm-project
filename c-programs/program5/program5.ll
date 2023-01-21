; ModuleID = '/home/cs19btech11004/llvm-project/c-programs/program5/program5.c'
source_filename = "/home/cs19btech11004/llvm-project/c-programs/program5/program5.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@top = dso_local global i32 -1, align 4
@.str = private unnamed_addr constant [23 x i8] c"Error: Stack overflow\0A\00", align 1
@stack = dso_local global [100 x i32] zeroinitializer, align 16
@.str.1 = private unnamed_addr constant [20 x i8] c"%d pushed to stack\0A\00", align 1
@.str.2 = private unnamed_addr constant [24 x i8] c"Error: Stack underflow\0A\00", align 1
@.str.3 = private unnamed_addr constant [22 x i8] c"%d popped from stack\0A\00", align 1
@.str.4 = private unnamed_addr constant [8 x i8] c"Stack: \00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @push(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* @top, align 4
  %4 = icmp eq i32 %3, 99
  br i1 %4, label %5, label %7

5:                                                ; preds = %1
  %6 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i64 0, i64 0))
  br label %15

7:                                                ; preds = %1
  %8 = load i32, i32* %2, align 4
  %9 = load i32, i32* @top, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, i32* @top, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [100 x i32], [100 x i32]* @stack, i64 0, i64 %11
  store i32 %8, i32* %12, align 4
  %13 = load i32, i32* %2, align 4
  %14 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([20 x i8], [20 x i8]* @.str.1, i64 0, i64 0), i32 noundef %13)
  br label %15

15:                                               ; preds = %7, %5
  ret void
}

declare dso_local i32 @printf(i8* noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @pop() #0 {
  %1 = alloca i32, align 4
  %2 = load i32, i32* @top, align 4
  %3 = icmp eq i32 %2, -1
  br i1 %3, label %4, label %6

4:                                                ; preds = %0
  %5 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([24 x i8], [24 x i8]* @.str.2, i64 0, i64 0))
  store i32 -1, i32* %1, align 4
  br label %17

6:                                                ; preds = %0
  %7 = load i32, i32* @top, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [100 x i32], [100 x i32]* @stack, i64 0, i64 %8
  %10 = load i32, i32* %9, align 4
  %11 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([22 x i8], [22 x i8]* @.str.3, i64 0, i64 0), i32 noundef %10)
  %12 = load i32, i32* @top, align 4
  %13 = add nsw i32 %12, -1
  store i32 %13, i32* @top, align 4
  %14 = sext i32 %12 to i64
  %15 = getelementptr inbounds [100 x i32], [100 x i32]* @stack, i64 0, i64 %14
  %16 = load i32, i32* %15, align 4
  store i32 %16, i32* %1, align 4
  br label %17

17:                                               ; preds = %6, %4
  %18 = load i32, i32* %1, align 4
  ret i32 %18
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @print_stack() #0 {
  %1 = alloca i32, align 4
  %2 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0))
  store i32 0, i32* %1, align 4
  br label %3

3:                                                ; preds = %13, %0
  %4 = load i32, i32* %1, align 4
  %5 = load i32, i32* @top, align 4
  %6 = icmp sle i32 %4, %5
  br i1 %6, label %7, label %16

7:                                                ; preds = %3
  %8 = load i32, i32* %1, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [100 x i32], [100 x i32]* @stack, i64 0, i64 %9
  %11 = load i32, i32* %10, align 4
  %12 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), i32 noundef %11)
  br label %13

13:                                               ; preds = %7
  %14 = load i32, i32* %1, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, i32* %1, align 4
  br label %3, !llvm.loop !4

16:                                               ; preds = %3
  %17 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i64 0, i64 0))
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @push(i32 noundef 3)
  call void @push(i32 noundef 5)
  call void @push(i32 noundef 7)
  call void @print_stack()
  %2 = call i32 @pop()
  call void @print_stack()
  ret i32 0
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 1}
!2 = !{i32 7, !"frame-pointer", i32 2}
!3 = !{!"clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)"}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.mustprogress"}
