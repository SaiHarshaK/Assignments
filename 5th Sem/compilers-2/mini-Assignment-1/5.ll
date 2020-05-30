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
%struct.Adjacency = type { i32, i8, i8, %struct.Node*, %struct.Adjacency* }
%struct.Node = type { i32, %struct.Node* }
%struct.Queue = type { i32, %struct.Node_queue*, %struct.Node_queue* }
%struct.Node_queue = type { i32, %struct.Node_queue* }
%"class.std::vector" = type { %"struct.std::_Vector_base" }
%"struct.std::_Vector_base" = type { %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl" }
%"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl" = type { %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data" }
%"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data" = type { i32*, i32*, i32* }
%"class.__gnu_cxx::__normal_iterator" = type { i32* }
%"class.std::allocator" = type { i8 }
%"class.__gnu_cxx::new_allocator" = type { i8 }
%"struct.std::integral_constant" = type { i8 }

$_ZNSt6vectorIiSaIiEE5clearEv = comdat any

$_ZNSt6vectorIiSaIiEE9push_backEOi = comdat any

$_ZNSt6vectorIiSaIiEEixEm = comdat any

$_ZNSt6vectorIiSaIiEE9push_backERKi = comdat any

$_ZNSt6vectorIiSaIiEE4backEv = comdat any

$_ZNKSt6vectorIiSaIiEE4sizeEv = comdat any

$_ZNSt6vectorIiSaIiEEC2Ev = comdat any

$_ZNSt6vectorIiSaIiEED2Ev = comdat any

$_ZNSt12_Vector_baseIiSaIiEEC2Ev = comdat any

$_ZNSt12_Vector_baseIiSaIiEE12_Vector_implC2Ev = comdat any

$_ZNSaIiEC2Ev = comdat any

$_ZNSt12_Vector_baseIiSaIiEE17_Vector_impl_dataC2Ev = comdat any

$_ZN9__gnu_cxx13new_allocatorIiEC2Ev = comdat any

$_ZNSt6vectorIiSaIiEE15_M_erase_at_endEPi = comdat any

$_ZSt8_DestroyIPiiEvT_S1_RSaIT0_E = comdat any

$_ZNSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv = comdat any

$__clang_call_terminate = comdat any

$_ZSt8_DestroyIPiEvT_S1_ = comdat any

$_ZNSt12_Destroy_auxILb1EE9__destroyIPiEEvT_S3_ = comdat any

$_ZNSt6vectorIiSaIiEE12emplace_backIJiEEEvDpOT_ = comdat any

$_ZSt4moveIRiEONSt16remove_referenceIT_E4typeEOS2_ = comdat any

$_ZNSt16allocator_traitsISaIiEE9constructIiJiEEEvRS0_PT_DpOT0_ = comdat any

$_ZSt7forwardIiEOT_RNSt16remove_referenceIS0_E4typeE = comdat any

$_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_ = comdat any

$_ZNSt6vectorIiSaIiEE3endEv = comdat any

$_ZN9__gnu_cxx13new_allocatorIiE9constructIiJiEEEvPT_DpOT0_ = comdat any

$_ZNKSt6vectorIiSaIiEE12_M_check_lenEmPKc = comdat any

$_ZN9__gnu_cxxmiIPiSt6vectorIiSaIiEEEENS_17__normal_iteratorIT_T0_E15difference_typeERKS8_SB_ = comdat any

$_ZNSt6vectorIiSaIiEE5beginEv = comdat any

$_ZNSt12_Vector_baseIiSaIiEE11_M_allocateEm = comdat any

$_ZNSt6vectorIiSaIiEE11_S_relocateEPiS2_S2_RS0_ = comdat any

$_ZNK9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEE4baseEv = comdat any

$_ZNSt12_Vector_baseIiSaIiEE13_M_deallocateEPim = comdat any

$_ZNKSt6vectorIiSaIiEE8max_sizeEv = comdat any

$_ZSt3maxImERKT_S2_S2_ = comdat any

$_ZNSt6vectorIiSaIiEE11_S_max_sizeERKS0_ = comdat any

$_ZNKSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv = comdat any

$_ZNSt16allocator_traitsISaIiEE8max_sizeERKS0_ = comdat any

$_ZSt3minImERKT_S2_S2_ = comdat any

$_ZNK9__gnu_cxx13new_allocatorIiE8max_sizeEv = comdat any

$_ZN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEC2ERKS1_ = comdat any

$_ZNSt16allocator_traitsISaIiEE8allocateERS0_m = comdat any

$_ZN9__gnu_cxx13new_allocatorIiE8allocateEmPKv = comdat any

$_ZNSt6vectorIiSaIiEE14_S_do_relocateEPiS2_S2_RS0_St17integral_constantIbLb1EE = comdat any

$_ZSt12__relocate_aIPiS0_SaIiEET0_T_S3_S2_RT1_ = comdat any

$_ZSt14__relocate_a_1IiiENSt9enable_ifIXsr3std24__is_bitwise_relocatableIT_EE5valueEPS1_E4typeES2_S2_S2_RSaIT0_E = comdat any

$_ZSt12__niter_baseIPiET_S1_ = comdat any

$_ZNSt16allocator_traitsISaIiEE10deallocateERS0_Pim = comdat any

$_ZN9__gnu_cxx13new_allocatorIiE10deallocateEPim = comdat any

$_ZNSt16allocator_traitsISaIiEE9constructIiJRKiEEEvRS0_PT_DpOT0_ = comdat any

$_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_ = comdat any

$_ZN9__gnu_cxx13new_allocatorIiE9constructIiJRKiEEEvPT_DpOT0_ = comdat any

$_ZSt7forwardIRKiEOT_RNSt16remove_referenceIS2_E4typeE = comdat any

$_ZNK9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEmiEl = comdat any

$_ZNK9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEdeEv = comdat any

$_ZNSt12_Vector_baseIiSaIiEED2Ev = comdat any

$_ZNSt12_Vector_baseIiSaIiEE12_Vector_implD2Ev = comdat any

$_ZNSaIiED2Ev = comdat any

$_ZN9__gnu_cxx13new_allocatorIiED2Ev = comdat any

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external hidden global i8
@_ZSt4cout = external global %"class.std::basic_ostream", align 8
@.str = private unnamed_addr constant [2 x i8] c"0\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"1\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"-1\00", align 1
@.str.4 = private unnamed_addr constant [26 x i8] c"vector::_M_realloc_insert\00", align 1
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

; Function Attrs: noinline optnone sspstrong uwtable
define dso_local void @_Z9get_inputRi(i32* dereferenceable(4)) #4 {
  %2 = alloca i32*, align 8
  %3 = alloca i32, align 4
  store i32* %0, i32** %2, align 8
  %4 = load i32*, i32** %2, align 8
  store i32 0, i32* %4, align 4
  br label %5

; <label>:5:                                      ; preds = %8, %1
  %6 = call i32 @getchar()
  store i32 %6, i32* %3, align 4
  %7 = icmp ne i32 %6, 10
  br i1 %7, label %8, label %17

; <label>:8:                                      ; preds = %5
  %9 = load i32, i32* %3, align 4
  %10 = sub nsw i32 %9, 48
  store i32 %10, i32* %3, align 4
  %11 = load i32*, i32** %2, align 8
  %12 = load i32, i32* %11, align 4
  %13 = mul nsw i32 %12, 10
  %14 = load i32, i32* %3, align 4
  %15 = add nsw i32 %13, %14
  %16 = load i32*, i32** %2, align 8
  store i32 %15, i32* %16, align 4
  br label %5

; <label>:17:                                     ; preds = %5
  ret void
}

declare i32 @getchar() #1

; Function Attrs: noinline optnone sspstrong uwtable
define dso_local void @_Z15input_adjacencyRP9Adjacency(%struct.Adjacency** dereferenceable(8)) #4 {
  %2 = alloca %struct.Adjacency**, align 8
  %3 = alloca i32, align 4
  %4 = alloca i8, align 1
  %5 = alloca i32, align 4
  %6 = alloca %struct.Adjacency*, align 8
  %7 = alloca %struct.Adjacency*, align 8
  %8 = alloca %struct.Node*, align 8
  %9 = alloca %struct.Node*, align 8
  %10 = alloca %struct.Node*, align 8
  %11 = alloca %struct.Node*, align 8
  store %struct.Adjacency** %0, %struct.Adjacency*** %2, align 8
  store i32 0, i32* %3, align 4
  store i8 1, i8* %4, align 1
  %12 = load %struct.Adjacency**, %struct.Adjacency*** %2, align 8
  %13 = load %struct.Adjacency*, %struct.Adjacency** %12, align 8
  store %struct.Adjacency* %13, %struct.Adjacency** %6, align 8
  %14 = call noalias i8* @malloc(i64 24) #3
  %15 = bitcast i8* %14 to %struct.Adjacency*
  store %struct.Adjacency* %15, %struct.Adjacency** %7, align 8
  %16 = load %struct.Adjacency*, %struct.Adjacency** %7, align 8
  %17 = getelementptr inbounds %struct.Adjacency, %struct.Adjacency* %16, i32 0, i32 3
  store %struct.Node* null, %struct.Node** %17, align 8
  %18 = load %struct.Adjacency*, %struct.Adjacency** %7, align 8
  %19 = getelementptr inbounds %struct.Adjacency, %struct.Adjacency* %18, i32 0, i32 4
  store %struct.Adjacency* null, %struct.Adjacency** %19, align 8
  %20 = load %struct.Adjacency*, %struct.Adjacency** %7, align 8
  %21 = getelementptr inbounds %struct.Adjacency, %struct.Adjacency* %20, i32 0, i32 1
  store i8 0, i8* %21, align 4
  %22 = load %struct.Adjacency*, %struct.Adjacency** %7, align 8
  %23 = getelementptr inbounds %struct.Adjacency, %struct.Adjacency* %22, i32 0, i32 2
  store i8 0, i8* %23, align 1
  %24 = load %struct.Adjacency**, %struct.Adjacency*** %2, align 8
  %25 = load %struct.Adjacency*, %struct.Adjacency** %24, align 8
  %26 = icmp eq %struct.Adjacency* %25, null
  br i1 %26, label %27, label %32

; <label>:27:                                     ; preds = %1
  %28 = load %struct.Adjacency*, %struct.Adjacency** %7, align 8
  %29 = load %struct.Adjacency**, %struct.Adjacency*** %2, align 8
  store %struct.Adjacency* %28, %struct.Adjacency** %29, align 8
  %30 = load %struct.Adjacency**, %struct.Adjacency*** %2, align 8
  %31 = load %struct.Adjacency*, %struct.Adjacency** %30, align 8
  store %struct.Adjacency* %31, %struct.Adjacency** %6, align 8
  br label %49

; <label>:32:                                     ; preds = %1
  br label %33

; <label>:33:                                     ; preds = %38, %32
  %34 = load %struct.Adjacency*, %struct.Adjacency** %6, align 8
  %35 = getelementptr inbounds %struct.Adjacency, %struct.Adjacency* %34, i32 0, i32 4
  %36 = load %struct.Adjacency*, %struct.Adjacency** %35, align 8
  %37 = icmp ne %struct.Adjacency* %36, null
  br i1 %37, label %38, label %42

; <label>:38:                                     ; preds = %33
  %39 = load %struct.Adjacency*, %struct.Adjacency** %6, align 8
  %40 = getelementptr inbounds %struct.Adjacency, %struct.Adjacency* %39, i32 0, i32 4
  %41 = load %struct.Adjacency*, %struct.Adjacency** %40, align 8
  store %struct.Adjacency* %41, %struct.Adjacency** %6, align 8
  br label %33

; <label>:42:                                     ; preds = %33
  %43 = load %struct.Adjacency*, %struct.Adjacency** %7, align 8
  %44 = load %struct.Adjacency*, %struct.Adjacency** %6, align 8
  %45 = getelementptr inbounds %struct.Adjacency, %struct.Adjacency* %44, i32 0, i32 4
  store %struct.Adjacency* %43, %struct.Adjacency** %45, align 8
  %46 = load %struct.Adjacency*, %struct.Adjacency** %6, align 8
  %47 = getelementptr inbounds %struct.Adjacency, %struct.Adjacency* %46, i32 0, i32 4
  %48 = load %struct.Adjacency*, %struct.Adjacency** %47, align 8
  store %struct.Adjacency* %48, %struct.Adjacency** %6, align 8
  br label %49

; <label>:49:                                     ; preds = %42, %27
  br label %50

; <label>:50:                                     ; preds = %97, %96, %59, %49
  %51 = call i32 @getchar()
  store i32 %51, i32* %5, align 4
  %52 = icmp ne i32 %51, 10
  br i1 %52, label %53, label %104

; <label>:53:                                     ; preds = %50
  %54 = load i32, i32* %5, align 4
  %55 = icmp eq i32 %54, 32
  br i1 %55, label %56, label %97

; <label>:56:                                     ; preds = %53
  %57 = load i8, i8* %4, align 1
  %58 = trunc i8 %57 to i1
  br i1 %58, label %59, label %63

; <label>:59:                                     ; preds = %56
  store i8 0, i8* %4, align 1
  %60 = load i32, i32* %3, align 4
  %61 = load %struct.Adjacency*, %struct.Adjacency** %6, align 8
  %62 = getelementptr inbounds %struct.Adjacency, %struct.Adjacency* %61, i32 0, i32 0
  store i32 %60, i32* %62, align 8
  store i32 0, i32* %3, align 4
  br label %50

; <label>:63:                                     ; preds = %56
  %64 = call noalias i8* @malloc(i64 16) #3
  %65 = bitcast i8* %64 to %struct.Node*
  store %struct.Node* %65, %struct.Node** %8, align 8
  %66 = load i32, i32* %3, align 4
  %67 = load %struct.Node*, %struct.Node** %8, align 8
  %68 = getelementptr inbounds %struct.Node, %struct.Node* %67, i32 0, i32 0
  store i32 %66, i32* %68, align 8
  %69 = load %struct.Node*, %struct.Node** %8, align 8
  %70 = getelementptr inbounds %struct.Node, %struct.Node* %69, i32 0, i32 1
  store %struct.Node* null, %struct.Node** %70, align 8
  %71 = load %struct.Adjacency*, %struct.Adjacency** %6, align 8
  %72 = getelementptr inbounds %struct.Adjacency, %struct.Adjacency* %71, i32 0, i32 3
  %73 = load %struct.Node*, %struct.Node** %72, align 8
  %74 = icmp ne %struct.Node* %73, null
  br i1 %74, label %75, label %92

; <label>:75:                                     ; preds = %63
  %76 = load %struct.Adjacency*, %struct.Adjacency** %6, align 8
  %77 = getelementptr inbounds %struct.Adjacency, %struct.Adjacency* %76, i32 0, i32 3
  %78 = load %struct.Node*, %struct.Node** %77, align 8
  store %struct.Node* %78, %struct.Node** %9, align 8
  br label %79

; <label>:79:                                     ; preds = %84, %75
  %80 = load %struct.Node*, %struct.Node** %9, align 8
  %81 = getelementptr inbounds %struct.Node, %struct.Node* %80, i32 0, i32 1
  %82 = load %struct.Node*, %struct.Node** %81, align 8
  %83 = icmp ne %struct.Node* %82, null
  br i1 %83, label %84, label %88

; <label>:84:                                     ; preds = %79
  %85 = load %struct.Node*, %struct.Node** %9, align 8
  %86 = getelementptr inbounds %struct.Node, %struct.Node* %85, i32 0, i32 1
  %87 = load %struct.Node*, %struct.Node** %86, align 8
  store %struct.Node* %87, %struct.Node** %9, align 8
  br label %79

; <label>:88:                                     ; preds = %79
  %89 = load %struct.Node*, %struct.Node** %8, align 8
  %90 = load %struct.Node*, %struct.Node** %9, align 8
  %91 = getelementptr inbounds %struct.Node, %struct.Node* %90, i32 0, i32 1
  store %struct.Node* %89, %struct.Node** %91, align 8
  br label %96

; <label>:92:                                     ; preds = %63
  %93 = load %struct.Node*, %struct.Node** %8, align 8
  %94 = load %struct.Adjacency*, %struct.Adjacency** %6, align 8
  %95 = getelementptr inbounds %struct.Adjacency, %struct.Adjacency* %94, i32 0, i32 3
  store %struct.Node* %93, %struct.Node** %95, align 8
  br label %96

; <label>:96:                                     ; preds = %92, %88
  store i32 0, i32* %3, align 4
  br label %50

; <label>:97:                                     ; preds = %53
  %98 = load i32, i32* %5, align 4
  %99 = sub nsw i32 %98, 48
  store i32 %99, i32* %5, align 4
  %100 = load i32, i32* %3, align 4
  %101 = mul nsw i32 %100, 10
  %102 = load i32, i32* %5, align 4
  %103 = add nsw i32 %101, %102
  store i32 %103, i32* %3, align 4
  br label %50

; <label>:104:                                    ; preds = %50
  %105 = call noalias i8* @malloc(i64 16) #3
  %106 = bitcast i8* %105 to %struct.Node*
  store %struct.Node* %106, %struct.Node** %10, align 8
  %107 = load i32, i32* %3, align 4
  %108 = load %struct.Node*, %struct.Node** %10, align 8
  %109 = getelementptr inbounds %struct.Node, %struct.Node* %108, i32 0, i32 0
  store i32 %107, i32* %109, align 8
  %110 = load %struct.Node*, %struct.Node** %10, align 8
  %111 = getelementptr inbounds %struct.Node, %struct.Node* %110, i32 0, i32 1
  store %struct.Node* null, %struct.Node** %111, align 8
  %112 = load %struct.Adjacency*, %struct.Adjacency** %6, align 8
  %113 = getelementptr inbounds %struct.Adjacency, %struct.Adjacency* %112, i32 0, i32 3
  %114 = load %struct.Node*, %struct.Node** %113, align 8
  %115 = icmp ne %struct.Node* %114, null
  br i1 %115, label %116, label %133

; <label>:116:                                    ; preds = %104
  %117 = load %struct.Adjacency*, %struct.Adjacency** %6, align 8
  %118 = getelementptr inbounds %struct.Adjacency, %struct.Adjacency* %117, i32 0, i32 3
  %119 = load %struct.Node*, %struct.Node** %118, align 8
  store %struct.Node* %119, %struct.Node** %11, align 8
  br label %120

; <label>:120:                                    ; preds = %125, %116
  %121 = load %struct.Node*, %struct.Node** %11, align 8
  %122 = getelementptr inbounds %struct.Node, %struct.Node* %121, i32 0, i32 1
  %123 = load %struct.Node*, %struct.Node** %122, align 8
  %124 = icmp ne %struct.Node* %123, null
  br i1 %124, label %125, label %129

; <label>:125:                                    ; preds = %120
  %126 = load %struct.Node*, %struct.Node** %11, align 8
  %127 = getelementptr inbounds %struct.Node, %struct.Node* %126, i32 0, i32 1
  %128 = load %struct.Node*, %struct.Node** %127, align 8
  store %struct.Node* %128, %struct.Node** %11, align 8
  br label %120

; <label>:129:                                    ; preds = %120
  %130 = load %struct.Node*, %struct.Node** %10, align 8
  %131 = load %struct.Node*, %struct.Node** %11, align 8
  %132 = getelementptr inbounds %struct.Node, %struct.Node* %131, i32 0, i32 1
  store %struct.Node* %130, %struct.Node** %132, align 8
  br label %137

; <label>:133:                                    ; preds = %104
  %134 = load %struct.Node*, %struct.Node** %10, align 8
  %135 = load %struct.Adjacency*, %struct.Adjacency** %6, align 8
  %136 = getelementptr inbounds %struct.Adjacency, %struct.Adjacency* %135, i32 0, i32 3
  store %struct.Node* %134, %struct.Node** %136, align 8
  br label %137

; <label>:137:                                    ; preds = %133, %129
  ret void
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local void @_Z15delete_adj_listRP9Adjacency(%struct.Adjacency** dereferenceable(8)) #5 {
  %2 = alloca %struct.Adjacency**, align 8
  %3 = alloca %struct.Adjacency*, align 8
  %4 = alloca %struct.Node*, align 8
  store %struct.Adjacency** %0, %struct.Adjacency*** %2, align 8
  %5 = load %struct.Adjacency**, %struct.Adjacency*** %2, align 8
  %6 = load %struct.Adjacency*, %struct.Adjacency** %5, align 8
  store %struct.Adjacency* %6, %struct.Adjacency** %3, align 8
  br label %7

; <label>:7:                                      ; preds = %37, %1
  %8 = load %struct.Adjacency**, %struct.Adjacency*** %2, align 8
  %9 = load %struct.Adjacency*, %struct.Adjacency** %8, align 8
  %10 = icmp ne %struct.Adjacency* %9, null
  br i1 %10, label %11, label %40

; <label>:11:                                     ; preds = %7
  %12 = load %struct.Adjacency**, %struct.Adjacency*** %2, align 8
  %13 = load %struct.Adjacency*, %struct.Adjacency** %12, align 8
  store %struct.Adjacency* %13, %struct.Adjacency** %3, align 8
  %14 = load %struct.Adjacency**, %struct.Adjacency*** %2, align 8
  %15 = load %struct.Adjacency*, %struct.Adjacency** %14, align 8
  %16 = getelementptr inbounds %struct.Adjacency, %struct.Adjacency* %15, i32 0, i32 4
  %17 = load %struct.Adjacency*, %struct.Adjacency** %16, align 8
  %18 = load %struct.Adjacency**, %struct.Adjacency*** %2, align 8
  store %struct.Adjacency* %17, %struct.Adjacency** %18, align 8
  br label %19

; <label>:19:                                     ; preds = %24, %11
  %20 = load %struct.Adjacency*, %struct.Adjacency** %3, align 8
  %21 = getelementptr inbounds %struct.Adjacency, %struct.Adjacency* %20, i32 0, i32 3
  %22 = load %struct.Node*, %struct.Node** %21, align 8
  %23 = icmp ne %struct.Node* %22, null
  br i1 %23, label %24, label %37

; <label>:24:                                     ; preds = %19
  %25 = load %struct.Adjacency*, %struct.Adjacency** %3, align 8
  %26 = getelementptr inbounds %struct.Adjacency, %struct.Adjacency* %25, i32 0, i32 3
  %27 = load %struct.Node*, %struct.Node** %26, align 8
  store %struct.Node* %27, %struct.Node** %4, align 8
  %28 = load %struct.Adjacency*, %struct.Adjacency** %3, align 8
  %29 = getelementptr inbounds %struct.Adjacency, %struct.Adjacency* %28, i32 0, i32 3
  %30 = load %struct.Node*, %struct.Node** %29, align 8
  %31 = getelementptr inbounds %struct.Node, %struct.Node* %30, i32 0, i32 1
  %32 = load %struct.Node*, %struct.Node** %31, align 8
  %33 = load %struct.Adjacency*, %struct.Adjacency** %3, align 8
  %34 = getelementptr inbounds %struct.Adjacency, %struct.Adjacency* %33, i32 0, i32 3
  store %struct.Node* %32, %struct.Node** %34, align 8
  %35 = load %struct.Node*, %struct.Node** %4, align 8
  %36 = bitcast %struct.Node* %35 to i8*
  call void @free(i8* %36) #3
  br label %19

; <label>:37:                                     ; preds = %19
  %38 = load %struct.Adjacency*, %struct.Adjacency** %3, align 8
  %39 = bitcast %struct.Adjacency* %38 to i8*
  call void @free(i8* %39) #3
  br label %7

; <label>:40:                                     ; preds = %7
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local void @_Z12create_queueRP5Queue(%struct.Queue** dereferenceable(8)) #5 {
  %2 = alloca %struct.Queue**, align 8
  store %struct.Queue** %0, %struct.Queue*** %2, align 8
  %3 = call noalias i8* @malloc(i64 24) #3
  %4 = bitcast i8* %3 to %struct.Queue*
  %5 = load %struct.Queue**, %struct.Queue*** %2, align 8
  store %struct.Queue* %4, %struct.Queue** %5, align 8
  %6 = load %struct.Queue**, %struct.Queue*** %2, align 8
  %7 = load %struct.Queue*, %struct.Queue** %6, align 8
  %8 = getelementptr inbounds %struct.Queue, %struct.Queue* %7, i32 0, i32 0
  store i32 0, i32* %8, align 8
  %9 = load %struct.Queue**, %struct.Queue*** %2, align 8
  %10 = load %struct.Queue*, %struct.Queue** %9, align 8
  %11 = getelementptr inbounds %struct.Queue, %struct.Queue* %10, i32 0, i32 1
  store %struct.Node_queue* null, %struct.Node_queue** %11, align 8
  %12 = load %struct.Queue**, %struct.Queue*** %2, align 8
  %13 = load %struct.Queue*, %struct.Queue** %12, align 8
  %14 = getelementptr inbounds %struct.Queue, %struct.Queue* %13, i32 0, i32 2
  store %struct.Node_queue* null, %struct.Node_queue** %14, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local zeroext i1 @_Z8is_emptyP5Queue(%struct.Queue*) #5 {
  %2 = alloca %struct.Queue*, align 8
  store %struct.Queue* %0, %struct.Queue** %2, align 8
  %3 = load %struct.Queue*, %struct.Queue** %2, align 8
  %4 = getelementptr inbounds %struct.Queue, %struct.Queue* %3, i32 0, i32 1
  %5 = load %struct.Node_queue*, %struct.Node_queue** %4, align 8
  %6 = icmp eq %struct.Node_queue* %5, null
  ret i1 %6
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local void @_Z7enqueueRP5Queuei(%struct.Queue** dereferenceable(8), i32) #5 {
  %3 = alloca %struct.Queue**, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.Node_queue*, align 8
  store %struct.Queue** %0, %struct.Queue*** %3, align 8
  store i32 %1, i32* %4, align 4
  %6 = call noalias i8* @malloc(i64 16) #3
  %7 = bitcast i8* %6 to %struct.Node_queue*
  store %struct.Node_queue* %7, %struct.Node_queue** %5, align 8
  %8 = load i32, i32* %4, align 4
  %9 = load %struct.Node_queue*, %struct.Node_queue** %5, align 8
  %10 = getelementptr inbounds %struct.Node_queue, %struct.Node_queue* %9, i32 0, i32 0
  store i32 %8, i32* %10, align 8
  %11 = load %struct.Node_queue*, %struct.Node_queue** %5, align 8
  %12 = getelementptr inbounds %struct.Node_queue, %struct.Node_queue* %11, i32 0, i32 1
  store %struct.Node_queue* null, %struct.Node_queue** %12, align 8
  %13 = load %struct.Queue**, %struct.Queue*** %3, align 8
  %14 = load %struct.Queue*, %struct.Queue** %13, align 8
  %15 = getelementptr inbounds %struct.Queue, %struct.Queue* %14, i32 0, i32 0
  %16 = load i32, i32* %15, align 8
  %17 = add nsw i32 %16, 1
  store i32 %17, i32* %15, align 8
  %18 = load %struct.Queue**, %struct.Queue*** %3, align 8
  %19 = load %struct.Queue*, %struct.Queue** %18, align 8
  %20 = call zeroext i1 @_Z8is_emptyP5Queue(%struct.Queue* %19)
  br i1 %20, label %32, label %21

; <label>:21:                                     ; preds = %2
  %22 = load %struct.Node_queue*, %struct.Node_queue** %5, align 8
  %23 = load %struct.Queue**, %struct.Queue*** %3, align 8
  %24 = load %struct.Queue*, %struct.Queue** %23, align 8
  %25 = getelementptr inbounds %struct.Queue, %struct.Queue* %24, i32 0, i32 2
  %26 = load %struct.Node_queue*, %struct.Node_queue** %25, align 8
  %27 = getelementptr inbounds %struct.Node_queue, %struct.Node_queue* %26, i32 0, i32 1
  store %struct.Node_queue* %22, %struct.Node_queue** %27, align 8
  %28 = load %struct.Node_queue*, %struct.Node_queue** %5, align 8
  %29 = load %struct.Queue**, %struct.Queue*** %3, align 8
  %30 = load %struct.Queue*, %struct.Queue** %29, align 8
  %31 = getelementptr inbounds %struct.Queue, %struct.Queue* %30, i32 0, i32 2
  store %struct.Node_queue* %28, %struct.Node_queue** %31, align 8
  br label %41

; <label>:32:                                     ; preds = %2
  %33 = load %struct.Node_queue*, %struct.Node_queue** %5, align 8
  %34 = load %struct.Queue**, %struct.Queue*** %3, align 8
  %35 = load %struct.Queue*, %struct.Queue** %34, align 8
  %36 = getelementptr inbounds %struct.Queue, %struct.Queue* %35, i32 0, i32 1
  store %struct.Node_queue* %33, %struct.Node_queue** %36, align 8
  %37 = load %struct.Node_queue*, %struct.Node_queue** %5, align 8
  %38 = load %struct.Queue**, %struct.Queue*** %3, align 8
  %39 = load %struct.Queue*, %struct.Queue** %38, align 8
  %40 = getelementptr inbounds %struct.Queue, %struct.Queue* %39, i32 0, i32 2
  store %struct.Node_queue* %37, %struct.Node_queue** %40, align 8
  br label %41

; <label>:41:                                     ; preds = %32, %21
  ret void
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local i32 @_Z7dequeueRP5Queue(%struct.Queue** dereferenceable(8)) #5 {
  %2 = alloca %struct.Queue**, align 8
  %3 = alloca %struct.Node_queue*, align 8
  %4 = alloca i32, align 4
  store %struct.Queue** %0, %struct.Queue*** %2, align 8
  %5 = load %struct.Queue**, %struct.Queue*** %2, align 8
  %6 = load %struct.Queue*, %struct.Queue** %5, align 8
  %7 = getelementptr inbounds %struct.Queue, %struct.Queue* %6, i32 0, i32 1
  %8 = load %struct.Node_queue*, %struct.Node_queue** %7, align 8
  store %struct.Node_queue* %8, %struct.Node_queue** %3, align 8
  %9 = load %struct.Node_queue*, %struct.Node_queue** %3, align 8
  %10 = getelementptr inbounds %struct.Node_queue, %struct.Node_queue* %9, i32 0, i32 0
  %11 = load i32, i32* %10, align 8
  store i32 %11, i32* %4, align 4
  %12 = load %struct.Queue**, %struct.Queue*** %2, align 8
  %13 = load %struct.Queue*, %struct.Queue** %12, align 8
  %14 = getelementptr inbounds %struct.Queue, %struct.Queue* %13, i32 0, i32 0
  %15 = load i32, i32* %14, align 8
  %16 = add nsw i32 %15, -1
  store i32 %16, i32* %14, align 8
  %17 = load %struct.Queue**, %struct.Queue*** %2, align 8
  %18 = load %struct.Queue*, %struct.Queue** %17, align 8
  %19 = getelementptr inbounds %struct.Queue, %struct.Queue* %18, i32 0, i32 1
  %20 = load %struct.Node_queue*, %struct.Node_queue** %19, align 8
  %21 = getelementptr inbounds %struct.Node_queue, %struct.Node_queue* %20, i32 0, i32 1
  %22 = load %struct.Node_queue*, %struct.Node_queue** %21, align 8
  %23 = load %struct.Queue**, %struct.Queue*** %2, align 8
  %24 = load %struct.Queue*, %struct.Queue** %23, align 8
  %25 = getelementptr inbounds %struct.Queue, %struct.Queue* %24, i32 0, i32 1
  store %struct.Node_queue* %22, %struct.Node_queue** %25, align 8
  %26 = load %struct.Node_queue*, %struct.Node_queue** %3, align 8
  %27 = bitcast %struct.Node_queue* %26 to i8*
  call void @free(i8* %27) #3
  %28 = load i32, i32* %4, align 4
  ret i32 %28
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local void @_Z11reset_colorP9Adjacency(%struct.Adjacency*) #5 {
  %2 = alloca %struct.Adjacency*, align 8
  %3 = alloca %struct.Adjacency*, align 8
  store %struct.Adjacency* %0, %struct.Adjacency** %2, align 8
  %4 = load %struct.Adjacency*, %struct.Adjacency** %2, align 8
  store %struct.Adjacency* %4, %struct.Adjacency** %3, align 8
  br label %5

; <label>:5:                                      ; preds = %8, %1
  %6 = load %struct.Adjacency*, %struct.Adjacency** %3, align 8
  %7 = icmp ne %struct.Adjacency* %6, null
  br i1 %7, label %8, label %16

; <label>:8:                                      ; preds = %5
  %9 = load %struct.Adjacency*, %struct.Adjacency** %3, align 8
  %10 = getelementptr inbounds %struct.Adjacency, %struct.Adjacency* %9, i32 0, i32 1
  store i8 0, i8* %10, align 4
  %11 = load %struct.Adjacency*, %struct.Adjacency** %3, align 8
  %12 = getelementptr inbounds %struct.Adjacency, %struct.Adjacency* %11, i32 0, i32 2
  store i8 0, i8* %12, align 1
  %13 = load %struct.Adjacency*, %struct.Adjacency** %3, align 8
  %14 = getelementptr inbounds %struct.Adjacency, %struct.Adjacency* %13, i32 0, i32 4
  %15 = load %struct.Adjacency*, %struct.Adjacency** %14, align 8
  store %struct.Adjacency* %15, %struct.Adjacency** %3, align 8
  br label %5

; <label>:16:                                     ; preds = %5
  ret void
}

; Function Attrs: noinline optnone sspstrong uwtable
define dso_local void @_Z3bfsP9AdjacencyRiiiRSt6vectorIiSaIiEES5_b(%struct.Adjacency*, i32* dereferenceable(4), i32, i32, %"class.std::vector"* dereferenceable(24), %"class.std::vector"* dereferenceable(24), i1 zeroext) #4 {
  %8 = alloca %struct.Adjacency*, align 8
  %9 = alloca i32*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca %"class.std::vector"*, align 8
  %13 = alloca %"class.std::vector"*, align 8
  %14 = alloca i8, align 1
  %15 = alloca %struct.Queue*, align 8
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca %struct.Adjacency*, align 8
  %21 = alloca i32, align 4
  %22 = alloca %struct.Node*, align 8
  %23 = alloca i32, align 4
  %24 = alloca %struct.Adjacency*, align 8
  store %struct.Adjacency* %0, %struct.Adjacency** %8, align 8
  store i32* %1, i32** %9, align 8
  store i32 %2, i32* %10, align 4
  store i32 %3, i32* %11, align 4
  store %"class.std::vector"* %4, %"class.std::vector"** %12, align 8
  store %"class.std::vector"* %5, %"class.std::vector"** %13, align 8
  %25 = zext i1 %6 to i8
  store i8 %25, i8* %14, align 1
  call void @_Z12create_queueRP5Queue(%struct.Queue** dereferenceable(8) %15)
  %26 = load i32, i32* %11, align 4
  %27 = icmp eq i32 %26, -1
  br i1 %27, label %28, label %40

; <label>:28:                                     ; preds = %7
  store i32 0, i32* %11, align 4
  br label %29

; <label>:29:                                     ; preds = %32, %28
  %30 = call i32 @getchar()
  store i32 %30, i32* %16, align 4
  %31 = icmp ne i32 %30, 10
  br i1 %31, label %32, label %39

; <label>:32:                                     ; preds = %29
  %33 = load i32, i32* %16, align 4
  %34 = sub nsw i32 %33, 48
  store i32 %34, i32* %16, align 4
  %35 = load i32, i32* %11, align 4
  %36 = mul nsw i32 %35, 10
  %37 = load i32, i32* %16, align 4
  %38 = add nsw i32 %36, %37
  store i32 %38, i32* %11, align 4
  br label %29

; <label>:39:                                     ; preds = %29
  br label %40

; <label>:40:                                     ; preds = %39, %7
  %41 = load i32, i32* %11, align 4
  %42 = load i32*, i32** %9, align 8
  store i32 %41, i32* %42, align 4
  %43 = load i32, i32* %11, align 4
  %44 = load i32, i32* %10, align 4
  %45 = icmp sgt i32 %43, %44
  br i1 %45, label %46, label %47

; <label>:46:                                     ; preds = %40
  br label %180

; <label>:47:                                     ; preds = %40
  %48 = load %"class.std::vector"*, %"class.std::vector"** %12, align 8
  call void @_ZNSt6vectorIiSaIiEE5clearEv(%"class.std::vector"* %48) #3
  %49 = load %"class.std::vector"*, %"class.std::vector"** %13, align 8
  call void @_ZNSt6vectorIiSaIiEE5clearEv(%"class.std::vector"* %49) #3
  store i32 0, i32* %17, align 4
  br label %50

; <label>:50:                                     ; preds = %57, %47
  %51 = load i32, i32* %17, align 4
  %52 = load i32, i32* %10, align 4
  %53 = icmp slt i32 %51, %52
  br i1 %53, label %54, label %60

; <label>:54:                                     ; preds = %50
  %55 = load %"class.std::vector"*, %"class.std::vector"** %13, align 8
  store i32 2147483647, i32* %18, align 4
  call void @_ZNSt6vectorIiSaIiEE9push_backEOi(%"class.std::vector"* %55, i32* dereferenceable(4) %18)
  %56 = load %"class.std::vector"*, %"class.std::vector"** %12, align 8
  store i32 -1, i32* %19, align 4
  call void @_ZNSt6vectorIiSaIiEE9push_backEOi(%"class.std::vector"* %56, i32* dereferenceable(4) %19)
  br label %57

; <label>:57:                                     ; preds = %54
  %58 = load i32, i32* %17, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, i32* %17, align 4
  br label %50

; <label>:60:                                     ; preds = %50
  %61 = load i32, i32* %11, align 4
  call void @_Z7enqueueRP5Queuei(%struct.Queue** dereferenceable(8) %15, i32 %61)
  %62 = load %"class.std::vector"*, %"class.std::vector"** %13, align 8
  %63 = load i32, i32* %11, align 4
  %64 = sext i32 %63 to i64
  %65 = call dereferenceable(4) i32* @_ZNSt6vectorIiSaIiEEixEm(%"class.std::vector"* %62, i64 %64) #3
  store i32 0, i32* %65, align 4
  br label %66

; <label>:66:                                     ; preds = %166, %60
  %67 = load %struct.Queue*, %struct.Queue** %15, align 8
  %68 = call zeroext i1 @_Z8is_emptyP5Queue(%struct.Queue* %67)
  %69 = xor i1 %68, true
  br i1 %69, label %70, label %171

; <label>:70:                                     ; preds = %66
  %71 = load %struct.Adjacency*, %struct.Adjacency** %8, align 8
  store %struct.Adjacency* %71, %struct.Adjacency** %20, align 8
  %72 = call i32 @_Z7dequeueRP5Queue(%struct.Queue** dereferenceable(8) %15)
  store i32 %72, i32* %21, align 4
  %73 = load i8, i8* %14, align 1
  %74 = trunc i8 %73 to i1
  br i1 %74, label %75, label %79

; <label>:75:                                     ; preds = %70
  %76 = load i32, i32* %21, align 4
  %77 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* @_ZSt4cout, i32 %76)
  %78 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c(%"class.std::basic_ostream"* dereferenceable(272) %77, i8 signext 32)
  br label %79

; <label>:79:                                     ; preds = %75, %70
  %80 = load %struct.Adjacency*, %struct.Adjacency** %20, align 8
  %81 = icmp eq %struct.Adjacency* %80, null
  br i1 %81, label %82, label %83

; <label>:82:                                     ; preds = %79
  br label %180

; <label>:83:                                     ; preds = %79
  br label %84

; <label>:84:                                     ; preds = %90, %83
  %85 = load %struct.Adjacency*, %struct.Adjacency** %20, align 8
  %86 = getelementptr inbounds %struct.Adjacency, %struct.Adjacency* %85, i32 0, i32 0
  %87 = load i32, i32* %86, align 8
  %88 = load i32, i32* %21, align 4
  %89 = icmp ne i32 %87, %88
  br i1 %89, label %90, label %94

; <label>:90:                                     ; preds = %84
  %91 = load %struct.Adjacency*, %struct.Adjacency** %20, align 8
  %92 = getelementptr inbounds %struct.Adjacency, %struct.Adjacency* %91, i32 0, i32 4
  %93 = load %struct.Adjacency*, %struct.Adjacency** %92, align 8
  store %struct.Adjacency* %93, %struct.Adjacency** %20, align 8
  br label %84

; <label>:94:                                     ; preds = %84
  %95 = load %struct.Adjacency*, %struct.Adjacency** %20, align 8
  %96 = icmp eq %struct.Adjacency* %95, null
  br i1 %96, label %97, label %98

; <label>:97:                                     ; preds = %94
  br label %180

; <label>:98:                                     ; preds = %94
  %99 = load %struct.Adjacency*, %struct.Adjacency** %20, align 8
  %100 = getelementptr inbounds %struct.Adjacency, %struct.Adjacency* %99, i32 0, i32 3
  %101 = load %struct.Node*, %struct.Node** %100, align 8
  store %struct.Node* %101, %struct.Node** %22, align 8
  br label %102

; <label>:102:                                    ; preds = %162, %128, %98
  %103 = load %struct.Node*, %struct.Node** %22, align 8
  %104 = icmp ne %struct.Node* %103, null
  br i1 %104, label %105, label %166

; <label>:105:                                    ; preds = %102
  %106 = load %struct.Node*, %struct.Node** %22, align 8
  %107 = getelementptr inbounds %struct.Node, %struct.Node* %106, i32 0, i32 0
  %108 = load i32, i32* %107, align 8
  store i32 %108, i32* %23, align 4
  %109 = load %struct.Adjacency*, %struct.Adjacency** %8, align 8
  store %struct.Adjacency* %109, %struct.Adjacency** %24, align 8
  br label %110

; <label>:110:                                    ; preds = %121, %105
  %111 = load %struct.Adjacency*, %struct.Adjacency** %24, align 8
  %112 = icmp ne %struct.Adjacency* %111, null
  br i1 %112, label %113, label %119

; <label>:113:                                    ; preds = %110
  %114 = load %struct.Adjacency*, %struct.Adjacency** %24, align 8
  %115 = getelementptr inbounds %struct.Adjacency, %struct.Adjacency* %114, i32 0, i32 0
  %116 = load i32, i32* %115, align 8
  %117 = load i32, i32* %23, align 4
  %118 = icmp ne i32 %116, %117
  br label %119

; <label>:119:                                    ; preds = %113, %110
  %120 = phi i1 [ false, %110 ], [ %118, %113 ]
  br i1 %120, label %121, label %125

; <label>:121:                                    ; preds = %119
  %122 = load %struct.Adjacency*, %struct.Adjacency** %24, align 8
  %123 = getelementptr inbounds %struct.Adjacency, %struct.Adjacency* %122, i32 0, i32 4
  %124 = load %struct.Adjacency*, %struct.Adjacency** %123, align 8
  store %struct.Adjacency* %124, %struct.Adjacency** %24, align 8
  br label %110

; <label>:125:                                    ; preds = %119
  %126 = load %struct.Adjacency*, %struct.Adjacency** %24, align 8
  %127 = icmp eq %struct.Adjacency* %126, null
  br i1 %127, label %128, label %129

; <label>:128:                                    ; preds = %125
  br label %102

; <label>:129:                                    ; preds = %125
  %130 = load %struct.Adjacency*, %struct.Adjacency** %24, align 8
  %131 = getelementptr inbounds %struct.Adjacency, %struct.Adjacency* %130, i32 0, i32 1
  %132 = load i8, i8* %131, align 4
  %133 = trunc i8 %132 to i1
  %134 = zext i1 %133 to i32
  %135 = icmp eq i32 %134, 0
  br i1 %135, label %136, label %162

; <label>:136:                                    ; preds = %129
  %137 = load %struct.Adjacency*, %struct.Adjacency** %24, align 8
  %138 = getelementptr inbounds %struct.Adjacency, %struct.Adjacency* %137, i32 0, i32 2
  %139 = load i8, i8* %138, align 1
  %140 = trunc i8 %139 to i1
  %141 = zext i1 %140 to i32
  %142 = icmp eq i32 %141, 0
  br i1 %142, label %143, label %162

; <label>:143:                                    ; preds = %136
  %144 = load %struct.Adjacency*, %struct.Adjacency** %24, align 8
  %145 = getelementptr inbounds %struct.Adjacency, %struct.Adjacency* %144, i32 0, i32 2
  store i8 1, i8* %145, align 1
  %146 = load i32, i32* %23, align 4
  call void @_Z7enqueueRP5Queuei(%struct.Queue** dereferenceable(8) %15, i32 %146)
  %147 = load %"class.std::vector"*, %"class.std::vector"** %13, align 8
  %148 = load i32, i32* %21, align 4
  %149 = sext i32 %148 to i64
  %150 = call dereferenceable(4) i32* @_ZNSt6vectorIiSaIiEEixEm(%"class.std::vector"* %147, i64 %149) #3
  %151 = load i32, i32* %150, align 4
  %152 = add nsw i32 %151, 1
  %153 = load %"class.std::vector"*, %"class.std::vector"** %13, align 8
  %154 = load i32, i32* %23, align 4
  %155 = sext i32 %154 to i64
  %156 = call dereferenceable(4) i32* @_ZNSt6vectorIiSaIiEEixEm(%"class.std::vector"* %153, i64 %155) #3
  store i32 %152, i32* %156, align 4
  %157 = load i32, i32* %21, align 4
  %158 = load %"class.std::vector"*, %"class.std::vector"** %12, align 8
  %159 = load i32, i32* %23, align 4
  %160 = sext i32 %159 to i64
  %161 = call dereferenceable(4) i32* @_ZNSt6vectorIiSaIiEEixEm(%"class.std::vector"* %158, i64 %160) #3
  store i32 %157, i32* %161, align 4
  br label %162

; <label>:162:                                    ; preds = %143, %136, %129
  %163 = load %struct.Node*, %struct.Node** %22, align 8
  %164 = getelementptr inbounds %struct.Node, %struct.Node* %163, i32 0, i32 1
  %165 = load %struct.Node*, %struct.Node** %164, align 8
  store %struct.Node* %165, %struct.Node** %22, align 8
  br label %102

; <label>:166:                                    ; preds = %102
  %167 = load %struct.Adjacency*, %struct.Adjacency** %20, align 8
  %168 = getelementptr inbounds %struct.Adjacency, %struct.Adjacency* %167, i32 0, i32 1
  store i8 1, i8* %168, align 4
  %169 = load %struct.Adjacency*, %struct.Adjacency** %20, align 8
  %170 = getelementptr inbounds %struct.Adjacency, %struct.Adjacency* %169, i32 0, i32 2
  store i8 1, i8* %170, align 1
  br label %66

; <label>:171:                                    ; preds = %66
  %172 = load i8, i8* %14, align 1
  %173 = trunc i8 %172 to i1
  br i1 %173, label %174, label %176

; <label>:174:                                    ; preds = %171
  %175 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8 signext 10)
  br label %176

; <label>:176:                                    ; preds = %174, %171
  %177 = load %struct.Adjacency*, %struct.Adjacency** %8, align 8
  call void @_Z11reset_colorP9Adjacency(%struct.Adjacency* %177)
  %178 = load %struct.Queue*, %struct.Queue** %15, align 8
  %179 = bitcast %struct.Queue* %178 to i8*
  call void @free(i8* %179) #3
  br label %180

; <label>:180:                                    ; preds = %176, %97, %82, %46
  ret void
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define linkonce_odr dso_local void @_ZNSt6vectorIiSaIiEE5clearEv(%"class.std::vector"*) #5 comdat align 2 {
  %2 = alloca %"class.std::vector"*, align 8
  store %"class.std::vector"* %0, %"class.std::vector"** %2, align 8
  %3 = load %"class.std::vector"*, %"class.std::vector"** %2, align 8
  %4 = bitcast %"class.std::vector"* %3 to %"struct.std::_Vector_base"*
  %5 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %4, i32 0, i32 0
  %6 = bitcast %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"* %5 to %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"*
  %7 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data", %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"* %6, i32 0, i32 0
  %8 = load i32*, i32** %7, align 8
  call void @_ZNSt6vectorIiSaIiEE15_M_erase_at_endEPi(%"class.std::vector"* %3, i32* %8) #3
  ret void
}

; Function Attrs: noinline optnone sspstrong uwtable
define linkonce_odr dso_local void @_ZNSt6vectorIiSaIiEE9push_backEOi(%"class.std::vector"*, i32* dereferenceable(4)) #4 comdat align 2 {
  %3 = alloca %"class.std::vector"*, align 8
  %4 = alloca i32*, align 8
  store %"class.std::vector"* %0, %"class.std::vector"** %3, align 8
  store i32* %1, i32** %4, align 8
  %5 = load %"class.std::vector"*, %"class.std::vector"** %3, align 8
  %6 = load i32*, i32** %4, align 8
  %7 = call dereferenceable(4) i32* @_ZSt4moveIRiEONSt16remove_referenceIT_E4typeEOS2_(i32* dereferenceable(4) %6) #3
  call void @_ZNSt6vectorIiSaIiEE12emplace_backIJiEEEvDpOT_(%"class.std::vector"* %5, i32* dereferenceable(4) %7)
  ret void
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define linkonce_odr dso_local dereferenceable(4) i32* @_ZNSt6vectorIiSaIiEEixEm(%"class.std::vector"*, i64) #5 comdat align 2 {
  %3 = alloca %"class.std::vector"*, align 8
  %4 = alloca i64, align 8
  store %"class.std::vector"* %0, %"class.std::vector"** %3, align 8
  store i64 %1, i64* %4, align 8
  %5 = load %"class.std::vector"*, %"class.std::vector"** %3, align 8
  %6 = bitcast %"class.std::vector"* %5 to %"struct.std::_Vector_base"*
  %7 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %6, i32 0, i32 0
  %8 = bitcast %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"* %7 to %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"*
  %9 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data", %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"* %8, i32 0, i32 0
  %10 = load i32*, i32** %9, align 8
  %11 = load i64, i64* %4, align 8
  %12 = getelementptr inbounds i32, i32* %10, i64 %11
  ret i32* %12
}

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c(%"class.std::basic_ostream"* dereferenceable(272), i8 signext) #1

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"*, i32) #1

; Function Attrs: noinline optnone sspstrong uwtable
define dso_local void @_Z10check_edgeP9Adjacency(%struct.Adjacency*) #4 {
  %2 = alloca %struct.Adjacency*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca %struct.Adjacency*, align 8
  %7 = alloca %struct.Node*, align 8
  store %struct.Adjacency* %0, %struct.Adjacency** %2, align 8
  store i32 0, i32* %3, align 4
  store i32 0, i32* %4, align 4
  br label %8

; <label>:8:                                      ; preds = %16, %14, %1
  %9 = call i32 @getchar()
  store i32 %9, i32* %5, align 4
  %10 = icmp ne i32 %9, 10
  br i1 %10, label %11, label %23

; <label>:11:                                     ; preds = %8
  %12 = load i32, i32* %5, align 4
  %13 = icmp eq i32 %12, 32
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %11
  %15 = load i32, i32* %4, align 4
  store i32 %15, i32* %3, align 4
  store i32 0, i32* %4, align 4
  br label %8

; <label>:16:                                     ; preds = %11
  %17 = load i32, i32* %5, align 4
  %18 = sub nsw i32 %17, 48
  store i32 %18, i32* %5, align 4
  %19 = load i32, i32* %4, align 4
  %20 = mul nsw i32 %19, 10
  %21 = load i32, i32* %5, align 4
  %22 = add nsw i32 %20, %21
  store i32 %22, i32* %4, align 4
  br label %8

; <label>:23:                                     ; preds = %8
  %24 = load %struct.Adjacency*, %struct.Adjacency** %2, align 8
  store %struct.Adjacency* %24, %struct.Adjacency** %6, align 8
  %25 = load %struct.Adjacency*, %struct.Adjacency** %6, align 8
  %26 = icmp eq %struct.Adjacency* %25, null
  br i1 %26, label %27, label %30

; <label>:27:                                     ; preds = %23
  %28 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  %29 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c(%"class.std::basic_ostream"* dereferenceable(272) %28, i8 signext 10)
  br label %75

; <label>:30:                                     ; preds = %23
  br label %31

; <label>:31:                                     ; preds = %42, %30
  %32 = load %struct.Adjacency*, %struct.Adjacency** %6, align 8
  %33 = icmp ne %struct.Adjacency* %32, null
  br i1 %33, label %34, label %40

; <label>:34:                                     ; preds = %31
  %35 = load %struct.Adjacency*, %struct.Adjacency** %6, align 8
  %36 = getelementptr inbounds %struct.Adjacency, %struct.Adjacency* %35, i32 0, i32 0
  %37 = load i32, i32* %36, align 8
  %38 = load i32, i32* %3, align 4
  %39 = icmp ne i32 %37, %38
  br label %40

; <label>:40:                                     ; preds = %34, %31
  %41 = phi i1 [ false, %31 ], [ %39, %34 ]
  br i1 %41, label %42, label %46

; <label>:42:                                     ; preds = %40
  %43 = load %struct.Adjacency*, %struct.Adjacency** %6, align 8
  %44 = getelementptr inbounds %struct.Adjacency, %struct.Adjacency* %43, i32 0, i32 4
  %45 = load %struct.Adjacency*, %struct.Adjacency** %44, align 8
  store %struct.Adjacency* %45, %struct.Adjacency** %6, align 8
  br label %31

; <label>:46:                                     ; preds = %40
  %47 = load %struct.Adjacency*, %struct.Adjacency** %6, align 8
  %48 = icmp eq %struct.Adjacency* %47, null
  br i1 %48, label %49, label %52

; <label>:49:                                     ; preds = %46
  %50 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  %51 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c(%"class.std::basic_ostream"* dereferenceable(272) %50, i8 signext 10)
  br label %75

; <label>:52:                                     ; preds = %46
  %53 = load %struct.Adjacency*, %struct.Adjacency** %6, align 8
  %54 = getelementptr inbounds %struct.Adjacency, %struct.Adjacency* %53, i32 0, i32 3
  %55 = load %struct.Node*, %struct.Node** %54, align 8
  store %struct.Node* %55, %struct.Node** %7, align 8
  br label %56

; <label>:56:                                     ; preds = %68, %52
  %57 = load %struct.Node*, %struct.Node** %7, align 8
  %58 = icmp ne %struct.Node* %57, null
  br i1 %58, label %59, label %72

; <label>:59:                                     ; preds = %56
  %60 = load %struct.Node*, %struct.Node** %7, align 8
  %61 = getelementptr inbounds %struct.Node, %struct.Node* %60, i32 0, i32 0
  %62 = load i32, i32* %61, align 8
  %63 = load i32, i32* %4, align 4
  %64 = icmp eq i32 %62, %63
  br i1 %64, label %65, label %68

; <label>:65:                                     ; preds = %59
  %66 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0))
  %67 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c(%"class.std::basic_ostream"* dereferenceable(272) %66, i8 signext 10)
  br label %75

; <label>:68:                                     ; preds = %59
  %69 = load %struct.Node*, %struct.Node** %7, align 8
  %70 = getelementptr inbounds %struct.Node, %struct.Node* %69, i32 0, i32 1
  %71 = load %struct.Node*, %struct.Node** %70, align 8
  store %struct.Node* %71, %struct.Node** %7, align 8
  br label %56

; <label>:72:                                     ; preds = %56
  %73 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  %74 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c(%"class.std::basic_ostream"* dereferenceable(272) %73, i8 signext 10)
  br label %75

; <label>:75:                                     ; preds = %72, %65, %49, %27
  ret void
}

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272), i8*) #1

; Function Attrs: noinline optnone sspstrong uwtable
define dso_local void @_Z13shortest_pathP9AdjacencyiiRSt6vectorIiSaIiEES4_S4_(%struct.Adjacency*, i32, i32, %"class.std::vector"* dereferenceable(24), %"class.std::vector"* dereferenceable(24), %"class.std::vector"* dereferenceable(24)) #4 {
  %7 = alloca %struct.Adjacency*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca %"class.std::vector"*, align 8
  %11 = alloca %"class.std::vector"*, align 8
  %12 = alloca %"class.std::vector"*, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  store %struct.Adjacency* %0, %struct.Adjacency** %7, align 8
  store i32 %1, i32* %8, align 4
  store i32 %2, i32* %9, align 4
  store %"class.std::vector"* %3, %"class.std::vector"** %10, align 8
  store %"class.std::vector"* %4, %"class.std::vector"** %11, align 8
  store %"class.std::vector"* %5, %"class.std::vector"** %12, align 8
  store i32 0, i32* %13, align 4
  store i32 0, i32* %14, align 4
  br label %18

; <label>:18:                                     ; preds = %26, %24, %6
  %19 = call i32 @getchar()
  store i32 %19, i32* %15, align 4
  %20 = icmp ne i32 %19, 10
  br i1 %20, label %21, label %33

; <label>:21:                                     ; preds = %18
  %22 = load i32, i32* %15, align 4
  %23 = icmp eq i32 %22, 32
  br i1 %23, label %24, label %26

; <label>:24:                                     ; preds = %21
  %25 = load i32, i32* %14, align 4
  store i32 %25, i32* %13, align 4
  store i32 0, i32* %14, align 4
  br label %18

; <label>:26:                                     ; preds = %21
  %27 = load i32, i32* %15, align 4
  %28 = sub nsw i32 %27, 48
  store i32 %28, i32* %15, align 4
  %29 = load i32, i32* %14, align 4
  %30 = mul nsw i32 %29, 10
  %31 = load i32, i32* %15, align 4
  %32 = add nsw i32 %30, %31
  store i32 %32, i32* %14, align 4
  br label %18

; <label>:33:                                     ; preds = %18
  %34 = load %"class.std::vector"*, %"class.std::vector"** %10, align 8
  call void @_ZNSt6vectorIiSaIiEE5clearEv(%"class.std::vector"* %34) #3
  %35 = load i32, i32* %8, align 4
  %36 = load i32, i32* %13, align 4
  %37 = icmp ne i32 %35, %36
  br i1 %37, label %38, label %44

; <label>:38:                                     ; preds = %33
  %39 = load %struct.Adjacency*, %struct.Adjacency** %7, align 8
  %40 = load i32, i32* %9, align 4
  %41 = load i32, i32* %13, align 4
  %42 = load %"class.std::vector"*, %"class.std::vector"** %11, align 8
  %43 = load %"class.std::vector"*, %"class.std::vector"** %12, align 8
  call void @_Z3bfsP9AdjacencyRiiiRSt6vectorIiSaIiEES5_b(%struct.Adjacency* %39, i32* dereferenceable(4) %8, i32 %40, i32 %41, %"class.std::vector"* dereferenceable(24) %42, %"class.std::vector"* dereferenceable(24) %43, i1 zeroext false)
  br label %44

; <label>:44:                                     ; preds = %38, %33
  %45 = load i32, i32* %14, align 4
  store i32 %45, i32* %16, align 4
  %46 = load %"class.std::vector"*, %"class.std::vector"** %10, align 8
  call void @_ZNSt6vectorIiSaIiEE9push_backERKi(%"class.std::vector"* %46, i32* dereferenceable(4) %14)
  br label %47

; <label>:47:                                     ; preds = %54, %44
  %48 = load %"class.std::vector"*, %"class.std::vector"** %11, align 8
  %49 = load i32, i32* %16, align 4
  %50 = sext i32 %49 to i64
  %51 = call dereferenceable(4) i32* @_ZNSt6vectorIiSaIiEEixEm(%"class.std::vector"* %48, i64 %50) #3
  %52 = load i32, i32* %51, align 4
  %53 = icmp ne i32 %52, -1
  br i1 %53, label %54, label %61

; <label>:54:                                     ; preds = %47
  %55 = load %"class.std::vector"*, %"class.std::vector"** %11, align 8
  %56 = load i32, i32* %16, align 4
  %57 = sext i32 %56 to i64
  %58 = call dereferenceable(4) i32* @_ZNSt6vectorIiSaIiEEixEm(%"class.std::vector"* %55, i64 %57) #3
  %59 = load i32, i32* %58, align 4
  store i32 %59, i32* %16, align 4
  %60 = load %"class.std::vector"*, %"class.std::vector"** %10, align 8
  call void @_ZNSt6vectorIiSaIiEE9push_backERKi(%"class.std::vector"* %60, i32* dereferenceable(4) %16)
  br label %47

; <label>:61:                                     ; preds = %47
  %62 = load %"class.std::vector"*, %"class.std::vector"** %10, align 8
  %63 = call dereferenceable(4) i32* @_ZNSt6vectorIiSaIiEE4backEv(%"class.std::vector"* %62) #3
  %64 = load i32, i32* %63, align 4
  %65 = load i32, i32* %13, align 4
  %66 = icmp eq i32 %64, %65
  br i1 %66, label %67, label %88

; <label>:67:                                     ; preds = %61
  %68 = load %"class.std::vector"*, %"class.std::vector"** %10, align 8
  %69 = call i64 @_ZNKSt6vectorIiSaIiEE4sizeEv(%"class.std::vector"* %68) #3
  %70 = sub i64 %69, 1
  %71 = trunc i64 %70 to i32
  store i32 %71, i32* %17, align 4
  br label %72

; <label>:72:                                     ; preds = %83, %67
  %73 = load i32, i32* %17, align 4
  %74 = icmp sge i32 %73, 0
  br i1 %74, label %75, label %86

; <label>:75:                                     ; preds = %72
  %76 = load %"class.std::vector"*, %"class.std::vector"** %10, align 8
  %77 = load i32, i32* %17, align 4
  %78 = sext i32 %77 to i64
  %79 = call dereferenceable(4) i32* @_ZNSt6vectorIiSaIiEEixEm(%"class.std::vector"* %76, i64 %78) #3
  %80 = load i32, i32* %79, align 4
  %81 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* @_ZSt4cout, i32 %80)
  %82 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %81, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0))
  br label %83

; <label>:83:                                     ; preds = %75
  %84 = load i32, i32* %17, align 4
  %85 = add nsw i32 %84, -1
  store i32 %85, i32* %17, align 4
  br label %72

; <label>:86:                                     ; preds = %72
  %87 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8 signext 10)
  br label %91

; <label>:88:                                     ; preds = %61
  %89 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0))
  %90 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c(%"class.std::basic_ostream"* dereferenceable(272) %89, i8 signext 10)
  br label %91

; <label>:91:                                     ; preds = %88, %86
  ret void
}

; Function Attrs: noinline optnone sspstrong uwtable
define linkonce_odr dso_local void @_ZNSt6vectorIiSaIiEE9push_backERKi(%"class.std::vector"*, i32* dereferenceable(4)) #4 comdat align 2 {
  %3 = alloca %"class.std::vector"*, align 8
  %4 = alloca i32*, align 8
  %5 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  store %"class.std::vector"* %0, %"class.std::vector"** %3, align 8
  store i32* %1, i32** %4, align 8
  %6 = load %"class.std::vector"*, %"class.std::vector"** %3, align 8
  %7 = bitcast %"class.std::vector"* %6 to %"struct.std::_Vector_base"*
  %8 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %7, i32 0, i32 0
  %9 = bitcast %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"* %8 to %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"*
  %10 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data", %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"* %9, i32 0, i32 1
  %11 = load i32*, i32** %10, align 8
  %12 = bitcast %"class.std::vector"* %6 to %"struct.std::_Vector_base"*
  %13 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %12, i32 0, i32 0
  %14 = bitcast %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"* %13 to %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"*
  %15 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data", %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"* %14, i32 0, i32 2
  %16 = load i32*, i32** %15, align 8
  %17 = icmp ne i32* %11, %16
  br i1 %17, label %18, label %34

; <label>:18:                                     ; preds = %2
  %19 = bitcast %"class.std::vector"* %6 to %"struct.std::_Vector_base"*
  %20 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %19, i32 0, i32 0
  %21 = bitcast %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"* %20 to %"class.std::allocator"*
  %22 = bitcast %"class.std::vector"* %6 to %"struct.std::_Vector_base"*
  %23 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %22, i32 0, i32 0
  %24 = bitcast %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"* %23 to %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"*
  %25 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data", %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"* %24, i32 0, i32 1
  %26 = load i32*, i32** %25, align 8
  %27 = load i32*, i32** %4, align 8
  call void @_ZNSt16allocator_traitsISaIiEE9constructIiJRKiEEEvRS0_PT_DpOT0_(%"class.std::allocator"* dereferenceable(1) %21, i32* %26, i32* dereferenceable(4) %27) #3
  %28 = bitcast %"class.std::vector"* %6 to %"struct.std::_Vector_base"*
  %29 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %28, i32 0, i32 0
  %30 = bitcast %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"* %29 to %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"*
  %31 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data", %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"* %30, i32 0, i32 1
  %32 = load i32*, i32** %31, align 8
  %33 = getelementptr inbounds i32, i32* %32, i32 1
  store i32* %33, i32** %31, align 8
  br label %40

; <label>:34:                                     ; preds = %2
  %35 = call i32* @_ZNSt6vectorIiSaIiEE3endEv(%"class.std::vector"* %6) #3
  %36 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %5, i32 0, i32 0
  store i32* %35, i32** %36, align 8
  %37 = load i32*, i32** %4, align 8
  %38 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %5, i32 0, i32 0
  %39 = load i32*, i32** %38, align 8
  call void @_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_(%"class.std::vector"* %6, i32* %39, i32* dereferenceable(4) %37)
  br label %40

; <label>:40:                                     ; preds = %34, %18
  ret void
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define linkonce_odr dso_local dereferenceable(4) i32* @_ZNSt6vectorIiSaIiEE4backEv(%"class.std::vector"*) #5 comdat align 2 {
  %2 = alloca %"class.std::vector"*, align 8
  %3 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %4 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  store %"class.std::vector"* %0, %"class.std::vector"** %2, align 8
  %5 = load %"class.std::vector"*, %"class.std::vector"** %2, align 8
  %6 = call i32* @_ZNSt6vectorIiSaIiEE3endEv(%"class.std::vector"* %5) #3
  %7 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %4, i32 0, i32 0
  store i32* %6, i32** %7, align 8
  %8 = call i32* @_ZNK9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEmiEl(%"class.__gnu_cxx::__normal_iterator"* %4, i64 1) #3
  %9 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %3, i32 0, i32 0
  store i32* %8, i32** %9, align 8
  %10 = call dereferenceable(4) i32* @_ZNK9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEdeEv(%"class.__gnu_cxx::__normal_iterator"* %3) #3
  ret i32* %10
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define linkonce_odr dso_local i64 @_ZNKSt6vectorIiSaIiEE4sizeEv(%"class.std::vector"*) #5 comdat align 2 {
  %2 = alloca %"class.std::vector"*, align 8
  store %"class.std::vector"* %0, %"class.std::vector"** %2, align 8
  %3 = load %"class.std::vector"*, %"class.std::vector"** %2, align 8
  %4 = bitcast %"class.std::vector"* %3 to %"struct.std::_Vector_base"*
  %5 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %4, i32 0, i32 0
  %6 = bitcast %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"* %5 to %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"*
  %7 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data", %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"* %6, i32 0, i32 1
  %8 = load i32*, i32** %7, align 8
  %9 = bitcast %"class.std::vector"* %3 to %"struct.std::_Vector_base"*
  %10 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %9, i32 0, i32 0
  %11 = bitcast %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"* %10 to %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"*
  %12 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data", %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"* %11, i32 0, i32 0
  %13 = load i32*, i32** %12, align 8
  %14 = ptrtoint i32* %8 to i64
  %15 = ptrtoint i32* %13 to i64
  %16 = sub i64 %14, %15
  %17 = sdiv exact i64 %16, 4
  ret i64 %17
}

; Function Attrs: noinline norecurse optnone sspstrong uwtable
define dso_local i32 @main() #6 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca %struct.Adjacency*, align 8
  %6 = alloca %"class.std::vector", align 8
  %7 = alloca %"class.std::vector", align 8
  %8 = alloca %"class.std::vector", align 8
  %9 = alloca i8*
  %10 = alloca i32
  store i32 0, i32* %1, align 4
  store %struct.Adjacency* null, %struct.Adjacency** %5, align 8
  call void @_ZNSt6vectorIiSaIiEEC2Ev(%"class.std::vector"* %6) #3
  call void @_ZNSt6vectorIiSaIiEEC2Ev(%"class.std::vector"* %7) #3
  call void @_ZNSt6vectorIiSaIiEEC2Ev(%"class.std::vector"* %8) #3
  br label %11

; <label>:11:                                     ; preds = %65, %0
  %12 = invoke i32 @getchar()
          to label %13 unwind label %23

; <label>:13:                                     ; preds = %11
  store i32 %12, i32* %2, align 4
  %14 = icmp ne i32 %12, -1
  br i1 %14, label %15, label %66

; <label>:15:                                     ; preds = %13
  %16 = load i32, i32* %2, align 4
  %17 = icmp eq i32 %16, 78
  br i1 %17, label %18, label %27

; <label>:18:                                     ; preds = %15
  %19 = invoke i32 @getchar()
          to label %20 unwind label %23

; <label>:20:                                     ; preds = %18
  store i32 %19, i32* %2, align 4
  invoke void @_Z9get_inputRi(i32* dereferenceable(4) %3)
          to label %21 unwind label %23

; <label>:21:                                     ; preds = %20
  invoke void @_Z15delete_adj_listRP9Adjacency(%struct.Adjacency** dereferenceable(8) %5)
          to label %22 unwind label %23

; <label>:22:                                     ; preds = %21
  store %struct.Adjacency* null, %struct.Adjacency** %5, align 8
  br label %65

; <label>:23:                                     ; preds = %56, %54, %47, %45, %39, %37, %32, %30, %21, %20, %18, %11
  %24 = landingpad { i8*, i32 }
          cleanup
  %25 = extractvalue { i8*, i32 } %24, 0
  store i8* %25, i8** %9, align 8
  %26 = extractvalue { i8*, i32 } %24, 1
  store i32 %26, i32* %10, align 4
  call void @_ZNSt6vectorIiSaIiEED2Ev(%"class.std::vector"* %8) #3
  call void @_ZNSt6vectorIiSaIiEED2Ev(%"class.std::vector"* %7) #3
  call void @_ZNSt6vectorIiSaIiEED2Ev(%"class.std::vector"* %6) #3
  br label %68

; <label>:27:                                     ; preds = %15
  %28 = load i32, i32* %2, align 4
  %29 = icmp eq i32 %28, 69
  br i1 %29, label %30, label %34

; <label>:30:                                     ; preds = %27
  %31 = invoke i32 @getchar()
          to label %32 unwind label %23

; <label>:32:                                     ; preds = %30
  store i32 %31, i32* %2, align 4
  invoke void @_Z15input_adjacencyRP9Adjacency(%struct.Adjacency** dereferenceable(8) %5)
          to label %33 unwind label %23

; <label>:33:                                     ; preds = %32
  br label %64

; <label>:34:                                     ; preds = %27
  %35 = load i32, i32* %2, align 4
  %36 = icmp eq i32 %35, 63
  br i1 %36, label %37, label %42

; <label>:37:                                     ; preds = %34
  %38 = invoke i32 @getchar()
          to label %39 unwind label %23

; <label>:39:                                     ; preds = %37
  store i32 %38, i32* %2, align 4
  %40 = load %struct.Adjacency*, %struct.Adjacency** %5, align 8
  invoke void @_Z10check_edgeP9Adjacency(%struct.Adjacency* %40)
          to label %41 unwind label %23

; <label>:41:                                     ; preds = %39
  br label %63

; <label>:42:                                     ; preds = %34
  %43 = load i32, i32* %2, align 4
  %44 = icmp eq i32 %43, 66
  br i1 %44, label %45, label %51

; <label>:45:                                     ; preds = %42
  %46 = invoke i32 @getchar()
          to label %47 unwind label %23

; <label>:47:                                     ; preds = %45
  store i32 %46, i32* %2, align 4
  %48 = load %struct.Adjacency*, %struct.Adjacency** %5, align 8
  %49 = load i32, i32* %3, align 4
  invoke void @_Z3bfsP9AdjacencyRiiiRSt6vectorIiSaIiEES5_b(%struct.Adjacency* %48, i32* dereferenceable(4) %4, i32 %49, i32 -1, %"class.std::vector"* dereferenceable(24) %7, %"class.std::vector"* dereferenceable(24) %8, i1 zeroext true)
          to label %50 unwind label %23

; <label>:50:                                     ; preds = %47
  br label %62

; <label>:51:                                     ; preds = %42
  %52 = load i32, i32* %2, align 4
  %53 = icmp eq i32 %52, 80
  br i1 %53, label %54, label %61

; <label>:54:                                     ; preds = %51
  %55 = invoke i32 @getchar()
          to label %56 unwind label %23

; <label>:56:                                     ; preds = %54
  store i32 %55, i32* %2, align 4
  %57 = load %struct.Adjacency*, %struct.Adjacency** %5, align 8
  %58 = load i32, i32* %4, align 4
  %59 = load i32, i32* %3, align 4
  invoke void @_Z13shortest_pathP9AdjacencyiiRSt6vectorIiSaIiEES4_S4_(%struct.Adjacency* %57, i32 %58, i32 %59, %"class.std::vector"* dereferenceable(24) %6, %"class.std::vector"* dereferenceable(24) %7, %"class.std::vector"* dereferenceable(24) %8)
          to label %60 unwind label %23

; <label>:60:                                     ; preds = %56
  br label %61

; <label>:61:                                     ; preds = %60, %51
  br label %62

; <label>:62:                                     ; preds = %61, %50
  br label %63

; <label>:63:                                     ; preds = %62, %41
  br label %64

; <label>:64:                                     ; preds = %63, %33
  br label %65

; <label>:65:                                     ; preds = %64, %22
  br label %11

; <label>:66:                                     ; preds = %13
  call void @_ZNSt6vectorIiSaIiEED2Ev(%"class.std::vector"* %8) #3
  call void @_ZNSt6vectorIiSaIiEED2Ev(%"class.std::vector"* %7) #3
  call void @_ZNSt6vectorIiSaIiEED2Ev(%"class.std::vector"* %6) #3
  %67 = load i32, i32* %1, align 4
  ret i32 %67

; <label>:68:                                     ; preds = %23
  %69 = load i8*, i8** %9, align 8
  %70 = load i32, i32* %10, align 4
  %71 = insertvalue { i8*, i32 } undef, i8* %69, 0
  %72 = insertvalue { i8*, i32 } %71, i32 %70, 1
  resume { i8*, i32 } %72
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define linkonce_odr dso_local void @_ZNSt6vectorIiSaIiEEC2Ev(%"class.std::vector"*) unnamed_addr #5 comdat align 2 {
  %2 = alloca %"class.std::vector"*, align 8
  store %"class.std::vector"* %0, %"class.std::vector"** %2, align 8
  %3 = load %"class.std::vector"*, %"class.std::vector"** %2, align 8
  %4 = bitcast %"class.std::vector"* %3 to %"struct.std::_Vector_base"*
  call void @_ZNSt12_Vector_baseIiSaIiEEC2Ev(%"struct.std::_Vector_base"* %4) #3
  ret void
}

declare i32 @__gxx_personality_v0(...)

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define linkonce_odr dso_local void @_ZNSt6vectorIiSaIiEED2Ev(%"class.std::vector"*) unnamed_addr #5 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = alloca %"class.std::vector"*, align 8
  %3 = alloca i8*
  %4 = alloca i32
  store %"class.std::vector"* %0, %"class.std::vector"** %2, align 8
  %5 = load %"class.std::vector"*, %"class.std::vector"** %2, align 8
  %6 = bitcast %"class.std::vector"* %5 to %"struct.std::_Vector_base"*
  %7 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %6, i32 0, i32 0
  %8 = bitcast %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"* %7 to %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"*
  %9 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data", %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"* %8, i32 0, i32 0
  %10 = load i32*, i32** %9, align 8
  %11 = bitcast %"class.std::vector"* %5 to %"struct.std::_Vector_base"*
  %12 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %11, i32 0, i32 0
  %13 = bitcast %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"* %12 to %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"*
  %14 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data", %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"* %13, i32 0, i32 1
  %15 = load i32*, i32** %14, align 8
  %16 = bitcast %"class.std::vector"* %5 to %"struct.std::_Vector_base"*
  %17 = call dereferenceable(1) %"class.std::allocator"* @_ZNSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base"* %16) #3
  invoke void @_ZSt8_DestroyIPiiEvT_S1_RSaIT0_E(i32* %10, i32* %15, %"class.std::allocator"* dereferenceable(1) %17)
          to label %18 unwind label %20

; <label>:18:                                     ; preds = %1
  %19 = bitcast %"class.std::vector"* %5 to %"struct.std::_Vector_base"*
  call void @_ZNSt12_Vector_baseIiSaIiEED2Ev(%"struct.std::_Vector_base"* %19) #3
  ret void

; <label>:20:                                     ; preds = %1
  %21 = landingpad { i8*, i32 }
          catch i8* null
  %22 = extractvalue { i8*, i32 } %21, 0
  store i8* %22, i8** %3, align 8
  %23 = extractvalue { i8*, i32 } %21, 1
  store i32 %23, i32* %4, align 4
  %24 = bitcast %"class.std::vector"* %5 to %"struct.std::_Vector_base"*
  call void @_ZNSt12_Vector_baseIiSaIiEED2Ev(%"struct.std::_Vector_base"* %24) #3
  br label %25

; <label>:25:                                     ; preds = %20
  %26 = load i8*, i8** %3, align 8
  call void @__clang_call_terminate(i8* %26) #12
  unreachable
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define linkonce_odr dso_local void @_ZNSt12_Vector_baseIiSaIiEEC2Ev(%"struct.std::_Vector_base"*) unnamed_addr #5 comdat align 2 {
  %2 = alloca %"struct.std::_Vector_base"*, align 8
  store %"struct.std::_Vector_base"* %0, %"struct.std::_Vector_base"** %2, align 8
  %3 = load %"struct.std::_Vector_base"*, %"struct.std::_Vector_base"** %2, align 8
  %4 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %3, i32 0, i32 0
  call void @_ZNSt12_Vector_baseIiSaIiEE12_Vector_implC2Ev(%"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"* %4) #3
  ret void
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define linkonce_odr dso_local void @_ZNSt12_Vector_baseIiSaIiEE12_Vector_implC2Ev(%"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"*) unnamed_addr #5 comdat align 2 {
  %2 = alloca %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"*, align 8
  store %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"* %0, %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"** %2, align 8
  %3 = load %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"*, %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"** %2, align 8
  %4 = bitcast %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"* %3 to %"class.std::allocator"*
  call void @_ZNSaIiEC2Ev(%"class.std::allocator"* %4) #3
  %5 = bitcast %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"* %3 to %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"*
  call void @_ZNSt12_Vector_baseIiSaIiEE17_Vector_impl_dataC2Ev(%"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"* %5) #3
  ret void
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define linkonce_odr dso_local void @_ZNSaIiEC2Ev(%"class.std::allocator"*) unnamed_addr #5 comdat align 2 {
  %2 = alloca %"class.std::allocator"*, align 8
  store %"class.std::allocator"* %0, %"class.std::allocator"** %2, align 8
  %3 = load %"class.std::allocator"*, %"class.std::allocator"** %2, align 8
  %4 = bitcast %"class.std::allocator"* %3 to %"class.__gnu_cxx::new_allocator"*
  call void @_ZN9__gnu_cxx13new_allocatorIiEC2Ev(%"class.__gnu_cxx::new_allocator"* %4) #3
  ret void
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define linkonce_odr dso_local void @_ZNSt12_Vector_baseIiSaIiEE17_Vector_impl_dataC2Ev(%"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"*) unnamed_addr #5 comdat align 2 {
  %2 = alloca %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"*, align 8
  store %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"* %0, %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"** %2, align 8
  %3 = load %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"*, %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"** %2, align 8
  %4 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data", %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"* %3, i32 0, i32 0
  store i32* null, i32** %4, align 8
  %5 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data", %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"* %3, i32 0, i32 1
  store i32* null, i32** %5, align 8
  %6 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data", %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"* %3, i32 0, i32 2
  store i32* null, i32** %6, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define linkonce_odr dso_local void @_ZN9__gnu_cxx13new_allocatorIiEC2Ev(%"class.__gnu_cxx::new_allocator"*) unnamed_addr #5 comdat align 2 {
  %2 = alloca %"class.__gnu_cxx::new_allocator"*, align 8
  store %"class.__gnu_cxx::new_allocator"* %0, %"class.__gnu_cxx::new_allocator"** %2, align 8
  %3 = load %"class.__gnu_cxx::new_allocator"*, %"class.__gnu_cxx::new_allocator"** %2, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define linkonce_odr dso_local void @_ZNSt6vectorIiSaIiEE15_M_erase_at_endEPi(%"class.std::vector"*, i32*) #5 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %"class.std::vector"*, align 8
  %4 = alloca i32*, align 8
  %5 = alloca i64, align 8
  store %"class.std::vector"* %0, %"class.std::vector"** %3, align 8
  store i32* %1, i32** %4, align 8
  %6 = load %"class.std::vector"*, %"class.std::vector"** %3, align 8
  %7 = bitcast %"class.std::vector"* %6 to %"struct.std::_Vector_base"*
  %8 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %7, i32 0, i32 0
  %9 = bitcast %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"* %8 to %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"*
  %10 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data", %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"* %9, i32 0, i32 1
  %11 = load i32*, i32** %10, align 8
  %12 = load i32*, i32** %4, align 8
  %13 = ptrtoint i32* %11 to i64
  %14 = ptrtoint i32* %12 to i64
  %15 = sub i64 %13, %14
  %16 = sdiv exact i64 %15, 4
  store i64 %16, i64* %5, align 8
  %17 = load i64, i64* %5, align 8
  %18 = icmp ne i64 %17, 0
  br i1 %18, label %19, label %34

; <label>:19:                                     ; preds = %2
  %20 = load i32*, i32** %4, align 8
  %21 = bitcast %"class.std::vector"* %6 to %"struct.std::_Vector_base"*
  %22 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %21, i32 0, i32 0
  %23 = bitcast %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"* %22 to %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"*
  %24 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data", %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"* %23, i32 0, i32 1
  %25 = load i32*, i32** %24, align 8
  %26 = bitcast %"class.std::vector"* %6 to %"struct.std::_Vector_base"*
  %27 = call dereferenceable(1) %"class.std::allocator"* @_ZNSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base"* %26) #3
  invoke void @_ZSt8_DestroyIPiiEvT_S1_RSaIT0_E(i32* %20, i32* %25, %"class.std::allocator"* dereferenceable(1) %27)
          to label %28 unwind label %35

; <label>:28:                                     ; preds = %19
  %29 = load i32*, i32** %4, align 8
  %30 = bitcast %"class.std::vector"* %6 to %"struct.std::_Vector_base"*
  %31 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %30, i32 0, i32 0
  %32 = bitcast %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"* %31 to %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"*
  %33 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data", %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"* %32, i32 0, i32 1
  store i32* %29, i32** %33, align 8
  br label %34

; <label>:34:                                     ; preds = %28, %2
  ret void

; <label>:35:                                     ; preds = %19
  %36 = landingpad { i8*, i32 }
          catch i8* null
  %37 = extractvalue { i8*, i32 } %36, 0
  call void @__clang_call_terminate(i8* %37) #12
  unreachable
}

; Function Attrs: noinline optnone sspstrong uwtable
define linkonce_odr dso_local void @_ZSt8_DestroyIPiiEvT_S1_RSaIT0_E(i32*, i32*, %"class.std::allocator"* dereferenceable(1)) #4 comdat {
  %4 = alloca i32*, align 8
  %5 = alloca i32*, align 8
  %6 = alloca %"class.std::allocator"*, align 8
  store i32* %0, i32** %4, align 8
  store i32* %1, i32** %5, align 8
  store %"class.std::allocator"* %2, %"class.std::allocator"** %6, align 8
  %7 = load i32*, i32** %4, align 8
  %8 = load i32*, i32** %5, align 8
  call void @_ZSt8_DestroyIPiEvT_S1_(i32* %7, i32* %8)
  ret void
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define linkonce_odr dso_local dereferenceable(1) %"class.std::allocator"* @_ZNSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base"*) #5 comdat align 2 {
  %2 = alloca %"struct.std::_Vector_base"*, align 8
  store %"struct.std::_Vector_base"* %0, %"struct.std::_Vector_base"** %2, align 8
  %3 = load %"struct.std::_Vector_base"*, %"struct.std::_Vector_base"** %2, align 8
  %4 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %3, i32 0, i32 0
  %5 = bitcast %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"* %4 to %"class.std::allocator"*
  ret %"class.std::allocator"* %5
}

; Function Attrs: noinline noreturn nounwind
define linkonce_odr hidden void @__clang_call_terminate(i8*) #7 comdat {
  %2 = call i8* @__cxa_begin_catch(i8* %0) #3
  call void @_ZSt9terminatev() #12
  unreachable
}

declare i8* @__cxa_begin_catch(i8*)

declare void @_ZSt9terminatev()

; Function Attrs: noinline optnone sspstrong uwtable
define linkonce_odr dso_local void @_ZSt8_DestroyIPiEvT_S1_(i32*, i32*) #4 comdat {
  %3 = alloca i32*, align 8
  %4 = alloca i32*, align 8
  store i32* %0, i32** %3, align 8
  store i32* %1, i32** %4, align 8
  %5 = load i32*, i32** %3, align 8
  %6 = load i32*, i32** %4, align 8
  call void @_ZNSt12_Destroy_auxILb1EE9__destroyIPiEEvT_S3_(i32* %5, i32* %6)
  ret void
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define linkonce_odr dso_local void @_ZNSt12_Destroy_auxILb1EE9__destroyIPiEEvT_S3_(i32*, i32*) #5 comdat align 2 {
  %3 = alloca i32*, align 8
  %4 = alloca i32*, align 8
  store i32* %0, i32** %3, align 8
  store i32* %1, i32** %4, align 8
  ret void
}

; Function Attrs: noinline optnone sspstrong uwtable
define linkonce_odr dso_local void @_ZNSt6vectorIiSaIiEE12emplace_backIJiEEEvDpOT_(%"class.std::vector"*, i32* dereferenceable(4)) #4 comdat align 2 {
  %3 = alloca %"class.std::vector"*, align 8
  %4 = alloca i32*, align 8
  %5 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  store %"class.std::vector"* %0, %"class.std::vector"** %3, align 8
  store i32* %1, i32** %4, align 8
  %6 = load %"class.std::vector"*, %"class.std::vector"** %3, align 8
  %7 = bitcast %"class.std::vector"* %6 to %"struct.std::_Vector_base"*
  %8 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %7, i32 0, i32 0
  %9 = bitcast %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"* %8 to %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"*
  %10 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data", %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"* %9, i32 0, i32 1
  %11 = load i32*, i32** %10, align 8
  %12 = bitcast %"class.std::vector"* %6 to %"struct.std::_Vector_base"*
  %13 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %12, i32 0, i32 0
  %14 = bitcast %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"* %13 to %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"*
  %15 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data", %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"* %14, i32 0, i32 2
  %16 = load i32*, i32** %15, align 8
  %17 = icmp ne i32* %11, %16
  br i1 %17, label %18, label %35

; <label>:18:                                     ; preds = %2
  %19 = bitcast %"class.std::vector"* %6 to %"struct.std::_Vector_base"*
  %20 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %19, i32 0, i32 0
  %21 = bitcast %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"* %20 to %"class.std::allocator"*
  %22 = bitcast %"class.std::vector"* %6 to %"struct.std::_Vector_base"*
  %23 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %22, i32 0, i32 0
  %24 = bitcast %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"* %23 to %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"*
  %25 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data", %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"* %24, i32 0, i32 1
  %26 = load i32*, i32** %25, align 8
  %27 = load i32*, i32** %4, align 8
  %28 = call dereferenceable(4) i32* @_ZSt7forwardIiEOT_RNSt16remove_referenceIS0_E4typeE(i32* dereferenceable(4) %27) #3
  call void @_ZNSt16allocator_traitsISaIiEE9constructIiJiEEEvRS0_PT_DpOT0_(%"class.std::allocator"* dereferenceable(1) %21, i32* %26, i32* dereferenceable(4) %28) #3
  %29 = bitcast %"class.std::vector"* %6 to %"struct.std::_Vector_base"*
  %30 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %29, i32 0, i32 0
  %31 = bitcast %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"* %30 to %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"*
  %32 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data", %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"* %31, i32 0, i32 1
  %33 = load i32*, i32** %32, align 8
  %34 = getelementptr inbounds i32, i32* %33, i32 1
  store i32* %34, i32** %32, align 8
  br label %42

; <label>:35:                                     ; preds = %2
  %36 = call i32* @_ZNSt6vectorIiSaIiEE3endEv(%"class.std::vector"* %6) #3
  %37 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %5, i32 0, i32 0
  store i32* %36, i32** %37, align 8
  %38 = load i32*, i32** %4, align 8
  %39 = call dereferenceable(4) i32* @_ZSt7forwardIiEOT_RNSt16remove_referenceIS0_E4typeE(i32* dereferenceable(4) %38) #3
  %40 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %5, i32 0, i32 0
  %41 = load i32*, i32** %40, align 8
  call void @_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_(%"class.std::vector"* %6, i32* %41, i32* dereferenceable(4) %39)
  br label %42

; <label>:42:                                     ; preds = %35, %18
  ret void
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define linkonce_odr dso_local dereferenceable(4) i32* @_ZSt4moveIRiEONSt16remove_referenceIT_E4typeEOS2_(i32* dereferenceable(4)) #5 comdat {
  %2 = alloca i32*, align 8
  store i32* %0, i32** %2, align 8
  %3 = load i32*, i32** %2, align 8
  ret i32* %3
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define linkonce_odr dso_local void @_ZNSt16allocator_traitsISaIiEE9constructIiJiEEEvRS0_PT_DpOT0_(%"class.std::allocator"* dereferenceable(1), i32*, i32* dereferenceable(4)) #5 comdat align 2 {
  %4 = alloca %"class.std::allocator"*, align 8
  %5 = alloca i32*, align 8
  %6 = alloca i32*, align 8
  store %"class.std::allocator"* %0, %"class.std::allocator"** %4, align 8
  store i32* %1, i32** %5, align 8
  store i32* %2, i32** %6, align 8
  %7 = load %"class.std::allocator"*, %"class.std::allocator"** %4, align 8
  %8 = bitcast %"class.std::allocator"* %7 to %"class.__gnu_cxx::new_allocator"*
  %9 = load i32*, i32** %5, align 8
  %10 = load i32*, i32** %6, align 8
  %11 = call dereferenceable(4) i32* @_ZSt7forwardIiEOT_RNSt16remove_referenceIS0_E4typeE(i32* dereferenceable(4) %10) #3
  call void @_ZN9__gnu_cxx13new_allocatorIiE9constructIiJiEEEvPT_DpOT0_(%"class.__gnu_cxx::new_allocator"* %8, i32* %9, i32* dereferenceable(4) %11) #3
  ret void
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define linkonce_odr dso_local dereferenceable(4) i32* @_ZSt7forwardIiEOT_RNSt16remove_referenceIS0_E4typeE(i32* dereferenceable(4)) #5 comdat {
  %2 = alloca i32*, align 8
  store i32* %0, i32** %2, align 8
  %3 = load i32*, i32** %2, align 8
  ret i32* %3
}

; Function Attrs: noinline optnone sspstrong uwtable
define linkonce_odr dso_local void @_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_(%"class.std::vector"*, i32*, i32* dereferenceable(4)) #4 comdat align 2 {
  %4 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %5 = alloca %"class.std::vector"*, align 8
  %6 = alloca i32*, align 8
  %7 = alloca i64, align 8
  %8 = alloca i32*, align 8
  %9 = alloca i32*, align 8
  %10 = alloca i64, align 8
  %11 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %12 = alloca i32*, align 8
  %13 = alloca i32*, align 8
  %14 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %4, i32 0, i32 0
  store i32* %1, i32** %14, align 8
  store %"class.std::vector"* %0, %"class.std::vector"** %5, align 8
  store i32* %2, i32** %6, align 8
  %15 = load %"class.std::vector"*, %"class.std::vector"** %5, align 8
  %16 = call i64 @_ZNKSt6vectorIiSaIiEE12_M_check_lenEmPKc(%"class.std::vector"* %15, i64 1, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.4, i32 0, i32 0))
  store i64 %16, i64* %7, align 8
  %17 = bitcast %"class.std::vector"* %15 to %"struct.std::_Vector_base"*
  %18 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %17, i32 0, i32 0
  %19 = bitcast %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"* %18 to %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"*
  %20 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data", %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"* %19, i32 0, i32 0
  %21 = load i32*, i32** %20, align 8
  store i32* %21, i32** %8, align 8
  %22 = bitcast %"class.std::vector"* %15 to %"struct.std::_Vector_base"*
  %23 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %22, i32 0, i32 0
  %24 = bitcast %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"* %23 to %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"*
  %25 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data", %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"* %24, i32 0, i32 1
  %26 = load i32*, i32** %25, align 8
  store i32* %26, i32** %9, align 8
  %27 = call i32* @_ZNSt6vectorIiSaIiEE5beginEv(%"class.std::vector"* %15) #3
  %28 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %11, i32 0, i32 0
  store i32* %27, i32** %28, align 8
  %29 = call i64 @_ZN9__gnu_cxxmiIPiSt6vectorIiSaIiEEEENS_17__normal_iteratorIT_T0_E15difference_typeERKS8_SB_(%"class.__gnu_cxx::__normal_iterator"* dereferenceable(8) %4, %"class.__gnu_cxx::__normal_iterator"* dereferenceable(8) %11) #3
  store i64 %29, i64* %10, align 8
  %30 = bitcast %"class.std::vector"* %15 to %"struct.std::_Vector_base"*
  %31 = load i64, i64* %7, align 8
  %32 = call i32* @_ZNSt12_Vector_baseIiSaIiEE11_M_allocateEm(%"struct.std::_Vector_base"* %30, i64 %31)
  store i32* %32, i32** %12, align 8
  %33 = load i32*, i32** %12, align 8
  store i32* %33, i32** %13, align 8
  %34 = bitcast %"class.std::vector"* %15 to %"struct.std::_Vector_base"*
  %35 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %34, i32 0, i32 0
  %36 = bitcast %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"* %35 to %"class.std::allocator"*
  %37 = load i32*, i32** %12, align 8
  %38 = load i64, i64* %10, align 8
  %39 = getelementptr inbounds i32, i32* %37, i64 %38
  %40 = load i32*, i32** %6, align 8
  %41 = call dereferenceable(4) i32* @_ZSt7forwardIiEOT_RNSt16remove_referenceIS0_E4typeE(i32* dereferenceable(4) %40) #3
  call void @_ZNSt16allocator_traitsISaIiEE9constructIiJiEEEvRS0_PT_DpOT0_(%"class.std::allocator"* dereferenceable(1) %36, i32* %39, i32* dereferenceable(4) %41) #3
  store i32* null, i32** %13, align 8
  %42 = load i32*, i32** %8, align 8
  %43 = call dereferenceable(8) i32** @_ZNK9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEE4baseEv(%"class.__gnu_cxx::__normal_iterator"* %4) #3
  %44 = load i32*, i32** %43, align 8
  %45 = load i32*, i32** %12, align 8
  %46 = bitcast %"class.std::vector"* %15 to %"struct.std::_Vector_base"*
  %47 = call dereferenceable(1) %"class.std::allocator"* @_ZNSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base"* %46) #3
  %48 = call i32* @_ZNSt6vectorIiSaIiEE11_S_relocateEPiS2_S2_RS0_(i32* %42, i32* %44, i32* %45, %"class.std::allocator"* dereferenceable(1) %47) #3
  store i32* %48, i32** %13, align 8
  %49 = load i32*, i32** %13, align 8
  %50 = getelementptr inbounds i32, i32* %49, i32 1
  store i32* %50, i32** %13, align 8
  %51 = call dereferenceable(8) i32** @_ZNK9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEE4baseEv(%"class.__gnu_cxx::__normal_iterator"* %4) #3
  %52 = load i32*, i32** %51, align 8
  %53 = load i32*, i32** %9, align 8
  %54 = load i32*, i32** %13, align 8
  %55 = bitcast %"class.std::vector"* %15 to %"struct.std::_Vector_base"*
  %56 = call dereferenceable(1) %"class.std::allocator"* @_ZNSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base"* %55) #3
  %57 = call i32* @_ZNSt6vectorIiSaIiEE11_S_relocateEPiS2_S2_RS0_(i32* %52, i32* %53, i32* %54, %"class.std::allocator"* dereferenceable(1) %56) #3
  store i32* %57, i32** %13, align 8
  %58 = bitcast %"class.std::vector"* %15 to %"struct.std::_Vector_base"*
  %59 = load i32*, i32** %8, align 8
  %60 = bitcast %"class.std::vector"* %15 to %"struct.std::_Vector_base"*
  %61 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %60, i32 0, i32 0
  %62 = bitcast %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"* %61 to %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"*
  %63 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data", %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"* %62, i32 0, i32 2
  %64 = load i32*, i32** %63, align 8
  %65 = load i32*, i32** %8, align 8
  %66 = ptrtoint i32* %64 to i64
  %67 = ptrtoint i32* %65 to i64
  %68 = sub i64 %66, %67
  %69 = sdiv exact i64 %68, 4
  call void @_ZNSt12_Vector_baseIiSaIiEE13_M_deallocateEPim(%"struct.std::_Vector_base"* %58, i32* %59, i64 %69)
  %70 = load i32*, i32** %12, align 8
  %71 = bitcast %"class.std::vector"* %15 to %"struct.std::_Vector_base"*
  %72 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %71, i32 0, i32 0
  %73 = bitcast %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"* %72 to %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"*
  %74 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data", %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"* %73, i32 0, i32 0
  store i32* %70, i32** %74, align 8
  %75 = load i32*, i32** %13, align 8
  %76 = bitcast %"class.std::vector"* %15 to %"struct.std::_Vector_base"*
  %77 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %76, i32 0, i32 0
  %78 = bitcast %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"* %77 to %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"*
  %79 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data", %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"* %78, i32 0, i32 1
  store i32* %75, i32** %79, align 8
  %80 = load i32*, i32** %12, align 8
  %81 = load i64, i64* %7, align 8
  %82 = getelementptr inbounds i32, i32* %80, i64 %81
  %83 = bitcast %"class.std::vector"* %15 to %"struct.std::_Vector_base"*
  %84 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %83, i32 0, i32 0
  %85 = bitcast %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"* %84 to %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"*
  %86 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data", %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"* %85, i32 0, i32 2
  store i32* %82, i32** %86, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define linkonce_odr dso_local i32* @_ZNSt6vectorIiSaIiEE3endEv(%"class.std::vector"*) #5 comdat align 2 {
  %2 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %3 = alloca %"class.std::vector"*, align 8
  store %"class.std::vector"* %0, %"class.std::vector"** %3, align 8
  %4 = load %"class.std::vector"*, %"class.std::vector"** %3, align 8
  %5 = bitcast %"class.std::vector"* %4 to %"struct.std::_Vector_base"*
  %6 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %5, i32 0, i32 0
  %7 = bitcast %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"* %6 to %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"*
  %8 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data", %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"* %7, i32 0, i32 1
  call void @_ZN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEC2ERKS1_(%"class.__gnu_cxx::__normal_iterator"* %2, i32** dereferenceable(8) %8) #3
  %9 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %2, i32 0, i32 0
  %10 = load i32*, i32** %9, align 8
  ret i32* %10
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define linkonce_odr dso_local void @_ZN9__gnu_cxx13new_allocatorIiE9constructIiJiEEEvPT_DpOT0_(%"class.__gnu_cxx::new_allocator"*, i32*, i32* dereferenceable(4)) #5 comdat align 2 {
  %4 = alloca %"class.__gnu_cxx::new_allocator"*, align 8
  %5 = alloca i32*, align 8
  %6 = alloca i32*, align 8
  store %"class.__gnu_cxx::new_allocator"* %0, %"class.__gnu_cxx::new_allocator"** %4, align 8
  store i32* %1, i32** %5, align 8
  store i32* %2, i32** %6, align 8
  %7 = load %"class.__gnu_cxx::new_allocator"*, %"class.__gnu_cxx::new_allocator"** %4, align 8
  %8 = load i32*, i32** %5, align 8
  %9 = bitcast i32* %8 to i8*
  %10 = bitcast i8* %9 to i32*
  %11 = load i32*, i32** %6, align 8
  %12 = call dereferenceable(4) i32* @_ZSt7forwardIiEOT_RNSt16remove_referenceIS0_E4typeE(i32* dereferenceable(4) %11) #3
  %13 = load i32, i32* %12, align 4
  store i32 %13, i32* %10, align 4
  ret void
}

; Function Attrs: noinline optnone sspstrong uwtable
define linkonce_odr dso_local i64 @_ZNKSt6vectorIiSaIiEE12_M_check_lenEmPKc(%"class.std::vector"*, i64, i8*) #4 comdat align 2 {
  %4 = alloca %"class.std::vector"*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  store %"class.std::vector"* %0, %"class.std::vector"** %4, align 8
  store i64 %1, i64* %5, align 8
  store i8* %2, i8** %6, align 8
  %9 = load %"class.std::vector"*, %"class.std::vector"** %4, align 8
  %10 = call i64 @_ZNKSt6vectorIiSaIiEE8max_sizeEv(%"class.std::vector"* %9) #3
  %11 = call i64 @_ZNKSt6vectorIiSaIiEE4sizeEv(%"class.std::vector"* %9) #3
  %12 = sub i64 %10, %11
  %13 = load i64, i64* %5, align 8
  %14 = icmp ult i64 %12, %13
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %3
  %16 = load i8*, i8** %6, align 8
  call void @_ZSt20__throw_length_errorPKc(i8* %16) #13
  unreachable

; <label>:17:                                     ; preds = %3
  %18 = call i64 @_ZNKSt6vectorIiSaIiEE4sizeEv(%"class.std::vector"* %9) #3
  %19 = call i64 @_ZNKSt6vectorIiSaIiEE4sizeEv(%"class.std::vector"* %9) #3
  store i64 %19, i64* %8, align 8
  %20 = call dereferenceable(8) i64* @_ZSt3maxImERKT_S2_S2_(i64* dereferenceable(8) %8, i64* dereferenceable(8) %5)
  %21 = load i64, i64* %20, align 8
  %22 = add i64 %18, %21
  store i64 %22, i64* %7, align 8
  %23 = load i64, i64* %7, align 8
  %24 = call i64 @_ZNKSt6vectorIiSaIiEE4sizeEv(%"class.std::vector"* %9) #3
  %25 = icmp ult i64 %23, %24
  br i1 %25, label %30, label %26

; <label>:26:                                     ; preds = %17
  %27 = load i64, i64* %7, align 8
  %28 = call i64 @_ZNKSt6vectorIiSaIiEE8max_sizeEv(%"class.std::vector"* %9) #3
  %29 = icmp ugt i64 %27, %28
  br i1 %29, label %30, label %32

; <label>:30:                                     ; preds = %26, %17
  %31 = call i64 @_ZNKSt6vectorIiSaIiEE8max_sizeEv(%"class.std::vector"* %9) #3
  br label %34

; <label>:32:                                     ; preds = %26
  %33 = load i64, i64* %7, align 8
  br label %34

; <label>:34:                                     ; preds = %32, %30
  %35 = phi i64 [ %31, %30 ], [ %33, %32 ]
  ret i64 %35
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define linkonce_odr dso_local i64 @_ZN9__gnu_cxxmiIPiSt6vectorIiSaIiEEEENS_17__normal_iteratorIT_T0_E15difference_typeERKS8_SB_(%"class.__gnu_cxx::__normal_iterator"* dereferenceable(8), %"class.__gnu_cxx::__normal_iterator"* dereferenceable(8)) #5 comdat {
  %3 = alloca %"class.__gnu_cxx::__normal_iterator"*, align 8
  %4 = alloca %"class.__gnu_cxx::__normal_iterator"*, align 8
  store %"class.__gnu_cxx::__normal_iterator"* %0, %"class.__gnu_cxx::__normal_iterator"** %3, align 8
  store %"class.__gnu_cxx::__normal_iterator"* %1, %"class.__gnu_cxx::__normal_iterator"** %4, align 8
  %5 = load %"class.__gnu_cxx::__normal_iterator"*, %"class.__gnu_cxx::__normal_iterator"** %3, align 8
  %6 = call dereferenceable(8) i32** @_ZNK9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEE4baseEv(%"class.__gnu_cxx::__normal_iterator"* %5) #3
  %7 = load i32*, i32** %6, align 8
  %8 = load %"class.__gnu_cxx::__normal_iterator"*, %"class.__gnu_cxx::__normal_iterator"** %4, align 8
  %9 = call dereferenceable(8) i32** @_ZNK9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEE4baseEv(%"class.__gnu_cxx::__normal_iterator"* %8) #3
  %10 = load i32*, i32** %9, align 8
  %11 = ptrtoint i32* %7 to i64
  %12 = ptrtoint i32* %10 to i64
  %13 = sub i64 %11, %12
  %14 = sdiv exact i64 %13, 4
  ret i64 %14
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define linkonce_odr dso_local i32* @_ZNSt6vectorIiSaIiEE5beginEv(%"class.std::vector"*) #5 comdat align 2 {
  %2 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %3 = alloca %"class.std::vector"*, align 8
  store %"class.std::vector"* %0, %"class.std::vector"** %3, align 8
  %4 = load %"class.std::vector"*, %"class.std::vector"** %3, align 8
  %5 = bitcast %"class.std::vector"* %4 to %"struct.std::_Vector_base"*
  %6 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %5, i32 0, i32 0
  %7 = bitcast %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"* %6 to %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"*
  %8 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data", %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"* %7, i32 0, i32 0
  call void @_ZN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEC2ERKS1_(%"class.__gnu_cxx::__normal_iterator"* %2, i32** dereferenceable(8) %8) #3
  %9 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %2, i32 0, i32 0
  %10 = load i32*, i32** %9, align 8
  ret i32* %10
}

; Function Attrs: noinline optnone sspstrong uwtable
define linkonce_odr dso_local i32* @_ZNSt12_Vector_baseIiSaIiEE11_M_allocateEm(%"struct.std::_Vector_base"*, i64) #4 comdat align 2 {
  %3 = alloca %"struct.std::_Vector_base"*, align 8
  %4 = alloca i64, align 8
  store %"struct.std::_Vector_base"* %0, %"struct.std::_Vector_base"** %3, align 8
  store i64 %1, i64* %4, align 8
  %5 = load %"struct.std::_Vector_base"*, %"struct.std::_Vector_base"** %3, align 8
  %6 = load i64, i64* %4, align 8
  %7 = icmp ne i64 %6, 0
  br i1 %7, label %8, label %13

; <label>:8:                                      ; preds = %2
  %9 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %5, i32 0, i32 0
  %10 = bitcast %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"* %9 to %"class.std::allocator"*
  %11 = load i64, i64* %4, align 8
  %12 = call i32* @_ZNSt16allocator_traitsISaIiEE8allocateERS0_m(%"class.std::allocator"* dereferenceable(1) %10, i64 %11)
  br label %14

; <label>:13:                                     ; preds = %2
  br label %14

; <label>:14:                                     ; preds = %13, %8
  %15 = phi i32* [ %12, %8 ], [ null, %13 ]
  ret i32* %15
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define linkonce_odr dso_local i32* @_ZNSt6vectorIiSaIiEE11_S_relocateEPiS2_S2_RS0_(i32*, i32*, i32*, %"class.std::allocator"* dereferenceable(1)) #5 comdat align 2 {
  %5 = alloca i32*, align 8
  %6 = alloca i32*, align 8
  %7 = alloca i32*, align 8
  %8 = alloca %"class.std::allocator"*, align 8
  %9 = alloca %"struct.std::integral_constant", align 1
  store i32* %0, i32** %5, align 8
  store i32* %1, i32** %6, align 8
  store i32* %2, i32** %7, align 8
  store %"class.std::allocator"* %3, %"class.std::allocator"** %8, align 8
  %10 = load i32*, i32** %5, align 8
  %11 = load i32*, i32** %6, align 8
  %12 = load i32*, i32** %7, align 8
  %13 = load %"class.std::allocator"*, %"class.std::allocator"** %8, align 8
  %14 = call i32* @_ZNSt6vectorIiSaIiEE14_S_do_relocateEPiS2_S2_RS0_St17integral_constantIbLb1EE(i32* %10, i32* %11, i32* %12, %"class.std::allocator"* dereferenceable(1) %13) #3
  ret i32* %14
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define linkonce_odr dso_local dereferenceable(8) i32** @_ZNK9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEE4baseEv(%"class.__gnu_cxx::__normal_iterator"*) #5 comdat align 2 {
  %2 = alloca %"class.__gnu_cxx::__normal_iterator"*, align 8
  store %"class.__gnu_cxx::__normal_iterator"* %0, %"class.__gnu_cxx::__normal_iterator"** %2, align 8
  %3 = load %"class.__gnu_cxx::__normal_iterator"*, %"class.__gnu_cxx::__normal_iterator"** %2, align 8
  %4 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %3, i32 0, i32 0
  ret i32** %4
}

; Function Attrs: noinline optnone sspstrong uwtable
define linkonce_odr dso_local void @_ZNSt12_Vector_baseIiSaIiEE13_M_deallocateEPim(%"struct.std::_Vector_base"*, i32*, i64) #4 comdat align 2 {
  %4 = alloca %"struct.std::_Vector_base"*, align 8
  %5 = alloca i32*, align 8
  %6 = alloca i64, align 8
  store %"struct.std::_Vector_base"* %0, %"struct.std::_Vector_base"** %4, align 8
  store i32* %1, i32** %5, align 8
  store i64 %2, i64* %6, align 8
  %7 = load %"struct.std::_Vector_base"*, %"struct.std::_Vector_base"** %4, align 8
  %8 = load i32*, i32** %5, align 8
  %9 = icmp ne i32* %8, null
  br i1 %9, label %10, label %15

; <label>:10:                                     ; preds = %3
  %11 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %7, i32 0, i32 0
  %12 = bitcast %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"* %11 to %"class.std::allocator"*
  %13 = load i32*, i32** %5, align 8
  %14 = load i64, i64* %6, align 8
  call void @_ZNSt16allocator_traitsISaIiEE10deallocateERS0_Pim(%"class.std::allocator"* dereferenceable(1) %12, i32* %13, i64 %14)
  br label %15

; <label>:15:                                     ; preds = %10, %3
  ret void
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define linkonce_odr dso_local i64 @_ZNKSt6vectorIiSaIiEE8max_sizeEv(%"class.std::vector"*) #5 comdat align 2 {
  %2 = alloca %"class.std::vector"*, align 8
  store %"class.std::vector"* %0, %"class.std::vector"** %2, align 8
  %3 = load %"class.std::vector"*, %"class.std::vector"** %2, align 8
  %4 = bitcast %"class.std::vector"* %3 to %"struct.std::_Vector_base"*
  %5 = call dereferenceable(1) %"class.std::allocator"* @_ZNKSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base"* %4) #3
  %6 = call i64 @_ZNSt6vectorIiSaIiEE11_S_max_sizeERKS0_(%"class.std::allocator"* dereferenceable(1) %5) #3
  ret i64 %6
}

; Function Attrs: noreturn
declare void @_ZSt20__throw_length_errorPKc(i8*) #8

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define linkonce_odr dso_local dereferenceable(8) i64* @_ZSt3maxImERKT_S2_S2_(i64* dereferenceable(8), i64* dereferenceable(8)) #5 comdat {
  %3 = alloca i64*, align 8
  %4 = alloca i64*, align 8
  %5 = alloca i64*, align 8
  store i64* %0, i64** %4, align 8
  store i64* %1, i64** %5, align 8
  %6 = load i64*, i64** %4, align 8
  %7 = load i64, i64* %6, align 8
  %8 = load i64*, i64** %5, align 8
  %9 = load i64, i64* %8, align 8
  %10 = icmp ult i64 %7, %9
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %2
  %12 = load i64*, i64** %5, align 8
  store i64* %12, i64** %3, align 8
  br label %15

; <label>:13:                                     ; preds = %2
  %14 = load i64*, i64** %4, align 8
  store i64* %14, i64** %3, align 8
  br label %15

; <label>:15:                                     ; preds = %13, %11
  %16 = load i64*, i64** %3, align 8
  ret i64* %16
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define linkonce_odr dso_local i64 @_ZNSt6vectorIiSaIiEE11_S_max_sizeERKS0_(%"class.std::allocator"* dereferenceable(1)) #5 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = alloca %"class.std::allocator"*, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  store %"class.std::allocator"* %0, %"class.std::allocator"** %2, align 8
  store i64 2305843009213693951, i64* %3, align 8
  %5 = load %"class.std::allocator"*, %"class.std::allocator"** %2, align 8
  %6 = call i64 @_ZNSt16allocator_traitsISaIiEE8max_sizeERKS0_(%"class.std::allocator"* dereferenceable(1) %5) #3
  store i64 %6, i64* %4, align 8
  %7 = invoke dereferenceable(8) i64* @_ZSt3minImERKT_S2_S2_(i64* dereferenceable(8) %3, i64* dereferenceable(8) %4)
          to label %8 unwind label %10

; <label>:8:                                      ; preds = %1
  %9 = load i64, i64* %7, align 8
  ret i64 %9

; <label>:10:                                     ; preds = %1
  %11 = landingpad { i8*, i32 }
          catch i8* null
  %12 = extractvalue { i8*, i32 } %11, 0
  call void @__clang_call_terminate(i8* %12) #12
  unreachable
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define linkonce_odr dso_local dereferenceable(1) %"class.std::allocator"* @_ZNKSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base"*) #5 comdat align 2 {
  %2 = alloca %"struct.std::_Vector_base"*, align 8
  store %"struct.std::_Vector_base"* %0, %"struct.std::_Vector_base"** %2, align 8
  %3 = load %"struct.std::_Vector_base"*, %"struct.std::_Vector_base"** %2, align 8
  %4 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %3, i32 0, i32 0
  %5 = bitcast %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"* %4 to %"class.std::allocator"*
  ret %"class.std::allocator"* %5
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define linkonce_odr dso_local i64 @_ZNSt16allocator_traitsISaIiEE8max_sizeERKS0_(%"class.std::allocator"* dereferenceable(1)) #5 comdat align 2 {
  %2 = alloca %"class.std::allocator"*, align 8
  store %"class.std::allocator"* %0, %"class.std::allocator"** %2, align 8
  %3 = load %"class.std::allocator"*, %"class.std::allocator"** %2, align 8
  %4 = bitcast %"class.std::allocator"* %3 to %"class.__gnu_cxx::new_allocator"*
  %5 = call i64 @_ZNK9__gnu_cxx13new_allocatorIiE8max_sizeEv(%"class.__gnu_cxx::new_allocator"* %4) #3
  ret i64 %5
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define linkonce_odr dso_local dereferenceable(8) i64* @_ZSt3minImERKT_S2_S2_(i64* dereferenceable(8), i64* dereferenceable(8)) #5 comdat {
  %3 = alloca i64*, align 8
  %4 = alloca i64*, align 8
  %5 = alloca i64*, align 8
  store i64* %0, i64** %4, align 8
  store i64* %1, i64** %5, align 8
  %6 = load i64*, i64** %5, align 8
  %7 = load i64, i64* %6, align 8
  %8 = load i64*, i64** %4, align 8
  %9 = load i64, i64* %8, align 8
  %10 = icmp ult i64 %7, %9
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %2
  %12 = load i64*, i64** %5, align 8
  store i64* %12, i64** %3, align 8
  br label %15

; <label>:13:                                     ; preds = %2
  %14 = load i64*, i64** %4, align 8
  store i64* %14, i64** %3, align 8
  br label %15

; <label>:15:                                     ; preds = %13, %11
  %16 = load i64*, i64** %3, align 8
  ret i64* %16
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define linkonce_odr dso_local i64 @_ZNK9__gnu_cxx13new_allocatorIiE8max_sizeEv(%"class.__gnu_cxx::new_allocator"*) #5 comdat align 2 {
  %2 = alloca %"class.__gnu_cxx::new_allocator"*, align 8
  store %"class.__gnu_cxx::new_allocator"* %0, %"class.__gnu_cxx::new_allocator"** %2, align 8
  %3 = load %"class.__gnu_cxx::new_allocator"*, %"class.__gnu_cxx::new_allocator"** %2, align 8
  ret i64 2305843009213693951
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define linkonce_odr dso_local void @_ZN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEC2ERKS1_(%"class.__gnu_cxx::__normal_iterator"*, i32** dereferenceable(8)) unnamed_addr #5 comdat align 2 {
  %3 = alloca %"class.__gnu_cxx::__normal_iterator"*, align 8
  %4 = alloca i32**, align 8
  store %"class.__gnu_cxx::__normal_iterator"* %0, %"class.__gnu_cxx::__normal_iterator"** %3, align 8
  store i32** %1, i32*** %4, align 8
  %5 = load %"class.__gnu_cxx::__normal_iterator"*, %"class.__gnu_cxx::__normal_iterator"** %3, align 8
  %6 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %5, i32 0, i32 0
  %7 = load i32**, i32*** %4, align 8
  %8 = load i32*, i32** %7, align 8
  store i32* %8, i32** %6, align 8
  ret void
}

; Function Attrs: noinline optnone sspstrong uwtable
define linkonce_odr dso_local i32* @_ZNSt16allocator_traitsISaIiEE8allocateERS0_m(%"class.std::allocator"* dereferenceable(1), i64) #4 comdat align 2 {
  %3 = alloca %"class.std::allocator"*, align 8
  %4 = alloca i64, align 8
  store %"class.std::allocator"* %0, %"class.std::allocator"** %3, align 8
  store i64 %1, i64* %4, align 8
  %5 = load %"class.std::allocator"*, %"class.std::allocator"** %3, align 8
  %6 = bitcast %"class.std::allocator"* %5 to %"class.__gnu_cxx::new_allocator"*
  %7 = load i64, i64* %4, align 8
  %8 = call i32* @_ZN9__gnu_cxx13new_allocatorIiE8allocateEmPKv(%"class.__gnu_cxx::new_allocator"* %6, i64 %7, i8* null)
  ret i32* %8
}

; Function Attrs: noinline optnone sspstrong uwtable
define linkonce_odr dso_local i32* @_ZN9__gnu_cxx13new_allocatorIiE8allocateEmPKv(%"class.__gnu_cxx::new_allocator"*, i64, i8*) #4 comdat align 2 {
  %4 = alloca %"class.__gnu_cxx::new_allocator"*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i8*, align 8
  store %"class.__gnu_cxx::new_allocator"* %0, %"class.__gnu_cxx::new_allocator"** %4, align 8
  store i64 %1, i64* %5, align 8
  store i8* %2, i8** %6, align 8
  %7 = load %"class.__gnu_cxx::new_allocator"*, %"class.__gnu_cxx::new_allocator"** %4, align 8
  %8 = load i64, i64* %5, align 8
  %9 = call i64 @_ZNK9__gnu_cxx13new_allocatorIiE8max_sizeEv(%"class.__gnu_cxx::new_allocator"* %7) #3
  %10 = icmp ugt i64 %8, %9
  br i1 %10, label %11, label %12

; <label>:11:                                     ; preds = %3
  call void @_ZSt17__throw_bad_allocv() #13
  unreachable

; <label>:12:                                     ; preds = %3
  %13 = load i64, i64* %5, align 8
  %14 = mul i64 %13, 4
  %15 = call i8* @_Znwm(i64 %14)
  %16 = bitcast i8* %15 to i32*
  ret i32* %16
}

; Function Attrs: noreturn
declare void @_ZSt17__throw_bad_allocv() #8

; Function Attrs: nobuiltin
declare noalias i8* @_Znwm(i64) #9

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define linkonce_odr dso_local i32* @_ZNSt6vectorIiSaIiEE14_S_do_relocateEPiS2_S2_RS0_St17integral_constantIbLb1EE(i32*, i32*, i32*, %"class.std::allocator"* dereferenceable(1)) #5 comdat align 2 {
  %5 = alloca %"struct.std::integral_constant", align 1
  %6 = alloca i32*, align 8
  %7 = alloca i32*, align 8
  %8 = alloca i32*, align 8
  %9 = alloca %"class.std::allocator"*, align 8
  store i32* %0, i32** %6, align 8
  store i32* %1, i32** %7, align 8
  store i32* %2, i32** %8, align 8
  store %"class.std::allocator"* %3, %"class.std::allocator"** %9, align 8
  %10 = load i32*, i32** %6, align 8
  %11 = load i32*, i32** %7, align 8
  %12 = load i32*, i32** %8, align 8
  %13 = load %"class.std::allocator"*, %"class.std::allocator"** %9, align 8
  %14 = call i32* @_ZSt12__relocate_aIPiS0_SaIiEET0_T_S3_S2_RT1_(i32* %10, i32* %11, i32* %12, %"class.std::allocator"* dereferenceable(1) %13) #3
  ret i32* %14
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define linkonce_odr dso_local i32* @_ZSt12__relocate_aIPiS0_SaIiEET0_T_S3_S2_RT1_(i32*, i32*, i32*, %"class.std::allocator"* dereferenceable(1)) #5 comdat {
  %5 = alloca i32*, align 8
  %6 = alloca i32*, align 8
  %7 = alloca i32*, align 8
  %8 = alloca %"class.std::allocator"*, align 8
  store i32* %0, i32** %5, align 8
  store i32* %1, i32** %6, align 8
  store i32* %2, i32** %7, align 8
  store %"class.std::allocator"* %3, %"class.std::allocator"** %8, align 8
  %9 = load i32*, i32** %5, align 8
  %10 = call i32* @_ZSt12__niter_baseIPiET_S1_(i32* %9) #3
  %11 = load i32*, i32** %6, align 8
  %12 = call i32* @_ZSt12__niter_baseIPiET_S1_(i32* %11) #3
  %13 = load i32*, i32** %7, align 8
  %14 = call i32* @_ZSt12__niter_baseIPiET_S1_(i32* %13) #3
  %15 = load %"class.std::allocator"*, %"class.std::allocator"** %8, align 8
  %16 = call i32* @_ZSt14__relocate_a_1IiiENSt9enable_ifIXsr3std24__is_bitwise_relocatableIT_EE5valueEPS1_E4typeES2_S2_S2_RSaIT0_E(i32* %10, i32* %12, i32* %14, %"class.std::allocator"* dereferenceable(1) %15) #3
  ret i32* %16
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define linkonce_odr dso_local i32* @_ZSt14__relocate_a_1IiiENSt9enable_ifIXsr3std24__is_bitwise_relocatableIT_EE5valueEPS1_E4typeES2_S2_S2_RSaIT0_E(i32*, i32*, i32*, %"class.std::allocator"* dereferenceable(1)) #5 comdat {
  %5 = alloca i32*, align 8
  %6 = alloca i32*, align 8
  %7 = alloca i32*, align 8
  %8 = alloca %"class.std::allocator"*, align 8
  %9 = alloca i64, align 8
  store i32* %0, i32** %5, align 8
  store i32* %1, i32** %6, align 8
  store i32* %2, i32** %7, align 8
  store %"class.std::allocator"* %3, %"class.std::allocator"** %8, align 8
  %10 = load i32*, i32** %6, align 8
  %11 = load i32*, i32** %5, align 8
  %12 = ptrtoint i32* %10 to i64
  %13 = ptrtoint i32* %11 to i64
  %14 = sub i64 %12, %13
  %15 = sdiv exact i64 %14, 4
  store i64 %15, i64* %9, align 8
  %16 = load i64, i64* %9, align 8
  %17 = icmp sgt i64 %16, 0
  br i1 %17, label %18, label %25

; <label>:18:                                     ; preds = %4
  %19 = load i32*, i32** %7, align 8
  %20 = bitcast i32* %19 to i8*
  %21 = load i32*, i32** %5, align 8
  %22 = bitcast i32* %21 to i8*
  %23 = load i64, i64* %9, align 8
  %24 = mul i64 %23, 4
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %20, i8* align 4 %22, i64 %24, i1 false)
  br label %25

; <label>:25:                                     ; preds = %18, %4
  %26 = load i32*, i32** %7, align 8
  %27 = load i64, i64* %9, align 8
  %28 = getelementptr inbounds i32, i32* %26, i64 %27
  ret i32* %28
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define linkonce_odr dso_local i32* @_ZSt12__niter_baseIPiET_S1_(i32*) #5 comdat {
  %2 = alloca i32*, align 8
  store i32* %0, i32** %2, align 8
  %3 = load i32*, i32** %2, align 8
  ret i32* %3
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i1) #10

; Function Attrs: noinline optnone sspstrong uwtable
define linkonce_odr dso_local void @_ZNSt16allocator_traitsISaIiEE10deallocateERS0_Pim(%"class.std::allocator"* dereferenceable(1), i32*, i64) #4 comdat align 2 {
  %4 = alloca %"class.std::allocator"*, align 8
  %5 = alloca i32*, align 8
  %6 = alloca i64, align 8
  store %"class.std::allocator"* %0, %"class.std::allocator"** %4, align 8
  store i32* %1, i32** %5, align 8
  store i64 %2, i64* %6, align 8
  %7 = load %"class.std::allocator"*, %"class.std::allocator"** %4, align 8
  %8 = bitcast %"class.std::allocator"* %7 to %"class.__gnu_cxx::new_allocator"*
  %9 = load i32*, i32** %5, align 8
  %10 = load i64, i64* %6, align 8
  call void @_ZN9__gnu_cxx13new_allocatorIiE10deallocateEPim(%"class.__gnu_cxx::new_allocator"* %8, i32* %9, i64 %10)
  ret void
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define linkonce_odr dso_local void @_ZN9__gnu_cxx13new_allocatorIiE10deallocateEPim(%"class.__gnu_cxx::new_allocator"*, i32*, i64) #5 comdat align 2 {
  %4 = alloca %"class.__gnu_cxx::new_allocator"*, align 8
  %5 = alloca i32*, align 8
  %6 = alloca i64, align 8
  store %"class.__gnu_cxx::new_allocator"* %0, %"class.__gnu_cxx::new_allocator"** %4, align 8
  store i32* %1, i32** %5, align 8
  store i64 %2, i64* %6, align 8
  %7 = load %"class.__gnu_cxx::new_allocator"*, %"class.__gnu_cxx::new_allocator"** %4, align 8
  %8 = load i32*, i32** %5, align 8
  %9 = bitcast i32* %8 to i8*
  call void @_ZdlPv(i8* %9) #3
  ret void
}

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) #11

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define linkonce_odr dso_local void @_ZNSt16allocator_traitsISaIiEE9constructIiJRKiEEEvRS0_PT_DpOT0_(%"class.std::allocator"* dereferenceable(1), i32*, i32* dereferenceable(4)) #5 comdat align 2 {
  %4 = alloca %"class.std::allocator"*, align 8
  %5 = alloca i32*, align 8
  %6 = alloca i32*, align 8
  store %"class.std::allocator"* %0, %"class.std::allocator"** %4, align 8
  store i32* %1, i32** %5, align 8
  store i32* %2, i32** %6, align 8
  %7 = load %"class.std::allocator"*, %"class.std::allocator"** %4, align 8
  %8 = bitcast %"class.std::allocator"* %7 to %"class.__gnu_cxx::new_allocator"*
  %9 = load i32*, i32** %5, align 8
  %10 = load i32*, i32** %6, align 8
  %11 = call dereferenceable(4) i32* @_ZSt7forwardIRKiEOT_RNSt16remove_referenceIS2_E4typeE(i32* dereferenceable(4) %10) #3
  call void @_ZN9__gnu_cxx13new_allocatorIiE9constructIiJRKiEEEvPT_DpOT0_(%"class.__gnu_cxx::new_allocator"* %8, i32* %9, i32* dereferenceable(4) %11) #3
  ret void
}

; Function Attrs: noinline optnone sspstrong uwtable
define linkonce_odr dso_local void @_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_(%"class.std::vector"*, i32*, i32* dereferenceable(4)) #4 comdat align 2 {
  %4 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %5 = alloca %"class.std::vector"*, align 8
  %6 = alloca i32*, align 8
  %7 = alloca i64, align 8
  %8 = alloca i32*, align 8
  %9 = alloca i32*, align 8
  %10 = alloca i64, align 8
  %11 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %12 = alloca i32*, align 8
  %13 = alloca i32*, align 8
  %14 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %4, i32 0, i32 0
  store i32* %1, i32** %14, align 8
  store %"class.std::vector"* %0, %"class.std::vector"** %5, align 8
  store i32* %2, i32** %6, align 8
  %15 = load %"class.std::vector"*, %"class.std::vector"** %5, align 8
  %16 = call i64 @_ZNKSt6vectorIiSaIiEE12_M_check_lenEmPKc(%"class.std::vector"* %15, i64 1, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.4, i32 0, i32 0))
  store i64 %16, i64* %7, align 8
  %17 = bitcast %"class.std::vector"* %15 to %"struct.std::_Vector_base"*
  %18 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %17, i32 0, i32 0
  %19 = bitcast %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"* %18 to %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"*
  %20 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data", %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"* %19, i32 0, i32 0
  %21 = load i32*, i32** %20, align 8
  store i32* %21, i32** %8, align 8
  %22 = bitcast %"class.std::vector"* %15 to %"struct.std::_Vector_base"*
  %23 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %22, i32 0, i32 0
  %24 = bitcast %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"* %23 to %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"*
  %25 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data", %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"* %24, i32 0, i32 1
  %26 = load i32*, i32** %25, align 8
  store i32* %26, i32** %9, align 8
  %27 = call i32* @_ZNSt6vectorIiSaIiEE5beginEv(%"class.std::vector"* %15) #3
  %28 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %11, i32 0, i32 0
  store i32* %27, i32** %28, align 8
  %29 = call i64 @_ZN9__gnu_cxxmiIPiSt6vectorIiSaIiEEEENS_17__normal_iteratorIT_T0_E15difference_typeERKS8_SB_(%"class.__gnu_cxx::__normal_iterator"* dereferenceable(8) %4, %"class.__gnu_cxx::__normal_iterator"* dereferenceable(8) %11) #3
  store i64 %29, i64* %10, align 8
  %30 = bitcast %"class.std::vector"* %15 to %"struct.std::_Vector_base"*
  %31 = load i64, i64* %7, align 8
  %32 = call i32* @_ZNSt12_Vector_baseIiSaIiEE11_M_allocateEm(%"struct.std::_Vector_base"* %30, i64 %31)
  store i32* %32, i32** %12, align 8
  %33 = load i32*, i32** %12, align 8
  store i32* %33, i32** %13, align 8
  %34 = bitcast %"class.std::vector"* %15 to %"struct.std::_Vector_base"*
  %35 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %34, i32 0, i32 0
  %36 = bitcast %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"* %35 to %"class.std::allocator"*
  %37 = load i32*, i32** %12, align 8
  %38 = load i64, i64* %10, align 8
  %39 = getelementptr inbounds i32, i32* %37, i64 %38
  %40 = load i32*, i32** %6, align 8
  %41 = call dereferenceable(4) i32* @_ZSt7forwardIRKiEOT_RNSt16remove_referenceIS2_E4typeE(i32* dereferenceable(4) %40) #3
  call void @_ZNSt16allocator_traitsISaIiEE9constructIiJRKiEEEvRS0_PT_DpOT0_(%"class.std::allocator"* dereferenceable(1) %36, i32* %39, i32* dereferenceable(4) %41) #3
  store i32* null, i32** %13, align 8
  %42 = load i32*, i32** %8, align 8
  %43 = call dereferenceable(8) i32** @_ZNK9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEE4baseEv(%"class.__gnu_cxx::__normal_iterator"* %4) #3
  %44 = load i32*, i32** %43, align 8
  %45 = load i32*, i32** %12, align 8
  %46 = bitcast %"class.std::vector"* %15 to %"struct.std::_Vector_base"*
  %47 = call dereferenceable(1) %"class.std::allocator"* @_ZNSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base"* %46) #3
  %48 = call i32* @_ZNSt6vectorIiSaIiEE11_S_relocateEPiS2_S2_RS0_(i32* %42, i32* %44, i32* %45, %"class.std::allocator"* dereferenceable(1) %47) #3
  store i32* %48, i32** %13, align 8
  %49 = load i32*, i32** %13, align 8
  %50 = getelementptr inbounds i32, i32* %49, i32 1
  store i32* %50, i32** %13, align 8
  %51 = call dereferenceable(8) i32** @_ZNK9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEE4baseEv(%"class.__gnu_cxx::__normal_iterator"* %4) #3
  %52 = load i32*, i32** %51, align 8
  %53 = load i32*, i32** %9, align 8
  %54 = load i32*, i32** %13, align 8
  %55 = bitcast %"class.std::vector"* %15 to %"struct.std::_Vector_base"*
  %56 = call dereferenceable(1) %"class.std::allocator"* @_ZNSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base"* %55) #3
  %57 = call i32* @_ZNSt6vectorIiSaIiEE11_S_relocateEPiS2_S2_RS0_(i32* %52, i32* %53, i32* %54, %"class.std::allocator"* dereferenceable(1) %56) #3
  store i32* %57, i32** %13, align 8
  %58 = bitcast %"class.std::vector"* %15 to %"struct.std::_Vector_base"*
  %59 = load i32*, i32** %8, align 8
  %60 = bitcast %"class.std::vector"* %15 to %"struct.std::_Vector_base"*
  %61 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %60, i32 0, i32 0
  %62 = bitcast %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"* %61 to %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"*
  %63 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data", %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"* %62, i32 0, i32 2
  %64 = load i32*, i32** %63, align 8
  %65 = load i32*, i32** %8, align 8
  %66 = ptrtoint i32* %64 to i64
  %67 = ptrtoint i32* %65 to i64
  %68 = sub i64 %66, %67
  %69 = sdiv exact i64 %68, 4
  call void @_ZNSt12_Vector_baseIiSaIiEE13_M_deallocateEPim(%"struct.std::_Vector_base"* %58, i32* %59, i64 %69)
  %70 = load i32*, i32** %12, align 8
  %71 = bitcast %"class.std::vector"* %15 to %"struct.std::_Vector_base"*
  %72 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %71, i32 0, i32 0
  %73 = bitcast %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"* %72 to %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"*
  %74 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data", %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"* %73, i32 0, i32 0
  store i32* %70, i32** %74, align 8
  %75 = load i32*, i32** %13, align 8
  %76 = bitcast %"class.std::vector"* %15 to %"struct.std::_Vector_base"*
  %77 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %76, i32 0, i32 0
  %78 = bitcast %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"* %77 to %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"*
  %79 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data", %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"* %78, i32 0, i32 1
  store i32* %75, i32** %79, align 8
  %80 = load i32*, i32** %12, align 8
  %81 = load i64, i64* %7, align 8
  %82 = getelementptr inbounds i32, i32* %80, i64 %81
  %83 = bitcast %"class.std::vector"* %15 to %"struct.std::_Vector_base"*
  %84 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %83, i32 0, i32 0
  %85 = bitcast %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"* %84 to %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"*
  %86 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data", %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"* %85, i32 0, i32 2
  store i32* %82, i32** %86, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define linkonce_odr dso_local void @_ZN9__gnu_cxx13new_allocatorIiE9constructIiJRKiEEEvPT_DpOT0_(%"class.__gnu_cxx::new_allocator"*, i32*, i32* dereferenceable(4)) #5 comdat align 2 {
  %4 = alloca %"class.__gnu_cxx::new_allocator"*, align 8
  %5 = alloca i32*, align 8
  %6 = alloca i32*, align 8
  store %"class.__gnu_cxx::new_allocator"* %0, %"class.__gnu_cxx::new_allocator"** %4, align 8
  store i32* %1, i32** %5, align 8
  store i32* %2, i32** %6, align 8
  %7 = load %"class.__gnu_cxx::new_allocator"*, %"class.__gnu_cxx::new_allocator"** %4, align 8
  %8 = load i32*, i32** %5, align 8
  %9 = bitcast i32* %8 to i8*
  %10 = bitcast i8* %9 to i32*
  %11 = load i32*, i32** %6, align 8
  %12 = call dereferenceable(4) i32* @_ZSt7forwardIRKiEOT_RNSt16remove_referenceIS2_E4typeE(i32* dereferenceable(4) %11) #3
  %13 = load i32, i32* %12, align 4
  store i32 %13, i32* %10, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define linkonce_odr dso_local dereferenceable(4) i32* @_ZSt7forwardIRKiEOT_RNSt16remove_referenceIS2_E4typeE(i32* dereferenceable(4)) #5 comdat {
  %2 = alloca i32*, align 8
  store i32* %0, i32** %2, align 8
  %3 = load i32*, i32** %2, align 8
  ret i32* %3
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define linkonce_odr dso_local i32* @_ZNK9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEmiEl(%"class.__gnu_cxx::__normal_iterator"*, i64) #5 comdat align 2 {
  %3 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %4 = alloca %"class.__gnu_cxx::__normal_iterator"*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i32*, align 8
  store %"class.__gnu_cxx::__normal_iterator"* %0, %"class.__gnu_cxx::__normal_iterator"** %4, align 8
  store i64 %1, i64* %5, align 8
  %7 = load %"class.__gnu_cxx::__normal_iterator"*, %"class.__gnu_cxx::__normal_iterator"** %4, align 8
  %8 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %7, i32 0, i32 0
  %9 = load i32*, i32** %8, align 8
  %10 = load i64, i64* %5, align 8
  %11 = sub i64 0, %10
  %12 = getelementptr inbounds i32, i32* %9, i64 %11
  store i32* %12, i32** %6, align 8
  call void @_ZN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEC2ERKS1_(%"class.__gnu_cxx::__normal_iterator"* %3, i32** dereferenceable(8) %6) #3
  %13 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %3, i32 0, i32 0
  %14 = load i32*, i32** %13, align 8
  ret i32* %14
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define linkonce_odr dso_local dereferenceable(4) i32* @_ZNK9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEdeEv(%"class.__gnu_cxx::__normal_iterator"*) #5 comdat align 2 {
  %2 = alloca %"class.__gnu_cxx::__normal_iterator"*, align 8
  store %"class.__gnu_cxx::__normal_iterator"* %0, %"class.__gnu_cxx::__normal_iterator"** %2, align 8
  %3 = load %"class.__gnu_cxx::__normal_iterator"*, %"class.__gnu_cxx::__normal_iterator"** %2, align 8
  %4 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %3, i32 0, i32 0
  %5 = load i32*, i32** %4, align 8
  ret i32* %5
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define linkonce_odr dso_local void @_ZNSt12_Vector_baseIiSaIiEED2Ev(%"struct.std::_Vector_base"*) unnamed_addr #5 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = alloca %"struct.std::_Vector_base"*, align 8
  %3 = alloca i8*
  %4 = alloca i32
  store %"struct.std::_Vector_base"* %0, %"struct.std::_Vector_base"** %2, align 8
  %5 = load %"struct.std::_Vector_base"*, %"struct.std::_Vector_base"** %2, align 8
  %6 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %5, i32 0, i32 0
  %7 = bitcast %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"* %6 to %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"*
  %8 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data", %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"* %7, i32 0, i32 0
  %9 = load i32*, i32** %8, align 8
  %10 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %5, i32 0, i32 0
  %11 = bitcast %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"* %10 to %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"*
  %12 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data", %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"* %11, i32 0, i32 2
  %13 = load i32*, i32** %12, align 8
  %14 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %5, i32 0, i32 0
  %15 = bitcast %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"* %14 to %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"*
  %16 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data", %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl_data"* %15, i32 0, i32 0
  %17 = load i32*, i32** %16, align 8
  %18 = ptrtoint i32* %13 to i64
  %19 = ptrtoint i32* %17 to i64
  %20 = sub i64 %18, %19
  %21 = sdiv exact i64 %20, 4
  invoke void @_ZNSt12_Vector_baseIiSaIiEE13_M_deallocateEPim(%"struct.std::_Vector_base"* %5, i32* %9, i64 %21)
          to label %22 unwind label %24

; <label>:22:                                     ; preds = %1
  %23 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %5, i32 0, i32 0
  call void @_ZNSt12_Vector_baseIiSaIiEE12_Vector_implD2Ev(%"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"* %23) #3
  ret void

; <label>:24:                                     ; preds = %1
  %25 = landingpad { i8*, i32 }
          catch i8* null
  %26 = extractvalue { i8*, i32 } %25, 0
  store i8* %26, i8** %3, align 8
  %27 = extractvalue { i8*, i32 } %25, 1
  store i32 %27, i32* %4, align 4
  %28 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %5, i32 0, i32 0
  call void @_ZNSt12_Vector_baseIiSaIiEE12_Vector_implD2Ev(%"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"* %28) #3
  br label %29

; <label>:29:                                     ; preds = %24
  %30 = load i8*, i8** %3, align 8
  call void @__clang_call_terminate(i8* %30) #12
  unreachable
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define linkonce_odr dso_local void @_ZNSt12_Vector_baseIiSaIiEE12_Vector_implD2Ev(%"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"*) unnamed_addr #5 comdat align 2 {
  %2 = alloca %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"*, align 8
  store %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"* %0, %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"** %2, align 8
  %3 = load %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"*, %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"** %2, align 8
  %4 = bitcast %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl"* %3 to %"class.std::allocator"*
  call void @_ZNSaIiED2Ev(%"class.std::allocator"* %4) #3
  ret void
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define linkonce_odr dso_local void @_ZNSaIiED2Ev(%"class.std::allocator"*) unnamed_addr #5 comdat align 2 {
  %2 = alloca %"class.std::allocator"*, align 8
  store %"class.std::allocator"* %0, %"class.std::allocator"** %2, align 8
  %3 = load %"class.std::allocator"*, %"class.std::allocator"** %2, align 8
  %4 = bitcast %"class.std::allocator"* %3 to %"class.__gnu_cxx::new_allocator"*
  call void @_ZN9__gnu_cxx13new_allocatorIiED2Ev(%"class.__gnu_cxx::new_allocator"* %4) #3
  ret void
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define linkonce_odr dso_local void @_ZN9__gnu_cxx13new_allocatorIiED2Ev(%"class.__gnu_cxx::new_allocator"*) unnamed_addr #5 comdat align 2 {
  %2 = alloca %"class.__gnu_cxx::new_allocator"*, align 8
  store %"class.__gnu_cxx::new_allocator"* %0, %"class.__gnu_cxx::new_allocator"** %2, align 8
  %3 = load %"class.__gnu_cxx::new_allocator"*, %"class.__gnu_cxx::new_allocator"** %2, align 8
  ret void
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
attributes #4 = { noinline optnone sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noinline nounwind optnone sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noinline norecurse optnone sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { noinline noreturn nounwind }
attributes #8 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { nobuiltin "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { argmemonly nounwind }
attributes #11 = { nobuiltin nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #12 = { noreturn nounwind }
attributes #13 = { noreturn }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{!"clang version 8.0.0 (tags/RELEASE_800/final)"}
