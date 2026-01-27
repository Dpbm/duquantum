#pragma once

#include <cstdint>

#include <library_types.h> // cuda types stuff

enum class Status {
    SUCCESS                   = 0, 
    NOT_INITIALIZED           = 1, 
    ALLOC_FAILED              = 2, 
    INVALID_VALUE             = 3, 
    ARCH_MISMATCH             = 4, 
    EXECUTION_FAILED          = 5, 
    INTERNAL_ERROR            = 6, 
    NOT_SUPPORTED             = 7, 
    INSUFFICIENT_WORKSPACE    = 8, 
    SAMPLER_NOT_PREPROCESSED  = 9, 
    NO_DEVICE_ALLOCATOR       = 10,
    DEVICE_ALLOCATOR_ERROR    = 11,
    COMMUNICATOR_ERROR        = 12,
    LOADING_LIBRARY_FAILED    = 13,
    INVALID_CONFIGURATION     = 14,
    ALREADY_INITIALIZED       = 15,
    INVALID_WIRE              = 16,
    SYSTEM_ERROR              = 17,
    CUDA_ERROR                = 18,
    NUMERICAL_ERROR           = 19,
    MAX_VALUE                 = 20
};
using Status_t = Status;
using Handle_t = void*; // its opaque from the custatevec headers

extern "C" {
	Status_t custatevecAbs2SumArray(
			Handle_t handle,
			const void* sv,
			cudaDataType_t svDataType,
			const uint32_t nIndexBits,
			double* abs2sum,
			const int32_t* bitOrdering,
			const uint32_t bitOrderingLen,
			const int32_t* maskBitString,
			const int32_t* maskOrdering,
			const uint32_t maskLen
			);
	void custatevecAbs2SumArrayBatched(){}
	void custatevecAbs2SumOnZBasis(){}
	void custatevecAccessorCreate(){}
	void custatevecAccessorCreateView(){}
	void custatevecAccessorDestroy(){}
	void custatevecAccessorGet(){}
	void custatevecAccessorSet(){}
	void custatevecAccessorSetExtraWorkspace(){}
	void custatevecApplyGeneralizedPermutationMatrix(){}
	void custatevecApplyGeneralizedPermutationMatrixGetWorkspaceSize(){}
	void custatevecApplyMatrix(){}
	void custatevecApplyMatrixBatched(){}
	void custatevecApplyMatrixBatchedGetWorkspaceSize(){}
	void custatevecApplyMatrixGetWorkspaceSize(){}
	void custatevecApplyPauliRotation(){}
	void custatevecBatchMeasure(){}
	void custatevecBatchMeasureWithOffset(){}
	void custatevecCollapseByBitString(){}
	void custatevecCollapseByBitStringBatched(){}
	void custatevecCollapseByBitStringBatchedGetWorkspaceSize(){}
	void custatevecCollapseOnZBasis(){}
	void custatevecCommunicatorCreate(){}
	void custatevecCommunicatorDestroy(){}
	void custatevecComputeExpectation(){}
	void custatevecComputeExpectationBatched(){}
	void custatevecComputeExpectationBatchedGetWorkspaceSize(){}
	void custatevecComputeExpectationGetWorkspaceSize(){}
	void custatevecComputeExpectationsOnPauliBasis(){}
	void custatevecCreate(){}
	void custatevecDestroy(){}
	void custatevecDistIndexBitSwapSchedulerCreate(){}
	void custatevecDistIndexBitSwapSchedulerDestroy(){}
	void custatevecDistIndexBitSwapSchedulerGetParameters(){}
	void custatevecDistIndexBitSwapSchedulerSetIndexBitSwaps(){}
	void custatevecEx_(){}
	void custatevecExAbs2SumArray(){}
	void custatevecExApplyMatrix(){}
	void custatevecExApplyPauliRotation(){}
	void custatevecExCommunicatorCreate(){}
	void custatevecExCommunicatorDestroy(){}
	void custatevecExCommunicatorFinalize(){}
	void custatevecExCommunicatorGetSizeAndRank(){}
	void custatevecExCommunicatorInitialize(){}
	void custatevecExComputeExpectationOnPauliBasis(){}
	void custatevecExConfigureStateVectorMultiDevice(){}
	void custatevecExConfigureStateVectorMultiProcess(){}
	void custatevecExConfigureStateVectorSingleDevice(){}
	void custatevecExConfigureSVUpdater(){}
	void custatevecExDictionaryDestroy(){}
	void custatevecExMeasure(){}
	void custatevecExSample(){}
	void custatevecExStateVectorCreateMultiProcess(){}
	void custatevecExStateVectorCreateSingleProcess(){}
	void custatevecExStateVectorDestroy(){}
	void custatevecExStateVectorGetProperty(){}
	void custatevecExStateVectorGetResourcesFromDeviceSubSV(){}
	void custatevecExStateVectorGetResourcesFromDeviceSubSVView(){}
	void custatevecExStateVectorGetState(){}
	void custatevecExStateVectorPermuteIndexBits(){}
	void custatevecExStateVectorReassignWireOrdering(){}
	void custatevecExStateVectorSetMathMode(){}
	void custatevecExStateVectorSetState(){}
	void custatevecExStateVectorSetZeroState(){}
	void custatevecExStateVectorSynchronize(){}
	void custatevecExSVUpdaterApply(){}
	void custatevecExSVUpdaterClear(){}
	void custatevecExSVUpdaterCreate(){}
	void custatevecExSVUpdaterDestroy(){}
	void custatevecExSVUpdaterEnqueueGeneralChannel(){}
	void custatevecExSVUpdaterEnqueueMatrix(){}
	void custatevecExSVUpdaterEnqueueUnitaryChannel(){}
	void custatevecExSVUpdaterGetMaxNumRequiredRandnums(){}
	void custatevecGetDefaultWorkspaceSize(){}
	void custatevecGetDeviceMemHandler(){}
	void custatevecGetErrorName(){}
	void custatevecGetErrorString(){}
	void custatevecGetMathMode(){}
	void custatevecGetProperty(){}
	void custatevecGetStream(){}
	void custatevecGetVersion(){}
	void custatevecInitializeStateVector(){}
	void custatevecLoggerForceDisable(){}
	void custatevecLoggerOpenFile(){}
	void custatevecLoggerSetCallback(){}
	void custatevecLoggerSetCallbackData(){}
	void custatevecLoggerSetFile(){}
	void custatevecLoggerSetLevel(){}
	void custatevecLoggerSetMask(){}
	void custatevecMeasureBatched(){}
	void custatevecMeasureOnZBasis(){}
	void custatevecMultiDeviceSwapIndexBits(){}
	void custatevecSamplerApplySubSVOffset(){}
	void custatevecSamplerCreate(){}
	void custatevecSamplerDestroy(){}
	void custatevecSamplerGetSquaredNorm(){}
	void custatevecSamplerPreprocess(){}
	void custatevecSamplerSample(){}
	void custatevecSetDeviceMemHandler(){}
	void custatevecSetMathMode(){}
	void custatevecSetStream(){}
	void custatevecSetWorkspace(){}
	void custatevecSubSVMigratorCreate(){}
	void custatevecSubSVMigratorDestroy(){}
	void custatevecSubSVMigratorMigrate(){}
	void custatevecSVSwapWorkerCreate(){}
	void custatevecSVSwapWorkerCreateWithSemaphore(){}
	void custatevecSVSwapWorkerDestroy(){}
	void custatevecSVSwapWorkerExecute(){}
	void custatevecSVSwapWorkerSetExtraWorkspace(){}
	void custatevecSVSwapWorkerSetParameters(){}
	void custatevecSVSwapWorkerSetSubSVsP2P(){}
	void custatevecSVSwapWorkerSetSubSVsP2PWithSemaphores(){}
	void custatevecSVSwapWorkerSetTransferWorkspace(){}
	void custatevecSwapIndexBits(){}
	void custatevecTestMatrixType(){}
	void custatevecTestMatrixTypeGetWorkspaceSize(){}
}
