; ModuleID = '/home/cs19btech11004/llvm-project/c-programs/program2/program2.c'
source_filename = "/home/cs19btech11004/llvm-project/c-programs/program2/program2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.MyClass = type { i32, i32, {}* }

@.str = private unnamed_addr constant [14 x i8] c"x: %d, y: %d\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @myMethod(%struct.MyClass* noundef %0) #0 {
  %2 = alloca %struct.MyClass*, align 8
  store %struct.MyClass* %0, %struct.MyClass** %2, align 8
  %3 = load %struct.MyClass*, %struct.MyClass** %2, align 8
  %4 = getelementptr inbounds %struct.MyClass, %struct.MyClass* %3, i32 0, i32 0
  %5 = load i32, i32* %4, align 8
  %6 = load %struct.MyClass*, %struct.MyClass** %2, align 8
  %7 = getelementptr inbounds %struct.MyClass, %struct.MyClass* %6, i32 0, i32 1
  %8 = load i32, i32* %7, align 4
  %9 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i64 0, i64 0), i32 noundef %5, i32 noundef %8)
  ret void
}

declare dso_local i32 @printf(i8* noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.MyClass, align 8
  store i32 0, i32* %1, align 4
  %3 = getelementptr inbounds %struct.MyClass, %struct.MyClass* %2, i32 0, i32 0
  store i32 5, i32* %3, align 8
  %4 = getelementptr inbounds %struct.MyClass, %struct.MyClass* %2, i32 0, i32 1
  store i32 10, i32* %4, align 4
  %5 = getelementptr inbounds %struct.MyClass, %struct.MyClass* %2, i32 0, i32 2
  %6 = bitcast {}** %5 to void (%struct.MyClass*)**
  store void (%struct.MyClass*)* @myMethod, void (%struct.MyClass*)** %6, align 8
  %7 = getelementptr inbounds %struct.MyClass, %struct.MyClass* %2, i32 0, i32 2
  %8 = bitcast {}** %7 to void (%struct.MyClass*)**
  %9 = load void (%struct.MyClass*)*, void (%struct.MyClass*)** %8, align 8
  call void %9(%struct.MyClass* noundef %2)
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
