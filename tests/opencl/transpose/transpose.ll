; ModuleID = 'parallel.bc'
source_filename = "parallel_bc"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32"

declare i32 @vx_num_warps(...) local_unnamed_addr

declare void @vx_barrier(i32, i32, ...) local_unnamed_addr

; Function Attrs: alwaysinline norecurse nounwind
define void @_pocl_kernel_transpose(ptr nocapture noundef writeonly align 4 %0, ptr nocapture noundef readonly align 4 %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, ptr nocapture noundef align 4 %5, ptr nocapture readonly %6, i32 %7, i32 %8, i32 %9) local_unnamed_addr #0 !kernel_arg_addr_space !28 !kernel_arg_access_qual !29 !kernel_arg_type !30 !kernel_arg_base_type !30 !kernel_arg_type_qual !31 !kernel_arg_name !32 !pocl_generated !33 {
  %11 = getelementptr inbounds { [3 x i32], [3 x i32], [3 x i32], ptr, ptr, i32, ptr, i32 }, ptr %6, i32 0, i32 2
  %12 = load i32, ptr %11, align 4
  %13 = getelementptr { [3 x i32], [3 x i32], [3 x i32], ptr, ptr, i32, ptr, i32 }, ptr %6, i32 0, i32 2, i32 1
  %14 = load i32, ptr %13, align 4
  %15 = getelementptr inbounds { [3 x i32], [3 x i32], [3 x i32], ptr, ptr, i32, ptr, i32 }, ptr %6, i32 0, i32 1
  %16 = load i32, ptr %15, align 4
  %17 = getelementptr { [3 x i32], [3 x i32], [3 x i32], ptr, ptr, i32, ptr, i32 }, ptr %6, i32 0, i32 1, i32 1
  %18 = load i32, ptr %17, align 4
  %mul.i.i = mul i32 %12, %7
  %mul3.i.i = mul i32 %14, %8
  %add6.i.i = add i32 %18, %mul3.i.i
  %add1.i.i = add i32 %mul.i.i, %2
  %add.i = add i32 %add1.i.i, %16
  %cmp.i = icmp ult i32 %add.i, %3
  %cmp2.i = icmp ult i32 %add6.i.i, %4
  %or.cond.i = select i1 %cmp.i, i1 %cmp2.i, i1 false
  br i1 %or.cond.i, label %if.then.i, label %if.end.r_exit.i

if.then.i:                                        ; preds = %10
  %mul.i = mul i32 %add6.i.i, %3
  %add4.i = add i32 %mul.i, %add.i
  %arrayidx.i = getelementptr inbounds float, ptr %1, i32 %add4.i
  %19 = load float, ptr %arrayidx.i, align 4, !tbaa !34
  store float %19, ptr %5, align 4, !tbaa !34
  br label %if.end.r_exit.i

if.end.r_exit.i:                                  ; preds = %if.then.i, %10
  %20 = tail call i32 (...) @vx_num_warps() #1
  tail call void (i32, i32, ...) @vx_barrier(i32 1, i32 %20) #1
  %mul11.i = shl i32 %8, 4
  %mul15.i = shl i32 %7, 4
  %cmp18.i = icmp ult i32 %mul11.i, %4
  %add20.i = add i32 %mul15.i, %2
  %cmp21.i = icmp ult i32 %add20.i, %3
  %or.cond45.i = select i1 %cmp18.i, i1 %cmp21.i, i1 false
  br i1 %or.cond45.i, label %if.then22.i, label %transpose.exit

if.then22.i:                                      ; preds = %if.end.r_exit.i
  %mul23.i = mul i32 %mul15.i, %4
  %add24.i = add i32 %mul23.i, %mul11.i
  %arrayidx30.i = getelementptr inbounds float, ptr %0, i32 %add24.i
  %21 = load float, ptr %5, align 4, !tbaa !34
  store float %21, ptr %arrayidx30.i, align 4, !tbaa !34
  br label %transpose.exit

transpose.exit:                                   ; preds = %if.then22.i, %if.end.r_exit.i
  ret void
}

; Function Attrs: nounwind
define void @_pocl_kernel_transpose_workgroup(ptr nocapture readonly %0, ptr nocapture readonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #1 {
  %6 = load ptr, ptr %0, align 4
  %7 = load ptr, ptr %6, align 4
  %8 = getelementptr ptr, ptr %0, i32 2
  %9 = load ptr, ptr %8, align 4
  %10 = load i32, ptr %9, align 4
  %11 = getelementptr ptr, ptr %0, i32 3
  %12 = load ptr, ptr %11, align 4
  %13 = load i32, ptr %12, align 4
  %14 = getelementptr ptr, ptr %0, i32 4
  %15 = load ptr, ptr %14, align 4
  %16 = load i32, ptr %15, align 4
  %17 = getelementptr ptr, ptr %0, i32 5
  %18 = load ptr, ptr %17, align 4
  %19 = load ptr, ptr %18, align 4
  %20 = getelementptr inbounds { [3 x i32], [3 x i32], [3 x i32], ptr, ptr, i32, ptr, i32 }, ptr %1, i32 0, i32 2
  %21 = load i32, ptr %20, align 4
  %22 = getelementptr { [3 x i32], [3 x i32], [3 x i32], ptr, ptr, i32, ptr, i32 }, ptr %1, i32 0, i32 2, i32 1
  %23 = load i32, ptr %22, align 4
  %24 = getelementptr inbounds { [3 x i32], [3 x i32], [3 x i32], ptr, ptr, i32, ptr, i32 }, ptr %1, i32 0, i32 1
  %25 = load i32, ptr %24, align 4
  %26 = getelementptr { [3 x i32], [3 x i32], [3 x i32], ptr, ptr, i32, ptr, i32 }, ptr %1, i32 0, i32 1, i32 1
  %27 = load i32, ptr %26, align 4
  %mul.i.i.i = mul i32 %21, %2
  %mul3.i.i.i = mul i32 %23, %3
  %add6.i.i.i = add i32 %27, %mul3.i.i.i
  %add1.i.i.i = add i32 %mul.i.i.i, %10
  %add.i.i = add i32 %add1.i.i.i, %25
  %cmp.i.i = icmp ult i32 %add.i.i, %13
  %cmp2.i.i = icmp ult i32 %add6.i.i.i, %16
  %or.cond.i.i = select i1 %cmp.i.i, i1 %cmp2.i.i, i1 false
  br i1 %or.cond.i.i, label %if.then.i.i, label %if.end.r_exit.i.i

if.then.i.i:                                      ; preds = %5
  %28 = getelementptr ptr, ptr %0, i32 1
  %29 = load ptr, ptr %28, align 4
  %30 = load ptr, ptr %29, align 4
  %mul.i.i = mul i32 %add6.i.i.i, %13
  %add4.i.i = add i32 %mul.i.i, %add.i.i
  %arrayidx.i.i = getelementptr inbounds float, ptr %30, i32 %add4.i.i
  %31 = load float, ptr %arrayidx.i.i, align 4, !tbaa !34
  store float %31, ptr %19, align 4, !tbaa !34
  br label %if.end.r_exit.i.i

if.end.r_exit.i.i:                                ; preds = %if.then.i.i, %5
  %32 = tail call i32 (...) @vx_num_warps() #1
  tail call void (i32, i32, ...) @vx_barrier(i32 1, i32 %32) #1
  %mul11.i.i = shl i32 %3, 4
  %mul15.i.i = shl i32 %2, 4
  %cmp18.i.i = icmp ult i32 %mul11.i.i, %16
  %add20.i.i = add i32 %10, %mul15.i.i
  %cmp21.i.i = icmp ult i32 %add20.i.i, %13
  %or.cond45.i.i = select i1 %cmp18.i.i, i1 %cmp21.i.i, i1 false
  br i1 %or.cond45.i.i, label %if.then22.i.i, label %_pocl_kernel_transpose.exit

if.then22.i.i:                                    ; preds = %if.end.r_exit.i.i
  %mul23.i.i = mul i32 %16, %mul15.i.i
  %add24.i.i = add i32 %mul23.i.i, %mul11.i.i
  %arrayidx30.i.i = getelementptr inbounds float, ptr %7, i32 %add24.i.i
  %33 = load float, ptr %19, align 4, !tbaa !34
  store float %33, ptr %arrayidx30.i.i, align 4, !tbaa !34
  br label %_pocl_kernel_transpose.exit

_pocl_kernel_transpose.exit:                      ; preds = %if.then22.i.i, %if.end.r_exit.i.i
  ret void
}

attributes #0 = { alwaysinline norecurse nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "stackrealign" "target-features"="+32bit,+f,+m,+vortex" "uniform-work-group-size"="false" }
attributes #1 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!opencl.ocl.version = !{!4}
!llvm.ident = !{!5}
!pocl_meta = !{!6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"ilp32f"}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 1, !"SmallDataLimit", i32 0}
!4 = !{i32 3, i32 0}
!5 = !{!"clang version 16.0.6 (https://github.com/vortexgpgpu/llvm 58811bfa61a503fd4a5f0dc7b57802fae51c3f5d)"}
!6 = !{!"device_address_bits", i64 32}
!7 = !{!"device_arg_buffer_launcher", i8 0}
!8 = !{!"device_grid_launcher", i8 0}
!9 = !{!"device_is_spmd", i8 0}
!10 = !{!"KernelName", !"transpose"}
!11 = !{!"WGMaxGridDimWidth", i64 0}
!12 = !{!"WGLocalSizeX", i64 0}
!13 = !{!"WGLocalSizeY", i64 0}
!14 = !{!"WGLocalSizeZ", i64 0}
!15 = !{!"WGDynamicLocalSize", i8 1}
!16 = !{!"WGAssumeZeroGlobalOffset", i8 0}
!17 = !{!"device_global_as_id", i64 0}
!18 = !{!"device_local_as_id", i64 0}
!19 = !{!"device_constant_as_id", i64 0}
!20 = !{!"device_args_as_id", i64 0}
!21 = !{!"device_context_as_id", i64 0}
!22 = !{!"device_side_printf", i8 1}
!23 = !{!"device_alloca_locals", i8 0}
!24 = !{!"device_max_witem_dim", i64 3}
!25 = !{!"device_max_witem_sizes_0", i64 4096}
!26 = !{!"device_max_witem_sizes_1", i64 4096}
!27 = !{!"device_max_witem_sizes_2", i64 4096}
!28 = !{i32 1, i32 1, i32 0, i32 0, i32 0, i32 3}
!29 = !{!"none", !"none", !"none", !"none", !"none", !"none"}
!30 = !{!"float*", !"float*", !"int", !"int", !"int", !"float*"}
!31 = !{!"", !"", !"", !"", !"", !""}
!32 = !{!"odata", !"idata", !"offset", !"width", !"height", !"block"}
!33 = !{i32 1}
!34 = !{!35, !35, i64 0}
!35 = !{!"float", !36, i64 0}
!36 = !{!"omnipotent char", !37, i64 0}
!37 = !{!"Simple C/C++ TBAA"}
