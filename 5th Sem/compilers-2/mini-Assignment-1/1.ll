; ModuleID = 'hello.c'
source_filename = "hello.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Node = type { i32, %struct.Node*, %struct.Node* }

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local void @delete_DLL(%struct.Node**) #0 {
  %2 = alloca %struct.Node**, align 8
  %3 = alloca %struct.Node*, align 8
  %4 = alloca %struct.Node*, align 8
  store %struct.Node** %0, %struct.Node*** %2, align 8
  %5 = load %struct.Node**, %struct.Node*** %2, align 8
  %6 = load %struct.Node*, %struct.Node** %5, align 8
  store %struct.Node* %6, %struct.Node** %3, align 8
  br label %7

; <label>:7:                                      ; preds = %10, %1
  %8 = load %struct.Node*, %struct.Node** %3, align 8
  %9 = icmp ne %struct.Node* %8, null
  br i1 %9, label %10, label %17

; <label>:10:                                     ; preds = %7
  %11 = load %struct.Node*, %struct.Node** %3, align 8
  %12 = getelementptr inbounds %struct.Node, %struct.Node* %11, i32 0, i32 1
  %13 = load %struct.Node*, %struct.Node** %12, align 8
  store %struct.Node* %13, %struct.Node** %4, align 8
  %14 = load %struct.Node*, %struct.Node** %3, align 8
  %15 = bitcast %struct.Node* %14 to i8*
  call void @free(i8* %15) #3
  %16 = load %struct.Node*, %struct.Node** %4, align 8
  store %struct.Node* %16, %struct.Node** %3, align 8
  br label %7

; <label>:17:                                     ; preds = %7
  %18 = load %struct.Node**, %struct.Node*** %2, align 8
  store %struct.Node* null, %struct.Node** %18, align 8
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local void @push(%struct.Node**, i32) #0 {
  %3 = alloca %struct.Node**, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.Node*, align 8
  store %struct.Node** %0, %struct.Node*** %3, align 8
  store i32 %1, i32* %4, align 4
  %6 = call noalias i8* @malloc(i64 24) #3
  %7 = bitcast i8* %6 to %struct.Node*
  store %struct.Node* %7, %struct.Node** %5, align 8
  %8 = load i32, i32* %4, align 4
  %9 = load %struct.Node*, %struct.Node** %5, align 8
  %10 = getelementptr inbounds %struct.Node, %struct.Node* %9, i32 0, i32 0
  store i32 %8, i32* %10, align 8
  %11 = load %struct.Node**, %struct.Node*** %3, align 8
  %12 = load %struct.Node*, %struct.Node** %11, align 8
  %13 = load %struct.Node*, %struct.Node** %5, align 8
  %14 = getelementptr inbounds %struct.Node, %struct.Node* %13, i32 0, i32 1
  store %struct.Node* %12, %struct.Node** %14, align 8
  %15 = load %struct.Node*, %struct.Node** %5, align 8
  %16 = getelementptr inbounds %struct.Node, %struct.Node* %15, i32 0, i32 2
  store %struct.Node* null, %struct.Node** %16, align 8
  %17 = load %struct.Node**, %struct.Node*** %3, align 8
  %18 = load %struct.Node*, %struct.Node** %17, align 8
  %19 = icmp ne %struct.Node* %18, null
  br i1 %19, label %20, label %25

; <label>:20:                                     ; preds = %2
  %21 = load %struct.Node*, %struct.Node** %5, align 8
  %22 = load %struct.Node**, %struct.Node*** %3, align 8
  %23 = load %struct.Node*, %struct.Node** %22, align 8
  %24 = getelementptr inbounds %struct.Node, %struct.Node* %23, i32 0, i32 2
  store %struct.Node* %21, %struct.Node** %24, align 8
  br label %25

; <label>:25:                                     ; preds = %20, %2
  %26 = load %struct.Node*, %struct.Node** %5, align 8
  %27 = load %struct.Node**, %struct.Node*** %3, align 8
  store %struct.Node* %26, %struct.Node** %27, align 8
  ret void
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local void @append(%struct.Node**, i32) #0 {
  %3 = alloca %struct.Node**, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.Node*, align 8
  %6 = alloca %struct.Node*, align 8
  store %struct.Node** %0, %struct.Node*** %3, align 8
  store i32 %1, i32* %4, align 4
  %7 = call noalias i8* @malloc(i64 24) #3
  %8 = bitcast i8* %7 to %struct.Node*
  store %struct.Node* %8, %struct.Node** %5, align 8
  %9 = load i32, i32* %4, align 4
  %10 = load %struct.Node*, %struct.Node** %5, align 8
  %11 = getelementptr inbounds %struct.Node, %struct.Node* %10, i32 0, i32 0
  store i32 %9, i32* %11, align 8
  %12 = load %struct.Node*, %struct.Node** %5, align 8
  %13 = getelementptr inbounds %struct.Node, %struct.Node* %12, i32 0, i32 1
  store %struct.Node* null, %struct.Node** %13, align 8
  %14 = load %struct.Node**, %struct.Node*** %3, align 8
  %15 = load %struct.Node*, %struct.Node** %14, align 8
  %16 = icmp eq %struct.Node* %15, null
  br i1 %16, label %17, label %22

; <label>:17:                                     ; preds = %2
  %18 = load %struct.Node*, %struct.Node** %5, align 8
  %19 = getelementptr inbounds %struct.Node, %struct.Node* %18, i32 0, i32 2
  store %struct.Node* null, %struct.Node** %19, align 8
  %20 = load %struct.Node*, %struct.Node** %5, align 8
  %21 = load %struct.Node**, %struct.Node*** %3, align 8
  store %struct.Node* %20, %struct.Node** %21, align 8
  br label %41

; <label>:22:                                     ; preds = %2
  %23 = load %struct.Node**, %struct.Node*** %3, align 8
  %24 = load %struct.Node*, %struct.Node** %23, align 8
  store %struct.Node* %24, %struct.Node** %6, align 8
  br label %25

; <label>:25:                                     ; preds = %30, %22
  %26 = load %struct.Node*, %struct.Node** %6, align 8
  %27 = getelementptr inbounds %struct.Node, %struct.Node* %26, i32 0, i32 1
  %28 = load %struct.Node*, %struct.Node** %27, align 8
  %29 = icmp ne %struct.Node* %28, null
  br i1 %29, label %30, label %34

; <label>:30:                                     ; preds = %25
  %31 = load %struct.Node*, %struct.Node** %6, align 8
  %32 = getelementptr inbounds %struct.Node, %struct.Node* %31, i32 0, i32 1
  %33 = load %struct.Node*, %struct.Node** %32, align 8
  store %struct.Node* %33, %struct.Node** %6, align 8
  br label %25

; <label>:34:                                     ; preds = %25
  %35 = load %struct.Node*, %struct.Node** %5, align 8
  %36 = load %struct.Node*, %struct.Node** %6, align 8
  %37 = getelementptr inbounds %struct.Node, %struct.Node* %36, i32 0, i32 1
  store %struct.Node* %35, %struct.Node** %37, align 8
  %38 = load %struct.Node*, %struct.Node** %6, align 8
  %39 = load %struct.Node*, %struct.Node** %5, align 8
  %40 = getelementptr inbounds %struct.Node, %struct.Node* %39, i32 0, i32 2
  store %struct.Node* %38, %struct.Node** %40, align 8
  br label %41

; <label>:41:                                     ; preds = %34, %17
  ret void
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local void @print_DLL(%struct.Node**) #0 {
  %2 = alloca %struct.Node**, align 8
  %3 = alloca %struct.Node*, align 8
  store %struct.Node** %0, %struct.Node*** %2, align 8
  %4 = load %struct.Node**, %struct.Node*** %2, align 8
  %5 = load %struct.Node*, %struct.Node** %4, align 8
  store %struct.Node* %5, %struct.Node** %3, align 8
  br label %6

; <label>:6:                                      ; preds = %19, %1
  %7 = load %struct.Node*, %struct.Node** %3, align 8
  %8 = icmp ne %struct.Node* %7, null
  br i1 %8, label %9, label %20

; <label>:9:                                      ; preds = %6
  %10 = load %struct.Node*, %struct.Node** %3, align 8
  %11 = getelementptr inbounds %struct.Node, %struct.Node* %10, i32 0, i32 0
  %12 = load i32, i32* %11, align 8
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %18

; <label>:14:                                     ; preds = %9
  %15 = load %struct.Node*, %struct.Node** %3, align 8
  %16 = getelementptr inbounds %struct.Node, %struct.Node* %15, i32 0, i32 1
  %17 = load %struct.Node*, %struct.Node** %16, align 8
  store %struct.Node* %17, %struct.Node** %3, align 8
  br label %19

; <label>:18:                                     ; preds = %9
  br label %20

; <label>:19:                                     ; preds = %14
  br label %6

; <label>:20:                                     ; preds = %18, %6
  br label %21

; <label>:21:                                     ; preds = %24, %20
  %22 = load %struct.Node*, %struct.Node** %3, align 8
  %23 = icmp ne %struct.Node* %22, null
  br i1 %23, label %24, label %32

; <label>:24:                                     ; preds = %21
  %25 = load %struct.Node*, %struct.Node** %3, align 8
  %26 = getelementptr inbounds %struct.Node, %struct.Node* %25, i32 0, i32 0
  %27 = load i32, i32* %26, align 8
  %28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), i32 %27)
  %29 = load %struct.Node*, %struct.Node** %3, align 8
  %30 = getelementptr inbounds %struct.Node, %struct.Node* %29, i32 0, i32 1
  %31 = load %struct.Node*, %struct.Node** %30, align 8
  store %struct.Node* %31, %struct.Node** %3, align 8
  br label %21

; <label>:32:                                     ; preds = %21
  %33 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0))
  ret void
}

declare i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local void @equalize_length(%struct.Node**, %struct.Node**, i32, i32) #0 {
  %5 = alloca %struct.Node**, align 8
  %6 = alloca %struct.Node**, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store %struct.Node** %0, %struct.Node*** %5, align 8
  store %struct.Node** %1, %struct.Node*** %6, align 8
  store i32 %2, i32* %7, align 4
  store i32 %3, i32* %8, align 4
  %11 = load i32, i32* %7, align 4
  %12 = load i32, i32* %8, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %27

; <label>:14:                                     ; preds = %4
  %15 = load i32, i32* %8, align 4
  %16 = load i32, i32* %7, align 4
  %17 = sub nsw i32 %15, %16
  store i32 %17, i32* %9, align 4
  br label %18

; <label>:18:                                     ; preds = %23, %14
  %19 = load i32, i32* %9, align 4
  %20 = icmp sgt i32 %19, 0
  br i1 %20, label %21, label %26

; <label>:21:                                     ; preds = %18
  %22 = load %struct.Node**, %struct.Node*** %5, align 8
  call void @push(%struct.Node** %22, i32 0)
  br label %23

; <label>:23:                                     ; preds = %21
  %24 = load i32, i32* %9, align 4
  %25 = add nsw i32 %24, -1
  store i32 %25, i32* %9, align 4
  br label %18

; <label>:26:                                     ; preds = %18
  br label %45

; <label>:27:                                     ; preds = %4
  %28 = load i32, i32* %8, align 4
  %29 = load i32, i32* %7, align 4
  %30 = icmp slt i32 %28, %29
  br i1 %30, label %31, label %44

; <label>:31:                                     ; preds = %27
  %32 = load i32, i32* %7, align 4
  %33 = load i32, i32* %8, align 4
  %34 = sub nsw i32 %32, %33
  store i32 %34, i32* %10, align 4
  br label %35

; <label>:35:                                     ; preds = %40, %31
  %36 = load i32, i32* %10, align 4
  %37 = icmp sgt i32 %36, 0
  br i1 %37, label %38, label %43

; <label>:38:                                     ; preds = %35
  %39 = load %struct.Node**, %struct.Node*** %6, align 8
  call void @push(%struct.Node** %39, i32 0)
  br label %40

; <label>:40:                                     ; preds = %38
  %41 = load i32, i32* %10, align 4
  %42 = add nsw i32 %41, -1
  store i32 %42, i32* %10, align 4
  br label %35

; <label>:43:                                     ; preds = %35
  br label %44

; <label>:44:                                     ; preds = %43, %27
  br label %45

; <label>:45:                                     ; preds = %44, %26
  ret void
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local void @add(%struct.Node**, %struct.Node**, i32, i32) #0 {
  %5 = alloca %struct.Node**, align 8
  %6 = alloca %struct.Node**, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca %struct.Node*, align 8
  %10 = alloca %struct.Node*, align 8
  %11 = alloca %struct.Node*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store %struct.Node** %0, %struct.Node*** %5, align 8
  store %struct.Node** %1, %struct.Node*** %6, align 8
  store i32 %2, i32* %7, align 4
  store i32 %3, i32* %8, align 4
  %14 = load %struct.Node**, %struct.Node*** %5, align 8
  %15 = load %struct.Node**, %struct.Node*** %6, align 8
  %16 = load i32, i32* %7, align 4
  %17 = load i32, i32* %8, align 4
  call void @equalize_length(%struct.Node** %14, %struct.Node** %15, i32 %16, i32 %17)
  store %struct.Node* null, %struct.Node** %9, align 8
  %18 = load %struct.Node**, %struct.Node*** %5, align 8
  %19 = load %struct.Node*, %struct.Node** %18, align 8
  store %struct.Node* %19, %struct.Node** %10, align 8
  %20 = load %struct.Node**, %struct.Node*** %6, align 8
  %21 = load %struct.Node*, %struct.Node** %20, align 8
  store %struct.Node* %21, %struct.Node** %11, align 8
  br label %22

; <label>:22:                                     ; preds = %27, %4
  %23 = load %struct.Node*, %struct.Node** %10, align 8
  %24 = getelementptr inbounds %struct.Node, %struct.Node* %23, i32 0, i32 1
  %25 = load %struct.Node*, %struct.Node** %24, align 8
  %26 = icmp ne %struct.Node* %25, null
  br i1 %26, label %27, label %34

; <label>:27:                                     ; preds = %22
  %28 = load %struct.Node*, %struct.Node** %10, align 8
  %29 = getelementptr inbounds %struct.Node, %struct.Node* %28, i32 0, i32 1
  %30 = load %struct.Node*, %struct.Node** %29, align 8
  store %struct.Node* %30, %struct.Node** %10, align 8
  %31 = load %struct.Node*, %struct.Node** %11, align 8
  %32 = getelementptr inbounds %struct.Node, %struct.Node* %31, i32 0, i32 1
  %33 = load %struct.Node*, %struct.Node** %32, align 8
  store %struct.Node* %33, %struct.Node** %11, align 8
  br label %22

; <label>:34:                                     ; preds = %22
  store i32 0, i32* %12, align 4
  store i32 0, i32* %13, align 4
  br label %35

; <label>:35:                                     ; preds = %54, %34
  %36 = load %struct.Node*, %struct.Node** %10, align 8
  %37 = icmp ne %struct.Node* %36, null
  br i1 %37, label %38, label %62

; <label>:38:                                     ; preds = %35
  %39 = load %struct.Node*, %struct.Node** %10, align 8
  %40 = getelementptr inbounds %struct.Node, %struct.Node* %39, i32 0, i32 0
  %41 = load i32, i32* %40, align 8
  %42 = load %struct.Node*, %struct.Node** %11, align 8
  %43 = getelementptr inbounds %struct.Node, %struct.Node* %42, i32 0, i32 0
  %44 = load i32, i32* %43, align 8
  %45 = add nsw i32 %41, %44
  %46 = load i32, i32* %12, align 4
  %47 = add nsw i32 %45, %46
  store i32 %47, i32* %13, align 4
  %48 = load i32, i32* %13, align 4
  %49 = icmp sgt i32 %48, 9
  br i1 %49, label %50, label %53

; <label>:50:                                     ; preds = %38
  %51 = load i32, i32* %13, align 4
  %52 = sub nsw i32 %51, 10
  store i32 %52, i32* %13, align 4
  store i32 1, i32* %12, align 4
  br label %54

; <label>:53:                                     ; preds = %38
  store i32 0, i32* %12, align 4
  br label %54

; <label>:54:                                     ; preds = %53, %50
  %55 = load i32, i32* %13, align 4
  call void @push(%struct.Node** %9, i32 %55)
  %56 = load %struct.Node*, %struct.Node** %10, align 8
  %57 = getelementptr inbounds %struct.Node, %struct.Node* %56, i32 0, i32 2
  %58 = load %struct.Node*, %struct.Node** %57, align 8
  store %struct.Node* %58, %struct.Node** %10, align 8
  %59 = load %struct.Node*, %struct.Node** %11, align 8
  %60 = getelementptr inbounds %struct.Node, %struct.Node* %59, i32 0, i32 2
  %61 = load %struct.Node*, %struct.Node** %60, align 8
  store %struct.Node* %61, %struct.Node** %11, align 8
  br label %35

; <label>:62:                                     ; preds = %35
  %63 = load i32, i32* %12, align 4
  %64 = icmp eq i32 %63, 1
  br i1 %64, label %65, label %66

; <label>:65:                                     ; preds = %62
  call void @push(%struct.Node** %9, i32 1)
  br label %66

; <label>:66:                                     ; preds = %65, %62
  call void @print_DLL(%struct.Node** %9)
  call void @delete_DLL(%struct.Node** %9)
  ret void
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca %struct.Node*, align 8
  %7 = alloca %struct.Node*, align 8
  store i32 0, i32* %1, align 4
  store i32 0, i32* %2, align 4
  store i32 0, i32* %3, align 4
  store i32 0, i32* %4, align 4
  store %struct.Node* null, %struct.Node** %6, align 8
  store %struct.Node* null, %struct.Node** %7, align 8
  br label %8

; <label>:8:                                      ; preds = %36, %0
  %9 = call i32 @getchar()
  store i32 %9, i32* %5, align 4
  %10 = icmp ne i32 %9, -1
  br i1 %10, label %11, label %37

; <label>:11:                                     ; preds = %8
  %12 = load i32, i32* %5, align 4
  %13 = icmp eq i32 %12, 10
  br i1 %13, label %14, label %17

; <label>:14:                                     ; preds = %11
  %15 = load i32, i32* %3, align 4
  %16 = load i32, i32* %4, align 4
  call void @add(%struct.Node** %6, %struct.Node** %7, i32 %15, i32 %16)
  call void @delete_DLL(%struct.Node** %6)
  call void @delete_DLL(%struct.Node** %7)
  store i32 0, i32* %2, align 4
  store i32 0, i32* %3, align 4
  store i32 0, i32* %4, align 4
  br label %36

; <label>:17:                                     ; preds = %11
  %18 = load i32, i32* %5, align 4
  %19 = icmp eq i32 %18, 32
  br i1 %19, label %20, label %21

; <label>:20:                                     ; preds = %17
  store i32 1, i32* %2, align 4
  br label %35

; <label>:21:                                     ; preds = %17
  %22 = load i32, i32* %2, align 4
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %29

; <label>:24:                                     ; preds = %21
  %25 = load i32, i32* %5, align 4
  %26 = sub nsw i32 %25, 48
  call void @append(%struct.Node** %6, i32 %26)
  %27 = load i32, i32* %3, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, i32* %3, align 4
  br label %34

; <label>:29:                                     ; preds = %21
  %30 = load i32, i32* %5, align 4
  %31 = sub nsw i32 %30, 48
  call void @append(%struct.Node** %7, i32 %31)
  %32 = load i32, i32* %4, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, i32* %4, align 4
  br label %34

; <label>:34:                                     ; preds = %29, %24
  br label %35

; <label>:35:                                     ; preds = %34, %20
  br label %36

; <label>:36:                                     ; preds = %35, %14
  br label %8

; <label>:37:                                     ; preds = %8
  call void @delete_DLL(%struct.Node** %6)
  call void @delete_DLL(%struct.Node** %7)
  ret i32 0
}

declare i32 @getchar() #2

attributes #0 = { noinline nounwind optnone sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{!"clang version 8.0.0 (tags/RELEASE_800/final)"}
