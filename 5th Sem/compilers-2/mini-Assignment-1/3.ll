; ModuleID = 'hello.cpp'
source_filename = "hello.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }
%"class.std::basic_ostream" = type { i32 (...)**, %"class.std::basic_ios" }
%"class.std::basic_ios" = type { %"class.std::ios_base", %"class.std::basic_ostream"*, i8, i8, %"class.std::basic_streambuf"*, %"class.std::ctype"*, %"class.std::num_put"*, %"class.std::num_get"* }
%"class.std::ios_base" = type { i32 (...)**, i64, i64, i32, i32, i32, %"struct.std::ios_base::_Callback_list"*, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, %"struct.std::ios_base::_Words"*, %"class.std::locale" }
%"struct.std::ios_base::_Callback_list" = type { %"struct.std::ios_base::_Callback_list"*, void (i32, %"class.std::ios_base"*, i32)*, i32, i32 }
%"struct.std::ios_base::_Words" = type { i8*, i64 }
%"class.std::locale" = type { %"class.std::locale::_Impl"* }
%"class.std::locale::_Impl" = type { i32, %"class.std::locale::facet"**, i64, %"class.std::locale::facet"**, i8** }
%"class.std::locale::facet" = type <{ i32 (...)**, i32, [4 x i8] }>
%"class.std::basic_streambuf" = type { i32 (...)**, i8*, i8*, i8*, i8*, i8*, i8*, %"class.std::locale" }
%"class.std::ctype" = type <{ %"class.std::locale::facet.base", [4 x i8], %struct.__locale_struct*, i8, [7 x i8], i32*, i32*, i16*, i8, [256 x i8], [256 x i8], i8, [6 x i8] }>
%"class.std::locale::facet.base" = type <{ i32 (...)**, i32 }>
%struct.__locale_struct = type { [13 x %struct.__locale_data*], i16*, i32*, i32*, [13 x i8*] }
%struct.__locale_data = type opaque
%"class.std::num_put" = type { %"class.std::locale::facet.base", [4 x i8] }
%"class.std::num_get" = type { %"class.std::locale::facet.base", [4 x i8] }
%struct.Tree = type { i64, %struct.Tree*, %struct.Tree*, %struct.Tree* }
%"class.std::__cxx11::basic_string" = type { %"struct.std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Alloc_hider", i64, %union.anon }
%"struct.std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Alloc_hider" = type { i8* }
%union.anon = type { i64, [8 x i8] }

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external hidden global i8
@_ZSt4cout = external global %"class.std::basic_ostream", align 8
@.str = private unnamed_addr constant [3 x i8] c"-1\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"Nil \00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"Nil\00", align 1
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_hello.cpp, i8* null }]

; Function Attrs: noinline sspstrong uwtable
define internal void @__cxx_global_var_init() #0 section ".text.startup" {
  call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* @_ZStL8__ioinit)
  %1 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i32 0, i32 0), i8* @__dso_handle) #3
  ret void
}

declare void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"*) unnamed_addr #1

; Function Attrs: nounwind
declare void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"*) unnamed_addr #2

; Function Attrs: nounwind
declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #3

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local %struct.Tree* @_Z7newNodex(i64) #4 {
  %2 = alloca i64, align 8
  %3 = alloca %struct.Tree*, align 8
  store i64 %0, i64* %2, align 8
  %4 = call noalias i8* @malloc(i64 32) #3
  %5 = bitcast i8* %4 to %struct.Tree*
  store %struct.Tree* %5, %struct.Tree** %3, align 8
  %6 = load i64, i64* %2, align 8
  %7 = load %struct.Tree*, %struct.Tree** %3, align 8
  %8 = getelementptr inbounds %struct.Tree, %struct.Tree* %7, i32 0, i32 0
  store i64 %6, i64* %8, align 8
  %9 = load %struct.Tree*, %struct.Tree** %3, align 8
  %10 = getelementptr inbounds %struct.Tree, %struct.Tree* %9, i32 0, i32 1
  store %struct.Tree* null, %struct.Tree** %10, align 8
  %11 = load %struct.Tree*, %struct.Tree** %3, align 8
  %12 = getelementptr inbounds %struct.Tree, %struct.Tree* %11, i32 0, i32 2
  store %struct.Tree* null, %struct.Tree** %12, align 8
  %13 = load %struct.Tree*, %struct.Tree** %3, align 8
  %14 = getelementptr inbounds %struct.Tree, %struct.Tree* %13, i32 0, i32 3
  store %struct.Tree* null, %struct.Tree** %14, align 8
  %15 = load %struct.Tree*, %struct.Tree** %3, align 8
  ret %struct.Tree* %15
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: noinline optnone sspstrong uwtable
define dso_local %struct.Tree* @_Z6insertRP4Treex(%struct.Tree** dereferenceable(8), i64) #5 {
  %3 = alloca %struct.Tree*, align 8
  %4 = alloca %struct.Tree**, align 8
  %5 = alloca i64, align 8
  store %struct.Tree** %0, %struct.Tree*** %4, align 8
  store i64 %1, i64* %5, align 8
  %6 = load %struct.Tree**, %struct.Tree*** %4, align 8
  %7 = load %struct.Tree*, %struct.Tree** %6, align 8
  %8 = icmp eq %struct.Tree* %7, null
  br i1 %8, label %9, label %12

; <label>:9:                                      ; preds = %2
  %10 = load i64, i64* %5, align 8
  %11 = call %struct.Tree* @_Z7newNodex(i64 %10)
  store %struct.Tree* %11, %struct.Tree** %3, align 8
  br label %62

; <label>:12:                                     ; preds = %2
  %13 = load i64, i64* %5, align 8
  %14 = load %struct.Tree**, %struct.Tree*** %4, align 8
  %15 = load %struct.Tree*, %struct.Tree** %14, align 8
  %16 = getelementptr inbounds %struct.Tree, %struct.Tree* %15, i32 0, i32 0
  %17 = load i64, i64* %16, align 8
  %18 = icmp slt i64 %13, %17
  br i1 %18, label %19, label %35

; <label>:19:                                     ; preds = %12
  %20 = load %struct.Tree**, %struct.Tree*** %4, align 8
  %21 = load %struct.Tree*, %struct.Tree** %20, align 8
  %22 = getelementptr inbounds %struct.Tree, %struct.Tree* %21, i32 0, i32 1
  %23 = load i64, i64* %5, align 8
  %24 = call %struct.Tree* @_Z6insertRP4Treex(%struct.Tree** dereferenceable(8) %22, i64 %23)
  %25 = load %struct.Tree**, %struct.Tree*** %4, align 8
  %26 = load %struct.Tree*, %struct.Tree** %25, align 8
  %27 = getelementptr inbounds %struct.Tree, %struct.Tree* %26, i32 0, i32 1
  store %struct.Tree* %24, %struct.Tree** %27, align 8
  %28 = load %struct.Tree**, %struct.Tree*** %4, align 8
  %29 = load %struct.Tree*, %struct.Tree** %28, align 8
  %30 = load %struct.Tree**, %struct.Tree*** %4, align 8
  %31 = load %struct.Tree*, %struct.Tree** %30, align 8
  %32 = getelementptr inbounds %struct.Tree, %struct.Tree* %31, i32 0, i32 1
  %33 = load %struct.Tree*, %struct.Tree** %32, align 8
  %34 = getelementptr inbounds %struct.Tree, %struct.Tree* %33, i32 0, i32 3
  store %struct.Tree* %29, %struct.Tree** %34, align 8
  br label %59

; <label>:35:                                     ; preds = %12
  %36 = load i64, i64* %5, align 8
  %37 = load %struct.Tree**, %struct.Tree*** %4, align 8
  %38 = load %struct.Tree*, %struct.Tree** %37, align 8
  %39 = getelementptr inbounds %struct.Tree, %struct.Tree* %38, i32 0, i32 0
  %40 = load i64, i64* %39, align 8
  %41 = icmp sgt i64 %36, %40
  br i1 %41, label %42, label %58

; <label>:42:                                     ; preds = %35
  %43 = load %struct.Tree**, %struct.Tree*** %4, align 8
  %44 = load %struct.Tree*, %struct.Tree** %43, align 8
  %45 = getelementptr inbounds %struct.Tree, %struct.Tree* %44, i32 0, i32 2
  %46 = load i64, i64* %5, align 8
  %47 = call %struct.Tree* @_Z6insertRP4Treex(%struct.Tree** dereferenceable(8) %45, i64 %46)
  %48 = load %struct.Tree**, %struct.Tree*** %4, align 8
  %49 = load %struct.Tree*, %struct.Tree** %48, align 8
  %50 = getelementptr inbounds %struct.Tree, %struct.Tree* %49, i32 0, i32 2
  store %struct.Tree* %47, %struct.Tree** %50, align 8
  %51 = load %struct.Tree**, %struct.Tree*** %4, align 8
  %52 = load %struct.Tree*, %struct.Tree** %51, align 8
  %53 = load %struct.Tree**, %struct.Tree*** %4, align 8
  %54 = load %struct.Tree*, %struct.Tree** %53, align 8
  %55 = getelementptr inbounds %struct.Tree, %struct.Tree* %54, i32 0, i32 2
  %56 = load %struct.Tree*, %struct.Tree** %55, align 8
  %57 = getelementptr inbounds %struct.Tree, %struct.Tree* %56, i32 0, i32 3
  store %struct.Tree* %52, %struct.Tree** %57, align 8
  br label %58

; <label>:58:                                     ; preds = %42, %35
  br label %59

; <label>:59:                                     ; preds = %58, %19
  %60 = load %struct.Tree**, %struct.Tree*** %4, align 8
  %61 = load %struct.Tree*, %struct.Tree** %60, align 8
  store %struct.Tree* %61, %struct.Tree** %3, align 8
  br label %62

; <label>:62:                                     ; preds = %59, %9
  %63 = load %struct.Tree*, %struct.Tree** %3, align 8
  ret %struct.Tree* %63
}

; Function Attrs: noinline optnone sspstrong uwtable
define dso_local void @_Z10deleteTreeRP4Tree(%struct.Tree** dereferenceable(8)) #5 {
  %2 = alloca %struct.Tree**, align 8
  store %struct.Tree** %0, %struct.Tree*** %2, align 8
  %3 = load %struct.Tree**, %struct.Tree*** %2, align 8
  %4 = load %struct.Tree*, %struct.Tree** %3, align 8
  %5 = icmp eq %struct.Tree* %4, null
  br i1 %5, label %6, label %7

; <label>:6:                                      ; preds = %1
  br label %17

; <label>:7:                                      ; preds = %1
  %8 = load %struct.Tree**, %struct.Tree*** %2, align 8
  %9 = load %struct.Tree*, %struct.Tree** %8, align 8
  %10 = getelementptr inbounds %struct.Tree, %struct.Tree* %9, i32 0, i32 1
  call void @_Z10deleteTreeRP4Tree(%struct.Tree** dereferenceable(8) %10)
  %11 = load %struct.Tree**, %struct.Tree*** %2, align 8
  %12 = load %struct.Tree*, %struct.Tree** %11, align 8
  %13 = getelementptr inbounds %struct.Tree, %struct.Tree* %12, i32 0, i32 2
  call void @_Z10deleteTreeRP4Tree(%struct.Tree** dereferenceable(8) %13)
  %14 = load %struct.Tree**, %struct.Tree*** %2, align 8
  %15 = load %struct.Tree*, %struct.Tree** %14, align 8
  %16 = bitcast %struct.Tree* %15 to i8*
  call void @free(i8* %16) #3
  br label %17

; <label>:17:                                     ; preds = %7, %6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: noinline optnone sspstrong uwtable
define dso_local void @_Z10create_setRP4Tree(%struct.Tree** dereferenceable(8)) #5 {
  %2 = alloca %struct.Tree**, align 8
  %3 = alloca i64, align 8
  %4 = alloca i32, align 4
  store %struct.Tree** %0, %struct.Tree*** %2, align 8
  store i64 0, i64* %3, align 8
  br label %5

; <label>:5:                                      ; preds = %33, %1
  %6 = call i32 @getchar()
  store i32 %6, i32* %4, align 4
  %7 = icmp ne i32 %6, 10
  br i1 %7, label %8, label %34

; <label>:8:                                      ; preds = %5
  %9 = load i32, i32* %4, align 4
  %10 = icmp eq i32 %9, 32
  br i1 %10, label %11, label %25

; <label>:11:                                     ; preds = %8
  %12 = load %struct.Tree**, %struct.Tree*** %2, align 8
  %13 = load %struct.Tree*, %struct.Tree** %12, align 8
  %14 = icmp eq %struct.Tree* %13, null
  br i1 %14, label %15, label %20

; <label>:15:                                     ; preds = %11
  %16 = load %struct.Tree**, %struct.Tree*** %2, align 8
  %17 = load i64, i64* %3, align 8
  %18 = call %struct.Tree* @_Z6insertRP4Treex(%struct.Tree** dereferenceable(8) %16, i64 %17)
  %19 = load %struct.Tree**, %struct.Tree*** %2, align 8
  store %struct.Tree* %18, %struct.Tree** %19, align 8
  br label %24

; <label>:20:                                     ; preds = %11
  %21 = load %struct.Tree**, %struct.Tree*** %2, align 8
  %22 = load i64, i64* %3, align 8
  %23 = call %struct.Tree* @_Z6insertRP4Treex(%struct.Tree** dereferenceable(8) %21, i64 %22)
  br label %24

; <label>:24:                                     ; preds = %20, %15
  store i64 0, i64* %3, align 8
  br label %33

; <label>:25:                                     ; preds = %8
  %26 = load i32, i32* %4, align 4
  %27 = sub nsw i32 %26, 48
  store i32 %27, i32* %4, align 4
  %28 = load i64, i64* %3, align 8
  %29 = mul nsw i64 %28, 10
  %30 = load i32, i32* %4, align 4
  %31 = sext i32 %30 to i64
  %32 = add nsw i64 %29, %31
  store i64 %32, i64* %3, align 8
  br label %33

; <label>:33:                                     ; preds = %25, %24
  br label %5

; <label>:34:                                     ; preds = %5
  %35 = load %struct.Tree**, %struct.Tree*** %2, align 8
  %36 = load %struct.Tree*, %struct.Tree** %35, align 8
  %37 = icmp eq %struct.Tree* %36, null
  br i1 %37, label %38, label %43

; <label>:38:                                     ; preds = %34
  %39 = load %struct.Tree**, %struct.Tree*** %2, align 8
  %40 = load i64, i64* %3, align 8
  %41 = call %struct.Tree* @_Z6insertRP4Treex(%struct.Tree** dereferenceable(8) %39, i64 %40)
  %42 = load %struct.Tree**, %struct.Tree*** %2, align 8
  store %struct.Tree* %41, %struct.Tree** %42, align 8
  br label %47

; <label>:43:                                     ; preds = %34
  %44 = load %struct.Tree**, %struct.Tree*** %2, align 8
  %45 = load i64, i64* %3, align 8
  %46 = call %struct.Tree* @_Z6insertRP4Treex(%struct.Tree** dereferenceable(8) %44, i64 %45)
  br label %47

; <label>:47:                                     ; preds = %43, %38
  ret void
}

declare i32 @getchar() #1

; Function Attrs: noinline optnone sspstrong uwtable
define dso_local void @_Z11add_elementRP4Tree(%struct.Tree** dereferenceable(8)) #5 {
  %2 = alloca %struct.Tree**, align 8
  %3 = alloca i64, align 8
  %4 = alloca i32, align 4
  store %struct.Tree** %0, %struct.Tree*** %2, align 8
  store i64 0, i64* %3, align 8
  br label %5

; <label>:5:                                      ; preds = %8, %1
  %6 = call i32 @getchar()
  store i32 %6, i32* %4, align 4
  %7 = icmp ne i32 %6, 10
  br i1 %7, label %8, label %16

; <label>:8:                                      ; preds = %5
  %9 = load i32, i32* %4, align 4
  %10 = sub nsw i32 %9, 48
  store i32 %10, i32* %4, align 4
  %11 = load i64, i64* %3, align 8
  %12 = mul nsw i64 %11, 10
  %13 = load i32, i32* %4, align 4
  %14 = sext i32 %13 to i64
  %15 = add nsw i64 %12, %14
  store i64 %15, i64* %3, align 8
  br label %5

; <label>:16:                                     ; preds = %5
  %17 = load %struct.Tree**, %struct.Tree*** %2, align 8
  %18 = load %struct.Tree*, %struct.Tree** %17, align 8
  %19 = icmp eq %struct.Tree* %18, null
  br i1 %19, label %20, label %25

; <label>:20:                                     ; preds = %16
  %21 = load %struct.Tree**, %struct.Tree*** %2, align 8
  %22 = load i64, i64* %3, align 8
  %23 = call %struct.Tree* @_Z6insertRP4Treex(%struct.Tree** dereferenceable(8) %21, i64 %22)
  %24 = load %struct.Tree**, %struct.Tree*** %2, align 8
  store %struct.Tree* %23, %struct.Tree** %24, align 8
  br label %29

; <label>:25:                                     ; preds = %16
  %26 = load %struct.Tree**, %struct.Tree*** %2, align 8
  %27 = load i64, i64* %3, align 8
  %28 = call %struct.Tree* @_Z6insertRP4Treex(%struct.Tree** dereferenceable(8) %26, i64 %27)
  br label %29

; <label>:29:                                     ; preds = %25, %20
  ret void
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local i64* @_Z11min_of_treeP4Tree(%struct.Tree*) #4 {
  %2 = alloca %struct.Tree*, align 8
  %3 = alloca %struct.Tree*, align 8
  store %struct.Tree* %0, %struct.Tree** %2, align 8
  %4 = load %struct.Tree*, %struct.Tree** %2, align 8
  store %struct.Tree* %4, %struct.Tree** %3, align 8
  br label %5

; <label>:5:                                      ; preds = %10, %1
  %6 = load %struct.Tree*, %struct.Tree** %3, align 8
  %7 = getelementptr inbounds %struct.Tree, %struct.Tree* %6, i32 0, i32 1
  %8 = load %struct.Tree*, %struct.Tree** %7, align 8
  %9 = icmp ne %struct.Tree* %8, null
  br i1 %9, label %10, label %14

; <label>:10:                                     ; preds = %5
  %11 = load %struct.Tree*, %struct.Tree** %3, align 8
  %12 = getelementptr inbounds %struct.Tree, %struct.Tree* %11, i32 0, i32 1
  %13 = load %struct.Tree*, %struct.Tree** %12, align 8
  store %struct.Tree* %13, %struct.Tree** %3, align 8
  br label %5

; <label>:14:                                     ; preds = %5
  %15 = load %struct.Tree*, %struct.Tree** %3, align 8
  %16 = getelementptr inbounds %struct.Tree, %struct.Tree* %15, i32 0, i32 0
  ret i64* %16
}

; Function Attrs: noinline optnone sspstrong uwtable
define dso_local void @_Z14find_successorP4TreexRPx(%struct.Tree*, i64, i64** dereferenceable(8)) #5 {
  %4 = alloca %struct.Tree*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64**, align 8
  store %struct.Tree* %0, %struct.Tree** %4, align 8
  store i64 %1, i64* %5, align 8
  store i64** %2, i64*** %6, align 8
  %7 = load %struct.Tree*, %struct.Tree** %4, align 8
  %8 = icmp eq %struct.Tree* %7, null
  br i1 %8, label %9, label %10

; <label>:9:                                      ; preds = %3
  br label %51

; <label>:10:                                     ; preds = %3
  %11 = load %struct.Tree*, %struct.Tree** %4, align 8
  %12 = getelementptr inbounds %struct.Tree, %struct.Tree* %11, i32 0, i32 0
  %13 = load i64, i64* %12, align 8
  %14 = load i64, i64* %5, align 8
  %15 = icmp eq i64 %13, %14
  br i1 %15, label %16, label %28

; <label>:16:                                     ; preds = %10
  %17 = load %struct.Tree*, %struct.Tree** %4, align 8
  %18 = getelementptr inbounds %struct.Tree, %struct.Tree* %17, i32 0, i32 2
  %19 = load %struct.Tree*, %struct.Tree** %18, align 8
  %20 = icmp ne %struct.Tree* %19, null
  br i1 %20, label %21, label %27

; <label>:21:                                     ; preds = %16
  %22 = load %struct.Tree*, %struct.Tree** %4, align 8
  %23 = getelementptr inbounds %struct.Tree, %struct.Tree* %22, i32 0, i32 2
  %24 = load %struct.Tree*, %struct.Tree** %23, align 8
  %25 = call i64* @_Z11min_of_treeP4Tree(%struct.Tree* %24)
  %26 = load i64**, i64*** %6, align 8
  store i64* %25, i64** %26, align 8
  br label %27

; <label>:27:                                     ; preds = %21, %16
  br label %50

; <label>:28:                                     ; preds = %10
  %29 = load %struct.Tree*, %struct.Tree** %4, align 8
  %30 = getelementptr inbounds %struct.Tree, %struct.Tree* %29, i32 0, i32 0
  %31 = load i64, i64* %30, align 8
  %32 = load i64, i64* %5, align 8
  %33 = icmp slt i64 %31, %32
  br i1 %33, label %34, label %40

; <label>:34:                                     ; preds = %28
  %35 = load %struct.Tree*, %struct.Tree** %4, align 8
  %36 = getelementptr inbounds %struct.Tree, %struct.Tree* %35, i32 0, i32 2
  %37 = load %struct.Tree*, %struct.Tree** %36, align 8
  %38 = load i64, i64* %5, align 8
  %39 = load i64**, i64*** %6, align 8
  call void @_Z14find_successorP4TreexRPx(%struct.Tree* %37, i64 %38, i64** dereferenceable(8) %39)
  br label %49

; <label>:40:                                     ; preds = %28
  %41 = load %struct.Tree*, %struct.Tree** %4, align 8
  %42 = getelementptr inbounds %struct.Tree, %struct.Tree* %41, i32 0, i32 0
  %43 = load i64**, i64*** %6, align 8
  store i64* %42, i64** %43, align 8
  %44 = load %struct.Tree*, %struct.Tree** %4, align 8
  %45 = getelementptr inbounds %struct.Tree, %struct.Tree* %44, i32 0, i32 1
  %46 = load %struct.Tree*, %struct.Tree** %45, align 8
  %47 = load i64, i64* %5, align 8
  %48 = load i64**, i64*** %6, align 8
  call void @_Z14find_successorP4TreexRPx(%struct.Tree* %46, i64 %47, i64** dereferenceable(8) %48)
  br label %49

; <label>:49:                                     ; preds = %40, %34
  br label %50

; <label>:50:                                     ; preds = %49, %27
  br label %51

; <label>:51:                                     ; preds = %50, %9
  ret void
}

; Function Attrs: noinline optnone sspstrong uwtable
define dso_local void @_Z13get_successorRP4Tree(%struct.Tree** dereferenceable(8)) #5 {
  %2 = alloca %struct.Tree**, align 8
  %3 = alloca i64, align 8
  %4 = alloca i32, align 4
  %5 = alloca i64*, align 8
  store %struct.Tree** %0, %struct.Tree*** %2, align 8
  store i64 0, i64* %3, align 8
  br label %6

; <label>:6:                                      ; preds = %9, %1
  %7 = call i32 @getchar()
  store i32 %7, i32* %4, align 4
  %8 = icmp ne i32 %7, 10
  br i1 %8, label %9, label %17

; <label>:9:                                      ; preds = %6
  %10 = load i32, i32* %4, align 4
  %11 = sub nsw i32 %10, 48
  store i32 %11, i32* %4, align 4
  %12 = load i64, i64* %3, align 8
  %13 = mul nsw i64 %12, 10
  %14 = load i32, i32* %4, align 4
  %15 = sext i32 %14 to i64
  %16 = add nsw i64 %13, %15
  store i64 %16, i64* %3, align 8
  br label %6

; <label>:17:                                     ; preds = %6
  store i64* null, i64** %5, align 8
  %18 = load %struct.Tree**, %struct.Tree*** %2, align 8
  %19 = load %struct.Tree*, %struct.Tree** %18, align 8
  %20 = load i64, i64* %3, align 8
  call void @_Z14find_successorP4TreexRPx(%struct.Tree* %19, i64 %20, i64** dereferenceable(8) %5)
  %21 = load i64*, i64** %5, align 8
  %22 = icmp eq i64* %21, null
  br i1 %22, label %23, label %26

; <label>:23:                                     ; preds = %17
  %24 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0))
  %25 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c(%"class.std::basic_ostream"* dereferenceable(272) %24, i8 signext 10)
  br label %31

; <label>:26:                                     ; preds = %17
  %27 = load i64*, i64** %5, align 8
  %28 = load i64, i64* %27, align 8
  %29 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEx(%"class.std::basic_ostream"* @_ZSt4cout, i64 %28)
  %30 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c(%"class.std::basic_ostream"* dereferenceable(272) %29, i8 signext 10)
  br label %31

; <label>:31:                                     ; preds = %26, %23
  ret void
}

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c(%"class.std::basic_ostream"* dereferenceable(272), i8 signext) #1

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272), i8*) #1

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEx(%"class.std::basic_ostream"*, i64) #1

; Function Attrs: noinline optnone sspstrong uwtable
define dso_local void @_Z11delete_nodeRP4Treex(%struct.Tree** dereferenceable(8), i64) #5 {
  %3 = alloca %struct.Tree**, align 8
  %4 = alloca i64, align 8
  %5 = alloca %struct.Tree*, align 8
  %6 = alloca %struct.Tree*, align 8
  %7 = alloca %struct.Tree*, align 8
  %8 = alloca i64, align 8
  store %struct.Tree** %0, %struct.Tree*** %3, align 8
  store i64 %1, i64* %4, align 8
  %9 = load %struct.Tree**, %struct.Tree*** %3, align 8
  %10 = load %struct.Tree*, %struct.Tree** %9, align 8
  store %struct.Tree* %10, %struct.Tree** %5, align 8
  br label %11

; <label>:11:                                     ; preds = %43, %2
  %12 = load %struct.Tree*, %struct.Tree** %5, align 8
  %13 = icmp ne %struct.Tree* %12, null
  br i1 %13, label %14, label %20

; <label>:14:                                     ; preds = %11
  %15 = load %struct.Tree*, %struct.Tree** %5, align 8
  %16 = getelementptr inbounds %struct.Tree, %struct.Tree* %15, i32 0, i32 0
  %17 = load i64, i64* %16, align 8
  %18 = load i64, i64* %4, align 8
  %19 = icmp ne i64 %17, %18
  br label %20

; <label>:20:                                     ; preds = %14, %11
  %21 = phi i1 [ false, %11 ], [ %19, %14 ]
  br i1 %21, label %22, label %44

; <label>:22:                                     ; preds = %20
  %23 = load %struct.Tree*, %struct.Tree** %5, align 8
  %24 = getelementptr inbounds %struct.Tree, %struct.Tree* %23, i32 0, i32 0
  %25 = load i64, i64* %24, align 8
  %26 = load i64, i64* %4, align 8
  %27 = icmp slt i64 %25, %26
  br i1 %27, label %28, label %32

; <label>:28:                                     ; preds = %22
  %29 = load %struct.Tree*, %struct.Tree** %5, align 8
  %30 = getelementptr inbounds %struct.Tree, %struct.Tree* %29, i32 0, i32 2
  %31 = load %struct.Tree*, %struct.Tree** %30, align 8
  store %struct.Tree* %31, %struct.Tree** %5, align 8
  br label %43

; <label>:32:                                     ; preds = %22
  %33 = load %struct.Tree*, %struct.Tree** %5, align 8
  %34 = getelementptr inbounds %struct.Tree, %struct.Tree* %33, i32 0, i32 0
  %35 = load i64, i64* %34, align 8
  %36 = load i64, i64* %4, align 8
  %37 = icmp sgt i64 %35, %36
  br i1 %37, label %38, label %42

; <label>:38:                                     ; preds = %32
  %39 = load %struct.Tree*, %struct.Tree** %5, align 8
  %40 = getelementptr inbounds %struct.Tree, %struct.Tree* %39, i32 0, i32 1
  %41 = load %struct.Tree*, %struct.Tree** %40, align 8
  store %struct.Tree* %41, %struct.Tree** %5, align 8
  br label %42

; <label>:42:                                     ; preds = %38, %32
  br label %43

; <label>:43:                                     ; preds = %42, %28
  br label %11

; <label>:44:                                     ; preds = %20
  %45 = load %struct.Tree*, %struct.Tree** %5, align 8
  %46 = icmp eq %struct.Tree* %45, null
  br i1 %46, label %47, label %48

; <label>:47:                                     ; preds = %44
  br label %255

; <label>:48:                                     ; preds = %44
  %49 = load %struct.Tree*, %struct.Tree** %5, align 8
  %50 = getelementptr inbounds %struct.Tree, %struct.Tree* %49, i32 0, i32 1
  %51 = load %struct.Tree*, %struct.Tree** %50, align 8
  %52 = icmp eq %struct.Tree* %51, null
  br i1 %52, label %53, label %168

; <label>:53:                                     ; preds = %48
  %54 = load %struct.Tree*, %struct.Tree** %5, align 8
  %55 = getelementptr inbounds %struct.Tree, %struct.Tree* %54, i32 0, i32 2
  %56 = load %struct.Tree*, %struct.Tree** %55, align 8
  %57 = icmp eq %struct.Tree* %56, null
  br i1 %57, label %58, label %98

; <label>:58:                                     ; preds = %53
  %59 = load %struct.Tree*, %struct.Tree** %5, align 8
  %60 = getelementptr inbounds %struct.Tree, %struct.Tree* %59, i32 0, i32 3
  %61 = load %struct.Tree*, %struct.Tree** %60, align 8
  %62 = icmp eq %struct.Tree* %61, null
  br i1 %62, label %63, label %67

; <label>:63:                                     ; preds = %58
  %64 = load %struct.Tree*, %struct.Tree** %5, align 8
  %65 = bitcast %struct.Tree* %64 to i8*
  call void @free(i8* %65) #3
  %66 = load %struct.Tree**, %struct.Tree*** %3, align 8
  store %struct.Tree* null, %struct.Tree** %66, align 8
  br label %255

; <label>:67:                                     ; preds = %58
  %68 = load %struct.Tree*, %struct.Tree** %5, align 8
  %69 = getelementptr inbounds %struct.Tree, %struct.Tree* %68, i32 0, i32 3
  %70 = load %struct.Tree*, %struct.Tree** %69, align 8
  %71 = getelementptr inbounds %struct.Tree, %struct.Tree* %70, i32 0, i32 1
  %72 = load %struct.Tree*, %struct.Tree** %71, align 8
  %73 = load %struct.Tree*, %struct.Tree** %5, align 8
  %74 = icmp eq %struct.Tree* %72, %73
  br i1 %74, label %75, label %80

; <label>:75:                                     ; preds = %67
  %76 = load %struct.Tree*, %struct.Tree** %5, align 8
  %77 = getelementptr inbounds %struct.Tree, %struct.Tree* %76, i32 0, i32 3
  %78 = load %struct.Tree*, %struct.Tree** %77, align 8
  %79 = getelementptr inbounds %struct.Tree, %struct.Tree* %78, i32 0, i32 1
  store %struct.Tree* null, %struct.Tree** %79, align 8
  br label %94

; <label>:80:                                     ; preds = %67
  %81 = load %struct.Tree*, %struct.Tree** %5, align 8
  %82 = getelementptr inbounds %struct.Tree, %struct.Tree* %81, i32 0, i32 3
  %83 = load %struct.Tree*, %struct.Tree** %82, align 8
  %84 = getelementptr inbounds %struct.Tree, %struct.Tree* %83, i32 0, i32 2
  %85 = load %struct.Tree*, %struct.Tree** %84, align 8
  %86 = load %struct.Tree*, %struct.Tree** %5, align 8
  %87 = icmp eq %struct.Tree* %85, %86
  br i1 %87, label %88, label %93

; <label>:88:                                     ; preds = %80
  %89 = load %struct.Tree*, %struct.Tree** %5, align 8
  %90 = getelementptr inbounds %struct.Tree, %struct.Tree* %89, i32 0, i32 3
  %91 = load %struct.Tree*, %struct.Tree** %90, align 8
  %92 = getelementptr inbounds %struct.Tree, %struct.Tree* %91, i32 0, i32 2
  store %struct.Tree* null, %struct.Tree** %92, align 8
  br label %93

; <label>:93:                                     ; preds = %88, %80
  br label %94

; <label>:94:                                     ; preds = %93, %75
  br label %95

; <label>:95:                                     ; preds = %94
  %96 = load %struct.Tree*, %struct.Tree** %5, align 8
  %97 = bitcast %struct.Tree* %96 to i8*
  call void @free(i8* %97) #3
  store %struct.Tree* null, %struct.Tree** %5, align 8
  br label %167

; <label>:98:                                     ; preds = %53
  %99 = load %struct.Tree*, %struct.Tree** %5, align 8
  %100 = getelementptr inbounds %struct.Tree, %struct.Tree* %99, i32 0, i32 3
  %101 = load %struct.Tree*, %struct.Tree** %100, align 8
  %102 = icmp eq %struct.Tree* %101, null
  br i1 %102, label %103, label %114

; <label>:103:                                    ; preds = %98
  %104 = load %struct.Tree*, %struct.Tree** %5, align 8
  %105 = getelementptr inbounds %struct.Tree, %struct.Tree* %104, i32 0, i32 2
  %106 = load %struct.Tree*, %struct.Tree** %105, align 8
  store %struct.Tree* %106, %struct.Tree** %6, align 8
  %107 = load %struct.Tree*, %struct.Tree** %5, align 8
  %108 = bitcast %struct.Tree* %107 to i8*
  call void @free(i8* %108) #3
  %109 = load %struct.Tree*, %struct.Tree** %6, align 8
  store %struct.Tree* %109, %struct.Tree** %5, align 8
  %110 = load %struct.Tree*, %struct.Tree** %5, align 8
  %111 = getelementptr inbounds %struct.Tree, %struct.Tree* %110, i32 0, i32 3
  store %struct.Tree* null, %struct.Tree** %111, align 8
  %112 = load %struct.Tree*, %struct.Tree** %5, align 8
  %113 = load %struct.Tree**, %struct.Tree*** %3, align 8
  store %struct.Tree* %112, %struct.Tree** %113, align 8
  br label %166

; <label>:114:                                    ; preds = %98
  %115 = load %struct.Tree*, %struct.Tree** %5, align 8
  %116 = getelementptr inbounds %struct.Tree, %struct.Tree* %115, i32 0, i32 3
  %117 = load %struct.Tree*, %struct.Tree** %116, align 8
  %118 = getelementptr inbounds %struct.Tree, %struct.Tree* %117, i32 0, i32 1
  %119 = load %struct.Tree*, %struct.Tree** %118, align 8
  %120 = load %struct.Tree*, %struct.Tree** %5, align 8
  %121 = icmp eq %struct.Tree* %119, %120
  br i1 %121, label %122, label %139

; <label>:122:                                    ; preds = %114
  %123 = load %struct.Tree*, %struct.Tree** %5, align 8
  %124 = getelementptr inbounds %struct.Tree, %struct.Tree* %123, i32 0, i32 2
  %125 = load %struct.Tree*, %struct.Tree** %124, align 8
  %126 = load %struct.Tree*, %struct.Tree** %5, align 8
  %127 = getelementptr inbounds %struct.Tree, %struct.Tree* %126, i32 0, i32 3
  %128 = load %struct.Tree*, %struct.Tree** %127, align 8
  %129 = getelementptr inbounds %struct.Tree, %struct.Tree* %128, i32 0, i32 1
  store %struct.Tree* %125, %struct.Tree** %129, align 8
  %130 = load %struct.Tree*, %struct.Tree** %5, align 8
  %131 = getelementptr inbounds %struct.Tree, %struct.Tree* %130, i32 0, i32 3
  %132 = load %struct.Tree*, %struct.Tree** %131, align 8
  %133 = load %struct.Tree*, %struct.Tree** %5, align 8
  %134 = getelementptr inbounds %struct.Tree, %struct.Tree* %133, i32 0, i32 2
  %135 = load %struct.Tree*, %struct.Tree** %134, align 8
  %136 = getelementptr inbounds %struct.Tree, %struct.Tree* %135, i32 0, i32 3
  store %struct.Tree* %132, %struct.Tree** %136, align 8
  %137 = load %struct.Tree*, %struct.Tree** %5, align 8
  %138 = bitcast %struct.Tree* %137 to i8*
  call void @free(i8* %138) #3
  br label %165

; <label>:139:                                    ; preds = %114
  %140 = load %struct.Tree*, %struct.Tree** %5, align 8
  %141 = getelementptr inbounds %struct.Tree, %struct.Tree* %140, i32 0, i32 3
  %142 = load %struct.Tree*, %struct.Tree** %141, align 8
  %143 = getelementptr inbounds %struct.Tree, %struct.Tree* %142, i32 0, i32 2
  %144 = load %struct.Tree*, %struct.Tree** %143, align 8
  %145 = load %struct.Tree*, %struct.Tree** %5, align 8
  %146 = icmp eq %struct.Tree* %144, %145
  br i1 %146, label %147, label %164

; <label>:147:                                    ; preds = %139
  %148 = load %struct.Tree*, %struct.Tree** %5, align 8
  %149 = getelementptr inbounds %struct.Tree, %struct.Tree* %148, i32 0, i32 2
  %150 = load %struct.Tree*, %struct.Tree** %149, align 8
  %151 = load %struct.Tree*, %struct.Tree** %5, align 8
  %152 = getelementptr inbounds %struct.Tree, %struct.Tree* %151, i32 0, i32 3
  %153 = load %struct.Tree*, %struct.Tree** %152, align 8
  %154 = getelementptr inbounds %struct.Tree, %struct.Tree* %153, i32 0, i32 2
  store %struct.Tree* %150, %struct.Tree** %154, align 8
  %155 = load %struct.Tree*, %struct.Tree** %5, align 8
  %156 = getelementptr inbounds %struct.Tree, %struct.Tree* %155, i32 0, i32 3
  %157 = load %struct.Tree*, %struct.Tree** %156, align 8
  %158 = load %struct.Tree*, %struct.Tree** %5, align 8
  %159 = getelementptr inbounds %struct.Tree, %struct.Tree* %158, i32 0, i32 2
  %160 = load %struct.Tree*, %struct.Tree** %159, align 8
  %161 = getelementptr inbounds %struct.Tree, %struct.Tree* %160, i32 0, i32 3
  store %struct.Tree* %157, %struct.Tree** %161, align 8
  %162 = load %struct.Tree*, %struct.Tree** %5, align 8
  %163 = bitcast %struct.Tree* %162 to i8*
  call void @free(i8* %163) #3
  br label %164

; <label>:164:                                    ; preds = %147, %139
  br label %165

; <label>:165:                                    ; preds = %164, %122
  br label %166

; <label>:166:                                    ; preds = %165, %103
  br label %167

; <label>:167:                                    ; preds = %166, %95
  br label %255

; <label>:168:                                    ; preds = %48
  %169 = load %struct.Tree*, %struct.Tree** %5, align 8
  %170 = getelementptr inbounds %struct.Tree, %struct.Tree* %169, i32 0, i32 2
  %171 = load %struct.Tree*, %struct.Tree** %170, align 8
  %172 = icmp eq %struct.Tree* %171, null
  br i1 %172, label %173, label %242

; <label>:173:                                    ; preds = %168
  %174 = load %struct.Tree*, %struct.Tree** %5, align 8
  %175 = getelementptr inbounds %struct.Tree, %struct.Tree* %174, i32 0, i32 3
  %176 = load %struct.Tree*, %struct.Tree** %175, align 8
  %177 = icmp eq %struct.Tree* %176, null
  br i1 %177, label %178, label %189

; <label>:178:                                    ; preds = %173
  %179 = load %struct.Tree*, %struct.Tree** %5, align 8
  %180 = getelementptr inbounds %struct.Tree, %struct.Tree* %179, i32 0, i32 1
  %181 = load %struct.Tree*, %struct.Tree** %180, align 8
  store %struct.Tree* %181, %struct.Tree** %7, align 8
  %182 = load %struct.Tree*, %struct.Tree** %5, align 8
  %183 = bitcast %struct.Tree* %182 to i8*
  call void @free(i8* %183) #3
  %184 = load %struct.Tree*, %struct.Tree** %7, align 8
  store %struct.Tree* %184, %struct.Tree** %5, align 8
  %185 = load %struct.Tree*, %struct.Tree** %5, align 8
  %186 = getelementptr inbounds %struct.Tree, %struct.Tree* %185, i32 0, i32 3
  store %struct.Tree* null, %struct.Tree** %186, align 8
  %187 = load %struct.Tree*, %struct.Tree** %5, align 8
  %188 = load %struct.Tree**, %struct.Tree*** %3, align 8
  store %struct.Tree* %187, %struct.Tree** %188, align 8
  br label %241

; <label>:189:                                    ; preds = %173
  %190 = load %struct.Tree*, %struct.Tree** %5, align 8
  %191 = getelementptr inbounds %struct.Tree, %struct.Tree* %190, i32 0, i32 3
  %192 = load %struct.Tree*, %struct.Tree** %191, align 8
  %193 = getelementptr inbounds %struct.Tree, %struct.Tree* %192, i32 0, i32 1
  %194 = load %struct.Tree*, %struct.Tree** %193, align 8
  %195 = load %struct.Tree*, %struct.Tree** %5, align 8
  %196 = icmp eq %struct.Tree* %194, %195
  br i1 %196, label %197, label %214

; <label>:197:                                    ; preds = %189
  %198 = load %struct.Tree*, %struct.Tree** %5, align 8
  %199 = getelementptr inbounds %struct.Tree, %struct.Tree* %198, i32 0, i32 1
  %200 = load %struct.Tree*, %struct.Tree** %199, align 8
  %201 = load %struct.Tree*, %struct.Tree** %5, align 8
  %202 = getelementptr inbounds %struct.Tree, %struct.Tree* %201, i32 0, i32 3
  %203 = load %struct.Tree*, %struct.Tree** %202, align 8
  %204 = getelementptr inbounds %struct.Tree, %struct.Tree* %203, i32 0, i32 1
  store %struct.Tree* %200, %struct.Tree** %204, align 8
  %205 = load %struct.Tree*, %struct.Tree** %5, align 8
  %206 = getelementptr inbounds %struct.Tree, %struct.Tree* %205, i32 0, i32 3
  %207 = load %struct.Tree*, %struct.Tree** %206, align 8
  %208 = load %struct.Tree*, %struct.Tree** %5, align 8
  %209 = getelementptr inbounds %struct.Tree, %struct.Tree* %208, i32 0, i32 1
  %210 = load %struct.Tree*, %struct.Tree** %209, align 8
  %211 = getelementptr inbounds %struct.Tree, %struct.Tree* %210, i32 0, i32 3
  store %struct.Tree* %207, %struct.Tree** %211, align 8
  %212 = load %struct.Tree*, %struct.Tree** %5, align 8
  %213 = bitcast %struct.Tree* %212 to i8*
  call void @free(i8* %213) #3
  br label %240

; <label>:214:                                    ; preds = %189
  %215 = load %struct.Tree*, %struct.Tree** %5, align 8
  %216 = getelementptr inbounds %struct.Tree, %struct.Tree* %215, i32 0, i32 3
  %217 = load %struct.Tree*, %struct.Tree** %216, align 8
  %218 = getelementptr inbounds %struct.Tree, %struct.Tree* %217, i32 0, i32 2
  %219 = load %struct.Tree*, %struct.Tree** %218, align 8
  %220 = load %struct.Tree*, %struct.Tree** %5, align 8
  %221 = icmp eq %struct.Tree* %219, %220
  br i1 %221, label %222, label %239

; <label>:222:                                    ; preds = %214
  %223 = load %struct.Tree*, %struct.Tree** %5, align 8
  %224 = getelementptr inbounds %struct.Tree, %struct.Tree* %223, i32 0, i32 1
  %225 = load %struct.Tree*, %struct.Tree** %224, align 8
  %226 = load %struct.Tree*, %struct.Tree** %5, align 8
  %227 = getelementptr inbounds %struct.Tree, %struct.Tree* %226, i32 0, i32 3
  %228 = load %struct.Tree*, %struct.Tree** %227, align 8
  %229 = getelementptr inbounds %struct.Tree, %struct.Tree* %228, i32 0, i32 2
  store %struct.Tree* %225, %struct.Tree** %229, align 8
  %230 = load %struct.Tree*, %struct.Tree** %5, align 8
  %231 = getelementptr inbounds %struct.Tree, %struct.Tree* %230, i32 0, i32 3
  %232 = load %struct.Tree*, %struct.Tree** %231, align 8
  %233 = load %struct.Tree*, %struct.Tree** %5, align 8
  %234 = getelementptr inbounds %struct.Tree, %struct.Tree* %233, i32 0, i32 1
  %235 = load %struct.Tree*, %struct.Tree** %234, align 8
  %236 = getelementptr inbounds %struct.Tree, %struct.Tree* %235, i32 0, i32 3
  store %struct.Tree* %232, %struct.Tree** %236, align 8
  %237 = load %struct.Tree*, %struct.Tree** %5, align 8
  %238 = bitcast %struct.Tree* %237 to i8*
  call void @free(i8* %238) #3
  br label %239

; <label>:239:                                    ; preds = %222, %214
  br label %240

; <label>:240:                                    ; preds = %239, %197
  br label %241

; <label>:241:                                    ; preds = %240, %178
  br label %255

; <label>:242:                                    ; preds = %168
  br label %243

; <label>:243:                                    ; preds = %242
  %244 = load %struct.Tree*, %struct.Tree** %5, align 8
  %245 = getelementptr inbounds %struct.Tree, %struct.Tree* %244, i32 0, i32 2
  %246 = load %struct.Tree*, %struct.Tree** %245, align 8
  %247 = call i64* @_Z11min_of_treeP4Tree(%struct.Tree* %246)
  %248 = load i64, i64* %247, align 8
  store i64 %248, i64* %8, align 8
  %249 = load i64, i64* %8, align 8
  %250 = load %struct.Tree*, %struct.Tree** %5, align 8
  %251 = getelementptr inbounds %struct.Tree, %struct.Tree* %250, i32 0, i32 0
  store i64 %249, i64* %251, align 8
  %252 = load %struct.Tree*, %struct.Tree** %5, align 8
  %253 = getelementptr inbounds %struct.Tree, %struct.Tree* %252, i32 0, i32 2
  %254 = load i64, i64* %8, align 8
  call void @_Z11delete_nodeRP4Treex(%struct.Tree** dereferenceable(8) %253, i64 %254)
  br label %255

; <label>:255:                                    ; preds = %243, %241, %167, %63, %47
  ret void
}

; Function Attrs: noinline optnone sspstrong uwtable
define dso_local void @_Z14delete_elementRP4Tree(%struct.Tree** dereferenceable(8)) #5 {
  %2 = alloca %struct.Tree**, align 8
  %3 = alloca i64, align 8
  %4 = alloca i32, align 4
  store %struct.Tree** %0, %struct.Tree*** %2, align 8
  store i64 0, i64* %3, align 8
  br label %5

; <label>:5:                                      ; preds = %8, %1
  %6 = call i32 @getchar()
  store i32 %6, i32* %4, align 4
  %7 = icmp ne i32 %6, 10
  br i1 %7, label %8, label %16

; <label>:8:                                      ; preds = %5
  %9 = load i32, i32* %4, align 4
  %10 = sub nsw i32 %9, 48
  store i32 %10, i32* %4, align 4
  %11 = load i64, i64* %3, align 8
  %12 = mul nsw i64 %11, 10
  %13 = load i32, i32* %4, align 4
  %14 = sext i32 %13 to i64
  %15 = add nsw i64 %12, %14
  store i64 %15, i64* %3, align 8
  br label %5

; <label>:16:                                     ; preds = %5
  %17 = load %struct.Tree**, %struct.Tree*** %2, align 8
  %18 = load i64, i64* %3, align 8
  call void @_Z11delete_nodeRP4Treex(%struct.Tree** dereferenceable(8) %17, i64 %18)
  ret void
}

; Function Attrs: noinline optnone sspstrong uwtable
define dso_local void @_Z6searchP4Tree(%struct.Tree*) #5 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = alloca %struct.Tree*, align 8
  %3 = alloca i64, align 8
  %4 = alloca i32, align 4
  %5 = alloca %"class.std::__cxx11::basic_string", align 8
  %6 = alloca i8, align 1
  %7 = alloca i8*
  %8 = alloca i32
  store %struct.Tree* %0, %struct.Tree** %2, align 8
  store i64 0, i64* %3, align 8
  br label %9

; <label>:9:                                      ; preds = %12, %1
  %10 = call i32 @getchar()
  store i32 %10, i32* %4, align 4
  %11 = icmp ne i32 %10, 10
  br i1 %11, label %12, label %20

; <label>:12:                                     ; preds = %9
  %13 = load i32, i32* %4, align 4
  %14 = sub nsw i32 %13, 48
  store i32 %14, i32* %4, align 4
  %15 = load i64, i64* %3, align 8
  %16 = mul nsw i64 %15, 10
  %17 = load i32, i32* %4, align 4
  %18 = sext i32 %17 to i64
  %19 = add nsw i64 %16, %18
  store i64 %19, i64* %3, align 8
  br label %9

; <label>:20:                                     ; preds = %9
  call void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1Ev(%"class.std::__cxx11::basic_string"* %5) #3
  store i8 0, i8* %6, align 1
  br label %21

; <label>:21:                                     ; preds = %61, %20
  %22 = load %struct.Tree*, %struct.Tree** %2, align 8
  %23 = icmp ne %struct.Tree* %22, null
  br i1 %23, label %24, label %62

; <label>:24:                                     ; preds = %21
  %25 = load %struct.Tree*, %struct.Tree** %2, align 8
  %26 = getelementptr inbounds %struct.Tree, %struct.Tree* %25, i32 0, i32 0
  %27 = load i64, i64* %26, align 8
  %28 = load i64, i64* %3, align 8
  %29 = icmp eq i64 %27, %28
  br i1 %29, label %30, label %31

; <label>:30:                                     ; preds = %24
  store i8 1, i8* %6, align 1
  br label %62

; <label>:31:                                     ; preds = %24
  %32 = load %struct.Tree*, %struct.Tree** %2, align 8
  %33 = getelementptr inbounds %struct.Tree, %struct.Tree* %32, i32 0, i32 0
  %34 = load i64, i64* %33, align 8
  %35 = load i64, i64* %3, align 8
  %36 = icmp slt i64 %34, %35
  br i1 %36, label %37, label %47

; <label>:37:                                     ; preds = %31
  %38 = invoke dereferenceable(32) %"class.std::__cxx11::basic_string"* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEpLEc(%"class.std::__cxx11::basic_string"* %5, i8 signext 49)
          to label %39 unwind label %43

; <label>:39:                                     ; preds = %37
  %40 = load %struct.Tree*, %struct.Tree** %2, align 8
  %41 = getelementptr inbounds %struct.Tree, %struct.Tree* %40, i32 0, i32 2
  %42 = load %struct.Tree*, %struct.Tree** %41, align 8
  store %struct.Tree* %42, %struct.Tree** %2, align 8
  br label %60

; <label>:43:                                     ; preds = %74, %72, %69, %67, %53, %37
  %44 = landingpad { i8*, i32 }
          cleanup
  %45 = extractvalue { i8*, i32 } %44, 0
  store i8* %45, i8** %7, align 8
  %46 = extractvalue { i8*, i32 } %44, 1
  store i32 %46, i32* %8, align 4
  call void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(%"class.std::__cxx11::basic_string"* %5) #3
  br label %78

; <label>:47:                                     ; preds = %31
  %48 = load %struct.Tree*, %struct.Tree** %2, align 8
  %49 = getelementptr inbounds %struct.Tree, %struct.Tree* %48, i32 0, i32 0
  %50 = load i64, i64* %49, align 8
  %51 = load i64, i64* %3, align 8
  %52 = icmp sgt i64 %50, %51
  br i1 %52, label %53, label %59

; <label>:53:                                     ; preds = %47
  %54 = invoke dereferenceable(32) %"class.std::__cxx11::basic_string"* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEpLEc(%"class.std::__cxx11::basic_string"* %5, i8 signext 48)
          to label %55 unwind label %43

; <label>:55:                                     ; preds = %53
  %56 = load %struct.Tree*, %struct.Tree** %2, align 8
  %57 = getelementptr inbounds %struct.Tree, %struct.Tree* %56, i32 0, i32 1
  %58 = load %struct.Tree*, %struct.Tree** %57, align 8
  store %struct.Tree* %58, %struct.Tree** %2, align 8
  br label %59

; <label>:59:                                     ; preds = %55, %47
  br label %60

; <label>:60:                                     ; preds = %59, %39
  br label %61

; <label>:61:                                     ; preds = %60
  br label %21

; <label>:62:                                     ; preds = %30, %21
  %63 = load i8, i8* %6, align 1
  %64 = trunc i8 %63 to i1
  %65 = zext i1 %64 to i32
  %66 = icmp eq i32 %65, 1
  br i1 %66, label %67, label %72

; <label>:67:                                     ; preds = %62
  %68 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, %"class.std::__cxx11::basic_string"* dereferenceable(32) %5)
          to label %69 unwind label %43

; <label>:69:                                     ; preds = %67
  %70 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c(%"class.std::basic_ostream"* dereferenceable(272) %68, i8 signext 10)
          to label %71 unwind label %43

; <label>:71:                                     ; preds = %69
  br label %77

; <label>:72:                                     ; preds = %62
  %73 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0))
          to label %74 unwind label %43

; <label>:74:                                     ; preds = %72
  %75 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c(%"class.std::basic_ostream"* dereferenceable(272) %73, i8 signext 10)
          to label %76 unwind label %43

; <label>:76:                                     ; preds = %74
  br label %77

; <label>:77:                                     ; preds = %76, %71
  call void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(%"class.std::__cxx11::basic_string"* %5) #3
  ret void

; <label>:78:                                     ; preds = %43
  %79 = load i8*, i8** %7, align 8
  %80 = load i32, i32* %8, align 4
  %81 = insertvalue { i8*, i32 } undef, i8* %79, 0
  %82 = insertvalue { i8*, i32 } %81, i32 %80, 1
  resume { i8*, i32 } %82
}

; Function Attrs: nounwind
declare void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1Ev(%"class.std::__cxx11::basic_string"*) unnamed_addr #2

declare dereferenceable(32) %"class.std::__cxx11::basic_string"* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEpLEc(%"class.std::__cxx11::basic_string"*, i8 signext) #1

declare i32 @__gxx_personality_v0(...)

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE(%"class.std::basic_ostream"* dereferenceable(272), %"class.std::__cxx11::basic_string"* dereferenceable(32)) #1

; Function Attrs: nounwind
declare void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(%"class.std::__cxx11::basic_string"*) unnamed_addr #2

; Function Attrs: noinline optnone sspstrong uwtable
define dso_local void @_Z15print_pre_orderRP4Treeb(%struct.Tree** dereferenceable(8), i1 zeroext) #5 {
  %3 = alloca %struct.Tree**, align 8
  %4 = alloca i8, align 1
  store %struct.Tree** %0, %struct.Tree*** %3, align 8
  %5 = zext i1 %1 to i8
  store i8 %5, i8* %4, align 1
  %6 = load %struct.Tree**, %struct.Tree*** %3, align 8
  %7 = load %struct.Tree*, %struct.Tree** %6, align 8
  %8 = icmp ne %struct.Tree* %7, null
  br i1 %8, label %9, label %30

; <label>:9:                                      ; preds = %2
  %10 = load i8, i8* %4, align 1
  %11 = trunc i8 %10 to i1
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %9
  %13 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0))
  br label %14

; <label>:14:                                     ; preds = %12, %9
  %15 = load %struct.Tree**, %struct.Tree*** %3, align 8
  %16 = load %struct.Tree*, %struct.Tree** %15, align 8
  %17 = getelementptr inbounds %struct.Tree, %struct.Tree* %16, i32 0, i32 0
  %18 = load i64, i64* %17, align 8
  %19 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEx(%"class.std::basic_ostream"* @_ZSt4cout, i64 %18)
  store i8 1, i8* %4, align 1
  %20 = load %struct.Tree**, %struct.Tree*** %3, align 8
  %21 = load %struct.Tree*, %struct.Tree** %20, align 8
  %22 = getelementptr inbounds %struct.Tree, %struct.Tree* %21, i32 0, i32 1
  %23 = load i8, i8* %4, align 1
  %24 = trunc i8 %23 to i1
  call void @_Z15print_pre_orderRP4Treeb(%struct.Tree** dereferenceable(8) %22, i1 zeroext %24)
  %25 = load %struct.Tree**, %struct.Tree*** %3, align 8
  %26 = load %struct.Tree*, %struct.Tree** %25, align 8
  %27 = getelementptr inbounds %struct.Tree, %struct.Tree* %26, i32 0, i32 2
  %28 = load i8, i8* %4, align 1
  %29 = trunc i8 %28 to i1
  call void @_Z15print_pre_orderRP4Treeb(%struct.Tree** dereferenceable(8) %27, i1 zeroext %29)
  br label %30

; <label>:30:                                     ; preds = %14, %2
  ret void
}

; Function Attrs: noinline optnone sspstrong uwtable
define dso_local void @_Z14print_childrenP4Tree(%struct.Tree*) #5 {
  %2 = alloca %struct.Tree*, align 8
  %3 = alloca i64, align 8
  %4 = alloca i32, align 4
  %5 = alloca i8, align 1
  store %struct.Tree* %0, %struct.Tree** %2, align 8
  store i64 0, i64* %3, align 8
  br label %6

; <label>:6:                                      ; preds = %9, %1
  %7 = call i32 @getchar()
  store i32 %7, i32* %4, align 4
  %8 = icmp ne i32 %7, 10
  br i1 %8, label %9, label %17

; <label>:9:                                      ; preds = %6
  %10 = load i32, i32* %4, align 4
  %11 = sub nsw i32 %10, 48
  store i32 %11, i32* %4, align 4
  %12 = load i64, i64* %3, align 8
  %13 = mul nsw i64 %12, 10
  %14 = load i32, i32* %4, align 4
  %15 = sext i32 %14 to i64
  %16 = add nsw i64 %13, %15
  store i64 %16, i64* %3, align 8
  br label %6

; <label>:17:                                     ; preds = %6
  store i8 0, i8* %5, align 1
  br label %18

; <label>:18:                                     ; preds = %50, %17
  %19 = load %struct.Tree*, %struct.Tree** %2, align 8
  %20 = icmp ne %struct.Tree* %19, null
  br i1 %20, label %21, label %51

; <label>:21:                                     ; preds = %18
  %22 = load %struct.Tree*, %struct.Tree** %2, align 8
  %23 = getelementptr inbounds %struct.Tree, %struct.Tree* %22, i32 0, i32 0
  %24 = load i64, i64* %23, align 8
  %25 = load i64, i64* %3, align 8
  %26 = icmp eq i64 %24, %25
  br i1 %26, label %27, label %28

; <label>:27:                                     ; preds = %21
  store i8 1, i8* %5, align 1
  br label %51

; <label>:28:                                     ; preds = %21
  %29 = load %struct.Tree*, %struct.Tree** %2, align 8
  %30 = getelementptr inbounds %struct.Tree, %struct.Tree* %29, i32 0, i32 0
  %31 = load i64, i64* %30, align 8
  %32 = load i64, i64* %3, align 8
  %33 = icmp slt i64 %31, %32
  br i1 %33, label %34, label %38

; <label>:34:                                     ; preds = %28
  %35 = load %struct.Tree*, %struct.Tree** %2, align 8
  %36 = getelementptr inbounds %struct.Tree, %struct.Tree* %35, i32 0, i32 2
  %37 = load %struct.Tree*, %struct.Tree** %36, align 8
  store %struct.Tree* %37, %struct.Tree** %2, align 8
  br label %49

; <label>:38:                                     ; preds = %28
  %39 = load %struct.Tree*, %struct.Tree** %2, align 8
  %40 = getelementptr inbounds %struct.Tree, %struct.Tree* %39, i32 0, i32 0
  %41 = load i64, i64* %40, align 8
  %42 = load i64, i64* %3, align 8
  %43 = icmp sgt i64 %41, %42
  br i1 %43, label %44, label %48

; <label>:44:                                     ; preds = %38
  %45 = load %struct.Tree*, %struct.Tree** %2, align 8
  %46 = getelementptr inbounds %struct.Tree, %struct.Tree* %45, i32 0, i32 1
  %47 = load %struct.Tree*, %struct.Tree** %46, align 8
  store %struct.Tree* %47, %struct.Tree** %2, align 8
  br label %48

; <label>:48:                                     ; preds = %44, %38
  br label %49

; <label>:49:                                     ; preds = %48, %34
  br label %50

; <label>:50:                                     ; preds = %49
  br label %18

; <label>:51:                                     ; preds = %27, %18
  %52 = load i8, i8* %5, align 1
  %53 = trunc i8 %52 to i1
  br i1 %53, label %54, label %84

; <label>:54:                                     ; preds = %51
  %55 = load %struct.Tree*, %struct.Tree** %2, align 8
  %56 = getelementptr inbounds %struct.Tree, %struct.Tree* %55, i32 0, i32 1
  %57 = load %struct.Tree*, %struct.Tree** %56, align 8
  %58 = icmp ne %struct.Tree* %57, null
  br i1 %58, label %59, label %67

; <label>:59:                                     ; preds = %54
  %60 = load %struct.Tree*, %struct.Tree** %2, align 8
  %61 = getelementptr inbounds %struct.Tree, %struct.Tree* %60, i32 0, i32 1
  %62 = load %struct.Tree*, %struct.Tree** %61, align 8
  %63 = getelementptr inbounds %struct.Tree, %struct.Tree* %62, i32 0, i32 0
  %64 = load i64, i64* %63, align 8
  %65 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEx(%"class.std::basic_ostream"* @_ZSt4cout, i64 %64)
  %66 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %65, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0))
  br label %69

; <label>:67:                                     ; preds = %54
  %68 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0))
  br label %69

; <label>:69:                                     ; preds = %67, %59
  %70 = load %struct.Tree*, %struct.Tree** %2, align 8
  %71 = getelementptr inbounds %struct.Tree, %struct.Tree* %70, i32 0, i32 2
  %72 = load %struct.Tree*, %struct.Tree** %71, align 8
  %73 = icmp ne %struct.Tree* %72, null
  br i1 %73, label %74, label %81

; <label>:74:                                     ; preds = %69
  %75 = load %struct.Tree*, %struct.Tree** %2, align 8
  %76 = getelementptr inbounds %struct.Tree, %struct.Tree* %75, i32 0, i32 2
  %77 = load %struct.Tree*, %struct.Tree** %76, align 8
  %78 = getelementptr inbounds %struct.Tree, %struct.Tree* %77, i32 0, i32 0
  %79 = load i64, i64* %78, align 8
  %80 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEx(%"class.std::basic_ostream"* @_ZSt4cout, i64 %79)
  br label %83

; <label>:81:                                     ; preds = %69
  %82 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0))
  br label %83

; <label>:83:                                     ; preds = %81, %74
  br label %86

; <label>:84:                                     ; preds = %51
  %85 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0))
  br label %86

; <label>:86:                                     ; preds = %84, %83
  %87 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8 signext 10)
  ret void
}

; Function Attrs: noinline optnone sspstrong uwtable
define dso_local void @_Z11print_uncleP4Tree(%struct.Tree*) #5 {
  %2 = alloca %struct.Tree*, align 8
  %3 = alloca i64, align 8
  %4 = alloca i32, align 4
  %5 = alloca i8, align 1
  %6 = alloca %struct.Tree*, align 8
  store %struct.Tree* %0, %struct.Tree** %2, align 8
  store i64 0, i64* %3, align 8
  br label %7

; <label>:7:                                      ; preds = %10, %1
  %8 = call i32 @getchar()
  store i32 %8, i32* %4, align 4
  %9 = icmp ne i32 %8, 10
  br i1 %9, label %10, label %18

; <label>:10:                                     ; preds = %7
  %11 = load i32, i32* %4, align 4
  %12 = sub nsw i32 %11, 48
  store i32 %12, i32* %4, align 4
  %13 = load i64, i64* %3, align 8
  %14 = mul nsw i64 %13, 10
  %15 = load i32, i32* %4, align 4
  %16 = sext i32 %15 to i64
  %17 = add nsw i64 %14, %16
  store i64 %17, i64* %3, align 8
  br label %7

; <label>:18:                                     ; preds = %7
  store i8 0, i8* %5, align 1
  br label %19

; <label>:19:                                     ; preds = %51, %18
  %20 = load %struct.Tree*, %struct.Tree** %2, align 8
  %21 = icmp ne %struct.Tree* %20, null
  br i1 %21, label %22, label %52

; <label>:22:                                     ; preds = %19
  %23 = load %struct.Tree*, %struct.Tree** %2, align 8
  %24 = getelementptr inbounds %struct.Tree, %struct.Tree* %23, i32 0, i32 0
  %25 = load i64, i64* %24, align 8
  %26 = load i64, i64* %3, align 8
  %27 = icmp eq i64 %25, %26
  br i1 %27, label %28, label %29

; <label>:28:                                     ; preds = %22
  store i8 1, i8* %5, align 1
  br label %52

; <label>:29:                                     ; preds = %22
  %30 = load %struct.Tree*, %struct.Tree** %2, align 8
  %31 = getelementptr inbounds %struct.Tree, %struct.Tree* %30, i32 0, i32 0
  %32 = load i64, i64* %31, align 8
  %33 = load i64, i64* %3, align 8
  %34 = icmp slt i64 %32, %33
  br i1 %34, label %35, label %39

; <label>:35:                                     ; preds = %29
  %36 = load %struct.Tree*, %struct.Tree** %2, align 8
  %37 = getelementptr inbounds %struct.Tree, %struct.Tree* %36, i32 0, i32 2
  %38 = load %struct.Tree*, %struct.Tree** %37, align 8
  store %struct.Tree* %38, %struct.Tree** %2, align 8
  br label %50

; <label>:39:                                     ; preds = %29
  %40 = load %struct.Tree*, %struct.Tree** %2, align 8
  %41 = getelementptr inbounds %struct.Tree, %struct.Tree* %40, i32 0, i32 0
  %42 = load i64, i64* %41, align 8
  %43 = load i64, i64* %3, align 8
  %44 = icmp sgt i64 %42, %43
  br i1 %44, label %45, label %49

; <label>:45:                                     ; preds = %39
  %46 = load %struct.Tree*, %struct.Tree** %2, align 8
  %47 = getelementptr inbounds %struct.Tree, %struct.Tree* %46, i32 0, i32 1
  %48 = load %struct.Tree*, %struct.Tree** %47, align 8
  store %struct.Tree* %48, %struct.Tree** %2, align 8
  br label %49

; <label>:49:                                     ; preds = %45, %39
  br label %50

; <label>:50:                                     ; preds = %49, %35
  br label %51

; <label>:51:                                     ; preds = %50
  br label %19

; <label>:52:                                     ; preds = %28, %19
  %53 = load i8, i8* %5, align 1
  %54 = trunc i8 %53 to i1
  br i1 %54, label %55, label %121

; <label>:55:                                     ; preds = %52
  %56 = load %struct.Tree*, %struct.Tree** %2, align 8
  %57 = getelementptr inbounds %struct.Tree, %struct.Tree* %56, i32 0, i32 3
  %58 = load %struct.Tree*, %struct.Tree** %57, align 8
  store %struct.Tree* %58, %struct.Tree** %6, align 8
  %59 = load %struct.Tree*, %struct.Tree** %6, align 8
  %60 = icmp ne %struct.Tree* %59, null
  br i1 %60, label %61, label %117

; <label>:61:                                     ; preds = %55
  %62 = load %struct.Tree*, %struct.Tree** %6, align 8
  %63 = getelementptr inbounds %struct.Tree, %struct.Tree* %62, i32 0, i32 3
  %64 = load %struct.Tree*, %struct.Tree** %63, align 8
  %65 = icmp ne %struct.Tree* %64, null
  br i1 %65, label %66, label %117

; <label>:66:                                     ; preds = %61
  %67 = load %struct.Tree*, %struct.Tree** %6, align 8
  %68 = getelementptr inbounds %struct.Tree, %struct.Tree* %67, i32 0, i32 3
  %69 = load %struct.Tree*, %struct.Tree** %68, align 8
  %70 = getelementptr inbounds %struct.Tree, %struct.Tree* %69, i32 0, i32 1
  %71 = load %struct.Tree*, %struct.Tree** %70, align 8
  %72 = load %struct.Tree*, %struct.Tree** %6, align 8
  %73 = icmp eq %struct.Tree* %71, %72
  br i1 %73, label %74, label %95

; <label>:74:                                     ; preds = %66
  %75 = load %struct.Tree*, %struct.Tree** %6, align 8
  %76 = getelementptr inbounds %struct.Tree, %struct.Tree* %75, i32 0, i32 3
  %77 = load %struct.Tree*, %struct.Tree** %76, align 8
  %78 = getelementptr inbounds %struct.Tree, %struct.Tree* %77, i32 0, i32 2
  %79 = load %struct.Tree*, %struct.Tree** %78, align 8
  %80 = icmp ne %struct.Tree* %79, null
  br i1 %80, label %81, label %91

; <label>:81:                                     ; preds = %74
  %82 = load %struct.Tree*, %struct.Tree** %6, align 8
  %83 = getelementptr inbounds %struct.Tree, %struct.Tree* %82, i32 0, i32 3
  %84 = load %struct.Tree*, %struct.Tree** %83, align 8
  %85 = getelementptr inbounds %struct.Tree, %struct.Tree* %84, i32 0, i32 2
  %86 = load %struct.Tree*, %struct.Tree** %85, align 8
  %87 = getelementptr inbounds %struct.Tree, %struct.Tree* %86, i32 0, i32 0
  %88 = load i64, i64* %87, align 8
  %89 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEx(%"class.std::basic_ostream"* @_ZSt4cout, i64 %88)
  %90 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c(%"class.std::basic_ostream"* dereferenceable(272) %89, i8 signext 10)
  br label %94

; <label>:91:                                     ; preds = %74
  %92 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0))
  %93 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c(%"class.std::basic_ostream"* dereferenceable(272) %92, i8 signext 10)
  br label %94

; <label>:94:                                     ; preds = %91, %81
  br label %116

; <label>:95:                                     ; preds = %66
  %96 = load %struct.Tree*, %struct.Tree** %6, align 8
  %97 = getelementptr inbounds %struct.Tree, %struct.Tree* %96, i32 0, i32 3
  %98 = load %struct.Tree*, %struct.Tree** %97, align 8
  %99 = getelementptr inbounds %struct.Tree, %struct.Tree* %98, i32 0, i32 1
  %100 = load %struct.Tree*, %struct.Tree** %99, align 8
  %101 = icmp ne %struct.Tree* %100, null
  br i1 %101, label %102, label %112

; <label>:102:                                    ; preds = %95
  %103 = load %struct.Tree*, %struct.Tree** %6, align 8
  %104 = getelementptr inbounds %struct.Tree, %struct.Tree* %103, i32 0, i32 3
  %105 = load %struct.Tree*, %struct.Tree** %104, align 8
  %106 = getelementptr inbounds %struct.Tree, %struct.Tree* %105, i32 0, i32 1
  %107 = load %struct.Tree*, %struct.Tree** %106, align 8
  %108 = getelementptr inbounds %struct.Tree, %struct.Tree* %107, i32 0, i32 0
  %109 = load i64, i64* %108, align 8
  %110 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEx(%"class.std::basic_ostream"* @_ZSt4cout, i64 %109)
  %111 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c(%"class.std::basic_ostream"* dereferenceable(272) %110, i8 signext 10)
  br label %115

; <label>:112:                                    ; preds = %95
  %113 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0))
  %114 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c(%"class.std::basic_ostream"* dereferenceable(272) %113, i8 signext 10)
  br label %115

; <label>:115:                                    ; preds = %112, %102
  br label %116

; <label>:116:                                    ; preds = %115, %94
  br label %120

; <label>:117:                                    ; preds = %61, %55
  %118 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0))
  %119 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c(%"class.std::basic_ostream"* dereferenceable(272) %118, i8 signext 10)
  br label %120

; <label>:120:                                    ; preds = %117, %116
  br label %121

; <label>:121:                                    ; preds = %120, %52
  ret void
}

; Function Attrs: noinline optnone sspstrong uwtable
define dso_local void @_Z11left_rotateRP4Tree(%struct.Tree** dereferenceable(8)) #5 {
  %2 = alloca %struct.Tree**, align 8
  %3 = alloca i64, align 8
  %4 = alloca i32, align 4
  %5 = alloca i8, align 1
  %6 = alloca %struct.Tree*, align 8
  %7 = alloca %struct.Tree*, align 8
  store %struct.Tree** %0, %struct.Tree*** %2, align 8
  store i64 0, i64* %3, align 8
  br label %8

; <label>:8:                                      ; preds = %11, %1
  %9 = call i32 @getchar()
  store i32 %9, i32* %4, align 4
  %10 = icmp ne i32 %9, 10
  br i1 %10, label %11, label %19

; <label>:11:                                     ; preds = %8
  %12 = load i32, i32* %4, align 4
  %13 = sub nsw i32 %12, 48
  store i32 %13, i32* %4, align 4
  %14 = load i64, i64* %3, align 8
  %15 = mul nsw i64 %14, 10
  %16 = load i32, i32* %4, align 4
  %17 = sext i32 %16 to i64
  %18 = add nsw i64 %15, %17
  store i64 %18, i64* %3, align 8
  br label %8

; <label>:19:                                     ; preds = %8
  store i8 0, i8* %5, align 1
  %20 = load %struct.Tree**, %struct.Tree*** %2, align 8
  %21 = load %struct.Tree*, %struct.Tree** %20, align 8
  store %struct.Tree* %21, %struct.Tree** %6, align 8
  br label %22

; <label>:22:                                     ; preds = %54, %19
  %23 = load %struct.Tree*, %struct.Tree** %6, align 8
  %24 = icmp ne %struct.Tree* %23, null
  br i1 %24, label %25, label %55

; <label>:25:                                     ; preds = %22
  %26 = load %struct.Tree*, %struct.Tree** %6, align 8
  %27 = getelementptr inbounds %struct.Tree, %struct.Tree* %26, i32 0, i32 0
  %28 = load i64, i64* %27, align 8
  %29 = load i64, i64* %3, align 8
  %30 = icmp eq i64 %28, %29
  br i1 %30, label %31, label %32

; <label>:31:                                     ; preds = %25
  store i8 1, i8* %5, align 1
  br label %55

; <label>:32:                                     ; preds = %25
  %33 = load %struct.Tree*, %struct.Tree** %6, align 8
  %34 = getelementptr inbounds %struct.Tree, %struct.Tree* %33, i32 0, i32 0
  %35 = load i64, i64* %34, align 8
  %36 = load i64, i64* %3, align 8
  %37 = icmp slt i64 %35, %36
  br i1 %37, label %38, label %42

; <label>:38:                                     ; preds = %32
  %39 = load %struct.Tree*, %struct.Tree** %6, align 8
  %40 = getelementptr inbounds %struct.Tree, %struct.Tree* %39, i32 0, i32 2
  %41 = load %struct.Tree*, %struct.Tree** %40, align 8
  store %struct.Tree* %41, %struct.Tree** %6, align 8
  br label %53

; <label>:42:                                     ; preds = %32
  %43 = load %struct.Tree*, %struct.Tree** %6, align 8
  %44 = getelementptr inbounds %struct.Tree, %struct.Tree* %43, i32 0, i32 0
  %45 = load i64, i64* %44, align 8
  %46 = load i64, i64* %3, align 8
  %47 = icmp sgt i64 %45, %46
  br i1 %47, label %48, label %52

; <label>:48:                                     ; preds = %42
  %49 = load %struct.Tree*, %struct.Tree** %6, align 8
  %50 = getelementptr inbounds %struct.Tree, %struct.Tree* %49, i32 0, i32 1
  %51 = load %struct.Tree*, %struct.Tree** %50, align 8
  store %struct.Tree* %51, %struct.Tree** %6, align 8
  br label %52

; <label>:52:                                     ; preds = %48, %42
  br label %53

; <label>:53:                                     ; preds = %52, %38
  br label %54

; <label>:54:                                     ; preds = %53
  br label %22

; <label>:55:                                     ; preds = %31, %22
  %56 = load i8, i8* %5, align 1
  %57 = trunc i8 %56 to i1
  br i1 %57, label %58, label %124

; <label>:58:                                     ; preds = %55
  %59 = load %struct.Tree*, %struct.Tree** %6, align 8
  %60 = getelementptr inbounds %struct.Tree, %struct.Tree* %59, i32 0, i32 2
  %61 = load %struct.Tree*, %struct.Tree** %60, align 8
  %62 = icmp eq %struct.Tree* %61, null
  br i1 %62, label %63, label %64

; <label>:63:                                     ; preds = %58
  br label %126

; <label>:64:                                     ; preds = %58
  %65 = load %struct.Tree*, %struct.Tree** %6, align 8
  %66 = getelementptr inbounds %struct.Tree, %struct.Tree* %65, i32 0, i32 2
  %67 = load %struct.Tree*, %struct.Tree** %66, align 8
  store %struct.Tree* %67, %struct.Tree** %7, align 8
  %68 = load %struct.Tree*, %struct.Tree** %7, align 8
  %69 = getelementptr inbounds %struct.Tree, %struct.Tree* %68, i32 0, i32 1
  %70 = load %struct.Tree*, %struct.Tree** %69, align 8
  %71 = load %struct.Tree*, %struct.Tree** %6, align 8
  %72 = getelementptr inbounds %struct.Tree, %struct.Tree* %71, i32 0, i32 2
  store %struct.Tree* %70, %struct.Tree** %72, align 8
  %73 = load %struct.Tree*, %struct.Tree** %7, align 8
  %74 = getelementptr inbounds %struct.Tree, %struct.Tree* %73, i32 0, i32 1
  %75 = load %struct.Tree*, %struct.Tree** %74, align 8
  %76 = icmp ne %struct.Tree* %75, null
  br i1 %76, label %77, label %83

; <label>:77:                                     ; preds = %64
  %78 = load %struct.Tree*, %struct.Tree** %6, align 8
  %79 = load %struct.Tree*, %struct.Tree** %7, align 8
  %80 = getelementptr inbounds %struct.Tree, %struct.Tree* %79, i32 0, i32 1
  %81 = load %struct.Tree*, %struct.Tree** %80, align 8
  %82 = getelementptr inbounds %struct.Tree, %struct.Tree* %81, i32 0, i32 3
  store %struct.Tree* %78, %struct.Tree** %82, align 8
  br label %83

; <label>:83:                                     ; preds = %77, %64
  %84 = load %struct.Tree*, %struct.Tree** %6, align 8
  %85 = getelementptr inbounds %struct.Tree, %struct.Tree* %84, i32 0, i32 3
  %86 = load %struct.Tree*, %struct.Tree** %85, align 8
  %87 = load %struct.Tree*, %struct.Tree** %7, align 8
  %88 = getelementptr inbounds %struct.Tree, %struct.Tree* %87, i32 0, i32 3
  store %struct.Tree* %86, %struct.Tree** %88, align 8
  %89 = load %struct.Tree*, %struct.Tree** %6, align 8
  %90 = getelementptr inbounds %struct.Tree, %struct.Tree* %89, i32 0, i32 3
  %91 = load %struct.Tree*, %struct.Tree** %90, align 8
  %92 = icmp eq %struct.Tree* %91, null
  br i1 %92, label %93, label %96

; <label>:93:                                     ; preds = %83
  %94 = load %struct.Tree*, %struct.Tree** %7, align 8
  %95 = load %struct.Tree**, %struct.Tree*** %2, align 8
  store %struct.Tree* %94, %struct.Tree** %95, align 8
  br label %117

; <label>:96:                                     ; preds = %83
  %97 = load %struct.Tree*, %struct.Tree** %6, align 8
  %98 = getelementptr inbounds %struct.Tree, %struct.Tree* %97, i32 0, i32 3
  %99 = load %struct.Tree*, %struct.Tree** %98, align 8
  %100 = getelementptr inbounds %struct.Tree, %struct.Tree* %99, i32 0, i32 1
  %101 = load %struct.Tree*, %struct.Tree** %100, align 8
  %102 = load %struct.Tree*, %struct.Tree** %6, align 8
  %103 = icmp eq %struct.Tree* %101, %102
  br i1 %103, label %104, label %110

; <label>:104:                                    ; preds = %96
  %105 = load %struct.Tree*, %struct.Tree** %7, align 8
  %106 = load %struct.Tree*, %struct.Tree** %6, align 8
  %107 = getelementptr inbounds %struct.Tree, %struct.Tree* %106, i32 0, i32 3
  %108 = load %struct.Tree*, %struct.Tree** %107, align 8
  %109 = getelementptr inbounds %struct.Tree, %struct.Tree* %108, i32 0, i32 1
  store %struct.Tree* %105, %struct.Tree** %109, align 8
  br label %116

; <label>:110:                                    ; preds = %96
  %111 = load %struct.Tree*, %struct.Tree** %7, align 8
  %112 = load %struct.Tree*, %struct.Tree** %6, align 8
  %113 = getelementptr inbounds %struct.Tree, %struct.Tree* %112, i32 0, i32 3
  %114 = load %struct.Tree*, %struct.Tree** %113, align 8
  %115 = getelementptr inbounds %struct.Tree, %struct.Tree* %114, i32 0, i32 2
  store %struct.Tree* %111, %struct.Tree** %115, align 8
  br label %116

; <label>:116:                                    ; preds = %110, %104
  br label %117

; <label>:117:                                    ; preds = %116, %93
  %118 = load %struct.Tree*, %struct.Tree** %6, align 8
  %119 = load %struct.Tree*, %struct.Tree** %7, align 8
  %120 = getelementptr inbounds %struct.Tree, %struct.Tree* %119, i32 0, i32 1
  store %struct.Tree* %118, %struct.Tree** %120, align 8
  %121 = load %struct.Tree*, %struct.Tree** %7, align 8
  %122 = load %struct.Tree*, %struct.Tree** %6, align 8
  %123 = getelementptr inbounds %struct.Tree, %struct.Tree* %122, i32 0, i32 3
  store %struct.Tree* %121, %struct.Tree** %123, align 8
  br label %125

; <label>:124:                                    ; preds = %55
  br label %126

; <label>:125:                                    ; preds = %117
  br label %126

; <label>:126:                                    ; preds = %125, %124, %63
  ret void
}

; Function Attrs: noinline optnone sspstrong uwtable
define dso_local void @_Z12right_rotateRP4Tree(%struct.Tree** dereferenceable(8)) #5 {
  %2 = alloca %struct.Tree**, align 8
  %3 = alloca i64, align 8
  %4 = alloca i32, align 4
  %5 = alloca i8, align 1
  %6 = alloca %struct.Tree*, align 8
  %7 = alloca %struct.Tree*, align 8
  store %struct.Tree** %0, %struct.Tree*** %2, align 8
  store i64 0, i64* %3, align 8
  br label %8

; <label>:8:                                      ; preds = %11, %1
  %9 = call i32 @getchar()
  store i32 %9, i32* %4, align 4
  %10 = icmp ne i32 %9, 10
  br i1 %10, label %11, label %19

; <label>:11:                                     ; preds = %8
  %12 = load i32, i32* %4, align 4
  %13 = sub nsw i32 %12, 48
  store i32 %13, i32* %4, align 4
  %14 = load i64, i64* %3, align 8
  %15 = mul nsw i64 %14, 10
  %16 = load i32, i32* %4, align 4
  %17 = sext i32 %16 to i64
  %18 = add nsw i64 %15, %17
  store i64 %18, i64* %3, align 8
  br label %8

; <label>:19:                                     ; preds = %8
  store i8 0, i8* %5, align 1
  %20 = load %struct.Tree**, %struct.Tree*** %2, align 8
  %21 = load %struct.Tree*, %struct.Tree** %20, align 8
  store %struct.Tree* %21, %struct.Tree** %6, align 8
  br label %22

; <label>:22:                                     ; preds = %54, %19
  %23 = load %struct.Tree*, %struct.Tree** %6, align 8
  %24 = icmp ne %struct.Tree* %23, null
  br i1 %24, label %25, label %55

; <label>:25:                                     ; preds = %22
  %26 = load %struct.Tree*, %struct.Tree** %6, align 8
  %27 = getelementptr inbounds %struct.Tree, %struct.Tree* %26, i32 0, i32 0
  %28 = load i64, i64* %27, align 8
  %29 = load i64, i64* %3, align 8
  %30 = icmp eq i64 %28, %29
  br i1 %30, label %31, label %32

; <label>:31:                                     ; preds = %25
  store i8 1, i8* %5, align 1
  br label %55

; <label>:32:                                     ; preds = %25
  %33 = load %struct.Tree*, %struct.Tree** %6, align 8
  %34 = getelementptr inbounds %struct.Tree, %struct.Tree* %33, i32 0, i32 0
  %35 = load i64, i64* %34, align 8
  %36 = load i64, i64* %3, align 8
  %37 = icmp slt i64 %35, %36
  br i1 %37, label %38, label %42

; <label>:38:                                     ; preds = %32
  %39 = load %struct.Tree*, %struct.Tree** %6, align 8
  %40 = getelementptr inbounds %struct.Tree, %struct.Tree* %39, i32 0, i32 2
  %41 = load %struct.Tree*, %struct.Tree** %40, align 8
  store %struct.Tree* %41, %struct.Tree** %6, align 8
  br label %53

; <label>:42:                                     ; preds = %32
  %43 = load %struct.Tree*, %struct.Tree** %6, align 8
  %44 = getelementptr inbounds %struct.Tree, %struct.Tree* %43, i32 0, i32 0
  %45 = load i64, i64* %44, align 8
  %46 = load i64, i64* %3, align 8
  %47 = icmp sgt i64 %45, %46
  br i1 %47, label %48, label %52

; <label>:48:                                     ; preds = %42
  %49 = load %struct.Tree*, %struct.Tree** %6, align 8
  %50 = getelementptr inbounds %struct.Tree, %struct.Tree* %49, i32 0, i32 1
  %51 = load %struct.Tree*, %struct.Tree** %50, align 8
  store %struct.Tree* %51, %struct.Tree** %6, align 8
  br label %52

; <label>:52:                                     ; preds = %48, %42
  br label %53

; <label>:53:                                     ; preds = %52, %38
  br label %54

; <label>:54:                                     ; preds = %53
  br label %22

; <label>:55:                                     ; preds = %31, %22
  %56 = load i8, i8* %5, align 1
  %57 = trunc i8 %56 to i1
  br i1 %57, label %58, label %124

; <label>:58:                                     ; preds = %55
  %59 = load %struct.Tree*, %struct.Tree** %6, align 8
  %60 = getelementptr inbounds %struct.Tree, %struct.Tree* %59, i32 0, i32 1
  %61 = load %struct.Tree*, %struct.Tree** %60, align 8
  %62 = icmp eq %struct.Tree* %61, null
  br i1 %62, label %63, label %64

; <label>:63:                                     ; preds = %58
  br label %126

; <label>:64:                                     ; preds = %58
  %65 = load %struct.Tree*, %struct.Tree** %6, align 8
  %66 = getelementptr inbounds %struct.Tree, %struct.Tree* %65, i32 0, i32 1
  %67 = load %struct.Tree*, %struct.Tree** %66, align 8
  store %struct.Tree* %67, %struct.Tree** %7, align 8
  %68 = load %struct.Tree*, %struct.Tree** %7, align 8
  %69 = getelementptr inbounds %struct.Tree, %struct.Tree* %68, i32 0, i32 2
  %70 = load %struct.Tree*, %struct.Tree** %69, align 8
  %71 = load %struct.Tree*, %struct.Tree** %6, align 8
  %72 = getelementptr inbounds %struct.Tree, %struct.Tree* %71, i32 0, i32 1
  store %struct.Tree* %70, %struct.Tree** %72, align 8
  %73 = load %struct.Tree*, %struct.Tree** %7, align 8
  %74 = getelementptr inbounds %struct.Tree, %struct.Tree* %73, i32 0, i32 2
  %75 = load %struct.Tree*, %struct.Tree** %74, align 8
  %76 = icmp ne %struct.Tree* %75, null
  br i1 %76, label %77, label %83

; <label>:77:                                     ; preds = %64
  %78 = load %struct.Tree*, %struct.Tree** %6, align 8
  %79 = load %struct.Tree*, %struct.Tree** %7, align 8
  %80 = getelementptr inbounds %struct.Tree, %struct.Tree* %79, i32 0, i32 2
  %81 = load %struct.Tree*, %struct.Tree** %80, align 8
  %82 = getelementptr inbounds %struct.Tree, %struct.Tree* %81, i32 0, i32 3
  store %struct.Tree* %78, %struct.Tree** %82, align 8
  br label %83

; <label>:83:                                     ; preds = %77, %64
  %84 = load %struct.Tree*, %struct.Tree** %6, align 8
  %85 = getelementptr inbounds %struct.Tree, %struct.Tree* %84, i32 0, i32 3
  %86 = load %struct.Tree*, %struct.Tree** %85, align 8
  %87 = load %struct.Tree*, %struct.Tree** %7, align 8
  %88 = getelementptr inbounds %struct.Tree, %struct.Tree* %87, i32 0, i32 3
  store %struct.Tree* %86, %struct.Tree** %88, align 8
  %89 = load %struct.Tree*, %struct.Tree** %6, align 8
  %90 = getelementptr inbounds %struct.Tree, %struct.Tree* %89, i32 0, i32 3
  %91 = load %struct.Tree*, %struct.Tree** %90, align 8
  %92 = icmp eq %struct.Tree* %91, null
  br i1 %92, label %93, label %96

; <label>:93:                                     ; preds = %83
  %94 = load %struct.Tree*, %struct.Tree** %7, align 8
  %95 = load %struct.Tree**, %struct.Tree*** %2, align 8
  store %struct.Tree* %94, %struct.Tree** %95, align 8
  br label %117

; <label>:96:                                     ; preds = %83
  %97 = load %struct.Tree*, %struct.Tree** %6, align 8
  %98 = getelementptr inbounds %struct.Tree, %struct.Tree* %97, i32 0, i32 3
  %99 = load %struct.Tree*, %struct.Tree** %98, align 8
  %100 = getelementptr inbounds %struct.Tree, %struct.Tree* %99, i32 0, i32 1
  %101 = load %struct.Tree*, %struct.Tree** %100, align 8
  %102 = load %struct.Tree*, %struct.Tree** %6, align 8
  %103 = icmp eq %struct.Tree* %101, %102
  br i1 %103, label %104, label %110

; <label>:104:                                    ; preds = %96
  %105 = load %struct.Tree*, %struct.Tree** %7, align 8
  %106 = load %struct.Tree*, %struct.Tree** %6, align 8
  %107 = getelementptr inbounds %struct.Tree, %struct.Tree* %106, i32 0, i32 3
  %108 = load %struct.Tree*, %struct.Tree** %107, align 8
  %109 = getelementptr inbounds %struct.Tree, %struct.Tree* %108, i32 0, i32 1
  store %struct.Tree* %105, %struct.Tree** %109, align 8
  br label %116

; <label>:110:                                    ; preds = %96
  %111 = load %struct.Tree*, %struct.Tree** %7, align 8
  %112 = load %struct.Tree*, %struct.Tree** %6, align 8
  %113 = getelementptr inbounds %struct.Tree, %struct.Tree* %112, i32 0, i32 3
  %114 = load %struct.Tree*, %struct.Tree** %113, align 8
  %115 = getelementptr inbounds %struct.Tree, %struct.Tree* %114, i32 0, i32 2
  store %struct.Tree* %111, %struct.Tree** %115, align 8
  br label %116

; <label>:116:                                    ; preds = %110, %104
  br label %117

; <label>:117:                                    ; preds = %116, %93
  %118 = load %struct.Tree*, %struct.Tree** %6, align 8
  %119 = load %struct.Tree*, %struct.Tree** %7, align 8
  %120 = getelementptr inbounds %struct.Tree, %struct.Tree* %119, i32 0, i32 2
  store %struct.Tree* %118, %struct.Tree** %120, align 8
  %121 = load %struct.Tree*, %struct.Tree** %7, align 8
  %122 = load %struct.Tree*, %struct.Tree** %6, align 8
  %123 = getelementptr inbounds %struct.Tree, %struct.Tree* %122, i32 0, i32 3
  store %struct.Tree* %121, %struct.Tree** %123, align 8
  br label %125

; <label>:124:                                    ; preds = %55
  br label %126

; <label>:125:                                    ; preds = %117
  br label %126

; <label>:126:                                    ; preds = %125, %124, %63
  ret void
}

; Function Attrs: noinline norecurse optnone sspstrong uwtable
define dso_local i32 @main() #6 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8, align 1
  %4 = alloca %struct.Tree*, align 8
  store i32 0, i32* %1, align 4
  store i8 0, i8* %3, align 1
  store %struct.Tree* null, %struct.Tree** %4, align 8
  br label %5

; <label>:5:                                      ; preds = %79, %0
  %6 = call i32 @getchar()
  store i32 %6, i32* %2, align 4
  %7 = icmp ne i32 %6, -1
  br i1 %7, label %8, label %80

; <label>:8:                                      ; preds = %5
  %9 = load i32, i32* %2, align 4
  %10 = icmp eq i32 %9, 78
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %8
  call void @_Z10deleteTreeRP4Tree(%struct.Tree** dereferenceable(8) %4)
  store %struct.Tree* null, %struct.Tree** %4, align 8
  %12 = call i32 @getchar()
  store i32 %12, i32* %2, align 4
  call void @_Z10create_setRP4Tree(%struct.Tree** dereferenceable(8) %4)
  br label %79

; <label>:13:                                     ; preds = %8
  %14 = load i32, i32* %2, align 4
  %15 = icmp eq i32 %14, 43
  br i1 %15, label %16, label %18

; <label>:16:                                     ; preds = %13
  %17 = call i32 @getchar()
  store i32 %17, i32* %2, align 4
  call void @_Z11add_elementRP4Tree(%struct.Tree** dereferenceable(8) %4)
  br label %78

; <label>:18:                                     ; preds = %13
  %19 = load i32, i32* %2, align 4
  %20 = icmp eq i32 %19, 62
  br i1 %20, label %21, label %23

; <label>:21:                                     ; preds = %18
  %22 = call i32 @getchar()
  store i32 %22, i32* %2, align 4
  call void @_Z13get_successorRP4Tree(%struct.Tree** dereferenceable(8) %4)
  br label %77

; <label>:23:                                     ; preds = %18
  %24 = load i32, i32* %2, align 4
  %25 = icmp eq i32 %24, 45
  br i1 %25, label %26, label %28

; <label>:26:                                     ; preds = %23
  %27 = call i32 @getchar()
  store i32 %27, i32* %2, align 4
  call void @_Z14delete_elementRP4Tree(%struct.Tree** dereferenceable(8) %4)
  br label %76

; <label>:28:                                     ; preds = %23
  %29 = load i32, i32* %2, align 4
  %30 = icmp eq i32 %29, 83
  br i1 %30, label %31, label %34

; <label>:31:                                     ; preds = %28
  %32 = call i32 @getchar()
  store i32 %32, i32* %2, align 4
  %33 = load %struct.Tree*, %struct.Tree** %4, align 8
  call void @_Z6searchP4Tree(%struct.Tree* %33)
  br label %75

; <label>:34:                                     ; preds = %28
  %35 = load i32, i32* %2, align 4
  %36 = icmp eq i32 %35, 80
  br i1 %36, label %37, label %42

; <label>:37:                                     ; preds = %34
  %38 = call i32 @getchar()
  store i32 %38, i32* %2, align 4
  %39 = load i8, i8* %3, align 1
  %40 = trunc i8 %39 to i1
  call void @_Z15print_pre_orderRP4Treeb(%struct.Tree** dereferenceable(8) %4, i1 zeroext %40)
  store i8 0, i8* %3, align 1
  %41 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8 signext 10)
  br label %74

; <label>:42:                                     ; preds = %34
  %43 = load i32, i32* %2, align 4
  %44 = icmp eq i32 %43, 66
  br i1 %44, label %45, label %47

; <label>:45:                                     ; preds = %42
  call void @_Z10deleteTreeRP4Tree(%struct.Tree** dereferenceable(8) %4)
  store %struct.Tree* null, %struct.Tree** %4, align 8
  %46 = call i32 @getchar()
  store i32 %46, i32* %2, align 4
  call void @_Z10create_setRP4Tree(%struct.Tree** dereferenceable(8) %4)
  br label %73

; <label>:47:                                     ; preds = %42
  %48 = load i32, i32* %2, align 4
  %49 = icmp eq i32 %48, 67
  br i1 %49, label %50, label %53

; <label>:50:                                     ; preds = %47
  %51 = call i32 @getchar()
  store i32 %51, i32* %2, align 4
  %52 = load %struct.Tree*, %struct.Tree** %4, align 8
  call void @_Z14print_childrenP4Tree(%struct.Tree* %52)
  br label %72

; <label>:53:                                     ; preds = %47
  %54 = load i32, i32* %2, align 4
  %55 = icmp eq i32 %54, 85
  br i1 %55, label %56, label %59

; <label>:56:                                     ; preds = %53
  %57 = call i32 @getchar()
  store i32 %57, i32* %2, align 4
  %58 = load %struct.Tree*, %struct.Tree** %4, align 8
  call void @_Z11print_uncleP4Tree(%struct.Tree* %58)
  br label %71

; <label>:59:                                     ; preds = %53
  %60 = load i32, i32* %2, align 4
  %61 = icmp eq i32 %60, 76
  br i1 %61, label %62, label %64

; <label>:62:                                     ; preds = %59
  %63 = call i32 @getchar()
  store i32 %63, i32* %2, align 4
  call void @_Z11left_rotateRP4Tree(%struct.Tree** dereferenceable(8) %4)
  br label %70

; <label>:64:                                     ; preds = %59
  %65 = load i32, i32* %2, align 4
  %66 = icmp eq i32 %65, 82
  br i1 %66, label %67, label %69

; <label>:67:                                     ; preds = %64
  %68 = call i32 @getchar()
  store i32 %68, i32* %2, align 4
  call void @_Z12right_rotateRP4Tree(%struct.Tree** dereferenceable(8) %4)
  br label %69

; <label>:69:                                     ; preds = %67, %64
  br label %70

; <label>:70:                                     ; preds = %69, %62
  br label %71

; <label>:71:                                     ; preds = %70, %56
  br label %72

; <label>:72:                                     ; preds = %71, %50
  br label %73

; <label>:73:                                     ; preds = %72, %45
  br label %74

; <label>:74:                                     ; preds = %73, %37
  br label %75

; <label>:75:                                     ; preds = %74, %31
  br label %76

; <label>:76:                                     ; preds = %75, %26
  br label %77

; <label>:77:                                     ; preds = %76, %21
  br label %78

; <label>:78:                                     ; preds = %77, %16
  br label %79

; <label>:79:                                     ; preds = %78, %11
  br label %5

; <label>:80:                                     ; preds = %5
  call void @_Z10deleteTreeRP4Tree(%struct.Tree** dereferenceable(8) %4)
  ret i32 0
}

; Function Attrs: noinline sspstrong uwtable
define internal void @_GLOBAL__sub_I_hello.cpp() #0 section ".text.startup" {
  call void @__cxx_global_var_init()
  ret void
}

attributes #0 = { noinline sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noinline nounwind optnone sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noinline optnone sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noinline norecurse optnone sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{!"clang version 8.0.0 (tags/RELEASE_800/final)"}
