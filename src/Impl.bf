using System;
using System.Interop;

namespace Wgpu {
	extension Wgpu {
		[CRepr]
		public struct WGPUAdapter : this(void* Handle) {
			public static Self Null => .(null);

			public void GetFeatures(WGPUSupportedFeatures* features) => Wgpu.wgpuAdapterGetFeatures(this, features);
			public void GetInfo(WGPUAdapterInfo* info) => Wgpu.wgpuAdapterGetInfo(this, info);
			public WGPUStatus GetLimits(WGPULimits* limits) => Wgpu.wgpuAdapterGetLimits(this, limits);
			public WGPUBool HasFeature(WGPUFeatureName feature) => Wgpu.wgpuAdapterHasFeature(this, feature);
			public void RequestDevice(WGPUDeviceDescriptor* descriptor, WGPURequestDeviceCallbackInfo callbackInfo) => Wgpu.wgpuAdapterRequestDevice(this, descriptor, callbackInfo);
			public void AddRef() => Wgpu.wgpuAdapterAddRef(this);
			public void Release() => Wgpu.wgpuAdapterRelease(this);
		}

		[CRepr]
		public struct WGPUBindGroup : this(void* Handle) {
			public static Self Null => .(null);

			public void SetLabel(WGPUStringView label) => Wgpu.wgpuBindGroupSetLabel(this, label);
			public void AddRef() => Wgpu.wgpuBindGroupAddRef(this);
			public void Release() => Wgpu.wgpuBindGroupRelease(this);
		}

		[CRepr]
		public struct WGPUBindGroupLayout : this(void* Handle) {
			public static Self Null => .(null);

			public void Release() => Wgpu.wgpuBindGroupLayoutRelease(this);
		}

		[CRepr]
		public struct WGPUBuffer : this(void* Handle) {
			public static Self Null => .(null);

			public void Destroy() => Wgpu.wgpuBufferDestroy(this);
			public void* GetConstMappedRange(c_size offset, c_size size) => Wgpu.wgpuBufferGetConstMappedRange(this, offset, size);
			public WGPUBufferMapState GetMapState() => Wgpu.wgpuBufferGetMapState(this);
			public void* GetMappedRange(c_size offset, c_size size) => Wgpu.wgpuBufferGetMappedRange(this, offset, size);
			public uint64 GetSize() => Wgpu.wgpuBufferGetSize(this);
			public WGPUBufferUsage GetUsage() => Wgpu.wgpuBufferGetUsage(this);
			public WGPUFuture MapAsync(WGPUMapMode mode, c_size offset, c_size size, WGPUBufferMapCallbackInfo callbackInfo) => Wgpu.wgpuBufferMapAsync(this, mode, offset, size, callbackInfo);
			public void SetLabel(WGPUStringView label) => Wgpu.wgpuBufferSetLabel(this, label);
			public void Unmap() => Wgpu.wgpuBufferUnmap(this);
			public void AddRef() => Wgpu.wgpuBufferAddRef(this);
			public void Release() => Wgpu.wgpuBufferRelease(this);
		}

		[CRepr]
		public struct WGPUCommandBuffer : this(void* Handle) {
			public static Self Null => .(null);

			public void SetLabel(WGPUStringView label) => Wgpu.wgpuCommandBufferSetLabel(this, label);
			public void AddRef() => Wgpu.wgpuCommandBufferAddRef(this);
			public void Release() => Wgpu.wgpuCommandBufferRelease(this);
		}

		[CRepr]
		public struct WGPUCommandEncoder : this(void* Handle) {
			public static Self Null => .(null);

			public WGPUComputePassEncoder BeginComputePass(WGPUComputePassDescriptor* descriptor) => Wgpu.wgpuCommandEncoderBeginComputePass(this, descriptor);
			public WGPURenderPassEncoder BeginRenderPass(WGPURenderPassDescriptor* descriptor) => Wgpu.wgpuCommandEncoderBeginRenderPass(this, descriptor);
			public void ClearBuffer(WGPUBuffer buffer, uint64 offset, uint64 size) => Wgpu.wgpuCommandEncoderClearBuffer(this, buffer, offset, size);
			public void CopyBufferToBuffer(WGPUBuffer source, uint64 sourceOffset, WGPUBuffer destination, uint64 destinationOffset, uint64 size) => Wgpu.wgpuCommandEncoderCopyBufferToBuffer(this, source, sourceOffset, destination, destinationOffset, size);
			public void CopyBufferToTexture(WGPUTexelCopyBufferInfo* source, WGPUTexelCopyTextureInfo* destination, WGPUExtent3D* copySize) => Wgpu.wgpuCommandEncoderCopyBufferToTexture(this, source, destination, copySize);
			public void CopyTextureToBuffer(WGPUTexelCopyTextureInfo* source, WGPUTexelCopyBufferInfo* destination, WGPUExtent3D* copySize) => Wgpu.wgpuCommandEncoderCopyTextureToBuffer(this, source, destination, copySize);
			public void CopyTextureToTexture(WGPUTexelCopyTextureInfo* source, WGPUTexelCopyTextureInfo* destination, WGPUExtent3D* copySize) => Wgpu.wgpuCommandEncoderCopyTextureToTexture(this, source, destination, copySize);
			public WGPUCommandBuffer Finish(WGPUCommandBufferDescriptor* descriptor) => Wgpu.wgpuCommandEncoderFinish(this, descriptor);
			public void InsertDebugMarker(WGPUStringView markerLabel) => Wgpu.wgpuCommandEncoderInsertDebugMarker(this, markerLabel);
			public void PopDebugGroup() => Wgpu.wgpuCommandEncoderPopDebugGroup(this);
			public void PushDebugGroup(WGPUStringView groupLabel) => Wgpu.wgpuCommandEncoderPushDebugGroup(this, groupLabel);
			public void ResolveQuerySet(WGPUQuerySet querySet, uint32 firstQuery, uint32 queryCount, WGPUBuffer destination, uint64 destinationOffset) => Wgpu.wgpuCommandEncoderResolveQuerySet(this, querySet, firstQuery, queryCount, destination, destinationOffset);
			public void SetLabel(WGPUStringView label) => Wgpu.wgpuCommandEncoderSetLabel(this, label);
			public void WriteTimestamp(WGPUQuerySet querySet, uint32 queryIndex) => Wgpu.wgpuCommandEncoderWriteTimestamp(this, querySet, queryIndex);
			public void AddRef() => Wgpu.wgpuCommandEncoderAddRef(this);
			public void Release() => Wgpu.wgpuCommandEncoderRelease(this);
		}

		[CRepr]
		public struct WGPUComputePassEncoder : this(void* Handle) {
			public static Self Null => .(null);

			public void SetPushConstants(uint32 offset, uint32 sizeBytes, void* data) => Wgpu.wgpuComputePassEncoderSetPushConstants(this, offset, sizeBytes, data);
			public void BeginPipelineStatisticsQuery(WGPUQuerySet querySet, uint32 queryIndex) => Wgpu.wgpuComputePassEncoderBeginPipelineStatisticsQuery(this, querySet, queryIndex);
			public void EndPipelineStatisticsQuery() => Wgpu.wgpuComputePassEncoderEndPipelineStatisticsQuery(this);
			public void WriteTimestamp(WGPUQuerySet querySet, uint32 queryIndex) => Wgpu.wgpuComputePassEncoderWriteTimestamp(this, querySet, queryIndex);

			public void DispatchWorkgroups(uint32 workgroupCountX, uint32 workgroupCountY, uint32 workgroupCountZ) => Wgpu.wgpuComputePassEncoderDispatchWorkgroups(this, workgroupCountX, workgroupCountY, workgroupCountZ);
			public void DispatchWorkgroupsIndirect(WGPUBuffer indirectBuffer, uint64 indirectOffset) => Wgpu.wgpuComputePassEncoderDispatchWorkgroupsIndirect(this, indirectBuffer, indirectOffset);
			public void End() => Wgpu.wgpuComputePassEncoderEnd(this);
			public void InsertDebugMarker(WGPUStringView markerLabel) => Wgpu.wgpuComputePassEncoderInsertDebugMarker(this, markerLabel);
			public void PopDebugGroup() => Wgpu.wgpuComputePassEncoderPopDebugGroup(this);
			public void PushDebugGroup(WGPUStringView groupLabel) => Wgpu.wgpuComputePassEncoderPushDebugGroup(this, groupLabel);
			public void SetBindGroup(uint32 groupIndex, WGPUBindGroup group, uint32 dynamicOffsetCount, uint32* dynamicOffsets) => Wgpu.wgpuComputePassEncoderSetBindGroup(this, groupIndex, group, dynamicOffsetCount, dynamicOffsets);
			public void SetLabel(WGPUStringView label) => Wgpu.wgpuComputePassEncoderSetLabel(this, label);
			public void SetPipeline(WGPUComputePipeline pipeline) => Wgpu.wgpuComputePassEncoderSetPipeline(this, pipeline);
			public void AddRef() => Wgpu.wgpuComputePassEncoderAddRef(this);
			public void Release() => Wgpu.wgpuComputePassEncoderRelease(this);
		}

		[CRepr]
		public struct WGPUComputePipeline : this(void* Handle) {
			public static Self Null => .(null);

			public WGPUBindGroupLayout GetBindGroupLayout(uint32 groupIndex) => Wgpu.wgpuComputePipelineGetBindGroupLayout(this, groupIndex);
			public void SetLabel(WGPUStringView label) => Wgpu.wgpuComputePipelineSetLabel(this, label);
			public void AddRef() => Wgpu.wgpuComputePipelineAddRef(this);
			public void Release() => Wgpu.wgpuComputePipelineRelease(this);
		}

		[CRepr]
		public struct WGPUDevice : this(void* Handle) {
			public static Self Null => .(null);

			public void Poll(WGPUBool wait, uint64* wrappedSubmissionIndex) => Wgpu.wgpuDevicePoll(this, wait, wrappedSubmissionIndex);
			public WGPUShaderModule CreateShaderModuleSpirV(WGPUShaderModuleDescriptorSpirV* descriptor) => Wgpu.wgpuDeviceCreateShaderModuleSpirV(this, descriptor);

			public WGPUBindGroup CreateBindGroup(WGPUBindGroupDescriptor* descriptor) => Wgpu.wgpuDeviceCreateBindGroup(this, descriptor);
			public WGPUBindGroupLayout CreateBindGroupLayout(WGPUBindGroupLayoutDescriptor* descriptor) => Wgpu.wgpuDeviceCreateBindGroupLayout(this, descriptor);
			public WGPUBuffer CreateBuffer(WGPUBufferDescriptor* descriptor) => Wgpu.wgpuDeviceCreateBuffer(this, descriptor);
			public WGPUCommandEncoder CreateCommandEncoder(WGPUCommandEncoderDescriptor* descriptor) => Wgpu.wgpuDeviceCreateCommandEncoder(this, descriptor);
			public WGPUComputePipeline CreateComputePipeline(WGPUComputePipelineDescriptor* descriptor) => Wgpu.wgpuDeviceCreateComputePipeline(this, descriptor);
			public WGPUFuture CreateComputePipelineAsync(WGPUComputePipelineDescriptor* descriptor, WGPUCreateComputePipelineAsyncCallbackInfo callbackInfo) => Wgpu.wgpuDeviceCreateComputePipelineAsync(this, descriptor, callbackInfo);
			public WGPUPipelineLayout CreatePipelineLayout(WGPUPipelineLayoutDescriptor* descriptor) => Wgpu.wgpuDeviceCreatePipelineLayout(this, descriptor);
			public WGPUQuerySet CreateQuerySet(WGPUQuerySetDescriptor* descriptor) => Wgpu.wgpuDeviceCreateQuerySet(this, descriptor);
			public WGPURenderBundleEncoder CreateRenderBundleEncoder(WGPURenderBundleEncoderDescriptor* descriptor) => Wgpu.wgpuDeviceCreateRenderBundleEncoder(this, descriptor);
			public WGPURenderPipeline CreateRenderPipeline(WGPURenderPipelineDescriptor* descriptor) => Wgpu.wgpuDeviceCreateRenderPipeline(this, descriptor);
			public WGPUFuture CreateRenderPipelineAsync(WGPURenderPipelineDescriptor* descriptor, WGPUCreateRenderPipelineAsyncCallbackInfo callbackInfo) => Wgpu.wgpuDeviceCreateRenderPipelineAsync(this, descriptor, callbackInfo);
			public WGPUSampler CreateSampler(WGPUSamplerDescriptor* descriptor) => Wgpu.wgpuDeviceCreateSampler(this, descriptor);
			public WGPUShaderModule CreateShaderModule(WGPUShaderModuleDescriptor* descriptor) => Wgpu.wgpuDeviceCreateShaderModule(this, descriptor);
			public WGPUTexture CreateTexture(WGPUTextureDescriptor* descriptor) => Wgpu.wgpuDeviceCreateTexture(this, descriptor);
			public void Destroy() => Wgpu.wgpuDeviceDestroy(this);
			public WGPUAdapterInfo GetAdapterInfo() => Wgpu.wgpuDeviceGetAdapterInfo(this);
			public void GetFeatures(WGPUSupportedFeatures* features) => Wgpu.wgpuDeviceGetFeatures(this, features);
			public WGPUStatus GetLimits(WGPULimits* limits) => Wgpu.wgpuDeviceGetLimits(this, limits);
			public WGPUFuture GetLostFuture() => Wgpu.wgpuDeviceGetLostFuture(this);
			public WGPUQueue GetQueue() => Wgpu.wgpuDeviceGetQueue(this);
			public WGPUBool HasFeature(WGPUFeatureName feature) => Wgpu.wgpuDeviceHasFeature(this, feature);
			public WGPUFuture PopErrorScope(WGPUPopErrorScopeCallbackInfo callbackInfo, void* userdata) => Wgpu.wgpuDevicePopErrorScope(this, callbackInfo);
			public void PushErrorScope(WGPUErrorFilter filter) => Wgpu.wgpuDevicePushErrorScope(this, filter);
			public void SetLabel(WGPUStringView label) => Wgpu.wgpuDeviceSetLabel(this, label);
			public void AddRef() => Wgpu.wgpuDeviceAddRef(this);
			public void Release() => Wgpu.wgpuDeviceRelease(this);
		}

		[CRepr]
		public struct WGPUInstance : this(void* Handle) {
			public static Self Null => .(null);

			public void GenerateReport(WGPUGlobalReport* report) => Wgpu.wgpuGenerateReport(this, report);
			public c_size EnumerateAdapters(WGPUInstanceEnumerateAdapterOptions* options, WGPUAdapter* adapters) => Wgpu.wgpuInstanceEnumerateAdapters(this, options, adapters);

			public WGPUSurface CreateSurface(WGPUSurfaceDescriptor* descriptor) => Wgpu.wgpuInstanceCreateSurface(this, descriptor);
			public WGPUStatus GetWGSLLanguageFeatures(WGPUSupportedWGSLLanguageFeatures* features) => Wgpu.wgpuInstanceGetWGSLLanguageFeatures(this, features);
			public WGPUBool HasWGSLLanguageFeature(WGPUWGSLLanguageFeatureName feature) => Wgpu.wgpuInstanceHasWGSLLanguageFeature(this, feature);
			public void ProcessEvents() => Wgpu.wgpuInstanceProcessEvents(this);
			public void RequestAdapter(WGPURequestAdapterOptions* options, WGPURequestAdapterCallbackInfo callbackInfo) => Wgpu.wgpuInstanceRequestAdapter(this, options, callbackInfo);
			public WGPUWaitStatus WaitAny(size_t futureCount, WGPUFutureWaitInfo* futures, uint64 timeout) => Wgpu.wgpuInstanceWaitAny(this, futureCount, futures, timeout);
			public void AddRef() => Wgpu.wgpuInstanceAddRef(this);
			public void Release() => Wgpu.wgpuInstanceRelease(this);
		}

		[CRepr]
		public struct WGPUPipelineLayout : this(void* Handle) {
			public static Self Null => .(null);

			public void SetLabel(WGPUStringView label) => Wgpu.wgpuPipelineLayoutSetLabel(this, label);
			public void AddRef() => Wgpu.wgpuPipelineLayoutAddRef(this);
			public void Release() => Wgpu.wgpuPipelineLayoutRelease(this);
		}

		[CRepr]
		public struct WGPUQuerySet : this(void* Handle) {
			public static Self Null => .(null);

			public void Destroy() => Wgpu.wgpuQuerySetDestroy(this);
			public uint32 GetCount() => Wgpu.wgpuQuerySetGetCount(this);
			public WGPUQueryType GetType() => Wgpu.wgpuQuerySetGetType(this);
			public void SetLabel(WGPUStringView label) => Wgpu.wgpuQuerySetSetLabel(this, label);
			public void AddRef() => Wgpu.wgpuQuerySetAddRef(this);
			public void Release() => Wgpu.wgpuQuerySetRelease(this);
		}

		[CRepr]
		public struct WGPUQueue : this(void* Handle) {
			public static Self Null => .(null);

			public uint64 SubmitForIndex(c_size commandCount, WGPUCommandBuffer* commands) => Wgpu.wgpuQueueSubmitForIndex(this, commandCount, commands);

			public void OnSubmittedWorkDone(WGPUQueueWorkDoneCallbackInfo callbackInfo, void* userdata) => Wgpu.wgpuQueueOnSubmittedWorkDone(this, callbackInfo);
			public void SetLabel(WGPUStringView label) => Wgpu.wgpuQueueSetLabel(this, label);
			public void Submit(uint32 commandCount, WGPUCommandBuffer* commands) => Wgpu.wgpuQueueSubmit(this, commandCount, commands);
			public void WriteBuffer(WGPUBuffer buffer, uint64 bufferOffset, void* data, c_size size) => Wgpu.wgpuQueueWriteBuffer(this, buffer, bufferOffset, data, size);
			public void WriteTexture(WGPUTexelCopyTextureInfo* destination, void* data, c_size dataSize, WGPUTexelCopyBufferLayout* dataLayout, WGPUExtent3D* writeSize) => Wgpu.wgpuQueueWriteTexture(this, destination, data, dataSize, dataLayout, writeSize);
			public void AddRef() => Wgpu.wgpuQueueAddRef(this);
			public void Release() => Wgpu.wgpuQueueRelease(this);
		}

		[CRepr]
		public struct WGPURenderBundle : this(void* Handle) {
			public static Self Null => .(null);

			public void SetLabel(WGPUStringView label) => Wgpu.wgpuRenderBundleSetLabel(this, label);
			public void AddRef() => Wgpu.wgpuRenderBundleAddRef(this);
			public void Release() => Wgpu.wgpuRenderBundleRelease(this);
		}

		[CRepr]
		public struct WGPURenderBundleEncoder : this(void* Handle) {
			public static Self Null => .(null);

			public void SetPushConstants(WGPUShaderStage stages, uint32 offset, uint32 sizeBytes, void* data) => Wgpu.wgpuRenderBundleEncoderSetPushConstants(this, stages, offset, sizeBytes, data);

			public void Draw(uint32 vertexCount, uint32 instanceCount, uint32 firstVertex, uint32 firstInstance) => Wgpu.wgpuRenderBundleEncoderDraw(this, vertexCount, instanceCount, firstVertex, firstInstance);
			public void DrawIndexed(uint32 indexCount, uint32 instanceCount, uint32 firstIndex, int32 baseVertex, uint32 firstInstance) => Wgpu.wgpuRenderBundleEncoderDrawIndexed(this, indexCount, instanceCount, firstIndex, baseVertex, firstInstance);
			public void DrawIndexedIndirect(WGPUBuffer indirectBuffer, uint64 indirectOffset) => Wgpu.wgpuRenderBundleEncoderDrawIndexedIndirect(this, indirectBuffer, indirectOffset);
			public void DrawIndirect(WGPUBuffer indirectBuffer, uint64 indirectOffset) => Wgpu.wgpuRenderBundleEncoderDrawIndirect(this, indirectBuffer, indirectOffset);
			public WGPURenderBundle Finish(WGPURenderBundleDescriptor* descriptor) => Wgpu.wgpuRenderBundleEncoderFinish(this, descriptor);
			public void InsertDebugMarker(WGPUStringView markerLabel) => Wgpu.wgpuRenderBundleEncoderInsertDebugMarker(this, markerLabel);
			public void PopDebugGroup() => Wgpu.wgpuRenderBundleEncoderPopDebugGroup(this);
			public void PushDebugGroup(WGPUStringView groupLabel) => Wgpu.wgpuRenderBundleEncoderPushDebugGroup(this, groupLabel);
			public void SetBindGroup(uint32 groupIndex, WGPUBindGroup group, uint32 dynamicOffsetCount, uint32* dynamicOffsets) => Wgpu.wgpuRenderBundleEncoderSetBindGroup(this, groupIndex, group, dynamicOffsetCount, dynamicOffsets);
			public void SetIndexBuffer(WGPUBuffer buffer, WGPUIndexFormat format, uint64 offset, uint64 size) => Wgpu.wgpuRenderBundleEncoderSetIndexBuffer(this, buffer, format, offset, size);
			public void SetLabel(WGPUStringView label) => Wgpu.wgpuRenderBundleEncoderSetLabel(this, label);
			public void SetPipeline(WGPURenderPipeline pipeline) => Wgpu.wgpuRenderBundleEncoderSetPipeline(this, pipeline);
			public void SetVertexBuffer(uint32 slot, WGPUBuffer buffer, uint64 offset, uint64 size) => Wgpu.wgpuRenderBundleEncoderSetVertexBuffer(this, slot, buffer, offset, size);
			public void AddRef() => Wgpu.wgpuRenderBundleEncoderAddRef(this);
			public void Release() => Wgpu.wgpuRenderBundleEncoderRelease(this);
		}

		[CRepr]
		public struct WGPURenderPassEncoder : this(void* Handle) {
			public static Self Null => .(null);

			public void SetPushConstants(WGPUShaderStage stages, uint32 offset, uint32 sizeBytes, void* data) => Wgpu.wgpuRenderPassEncoderSetPushConstants(this, stages, offset, sizeBytes, data);
			public void MultiDrawIndirect(WGPUBuffer buffer, uint64 offset, uint32 count) => Wgpu.wgpuRenderPassEncoderMultiDrawIndirect(this, buffer, offset, count);
			public void MultiDrawIndexedIndirect(WGPUBuffer buffer, uint64 offset, uint32 count) => Wgpu.wgpuRenderPassEncoderMultiDrawIndexedIndirect(this, buffer, offset, count);
			public void MultiDrawIndirectCount(WGPUBuffer buffer, uint64 offset, WGPUBuffer countBuffer, uint64 countOffset, uint32 maxCount) => Wgpu.wgpuRenderPassEncoderMultiDrawIndirectCount(this, buffer, offset, countBuffer, countOffset, maxCount);
			public void MultiDrawIndexedIndirectCount(WGPUBuffer buffer, uint64 offset, WGPUBuffer countBuffer, uint64 countOffset, uint32 maxCount) => Wgpu.wgpuRenderPassEncoderMultiDrawIndexedIndirectCount(this, buffer, offset, countBuffer, countOffset, maxCount);
			public void BeginPipelineStatisticsQuery(WGPUQuerySet querySet, uint32 queryIndex) => Wgpu.wgpuRenderPassEncoderBeginPipelineStatisticsQuery(this, querySet, queryIndex);
			public void EndPipelineStatisticsQuery() => Wgpu.wgpuRenderPassEncoderEndPipelineStatisticsQuery(this);
			public void WriteTimestamp(WGPUQuerySet querySet, uint32 queryIndex) => Wgpu.wgpuRenderPassEncoderWriteTimestamp(this, querySet, queryIndex);

			public void BeginOcclusionQuery(uint32 queryIndex) => Wgpu.wgpuRenderPassEncoderBeginOcclusionQuery(this, queryIndex);
			public void Draw(uint32 vertexCount, uint32 instanceCount, uint32 firstVertex, uint32 firstInstance) => Wgpu.wgpuRenderPassEncoderDraw(this, vertexCount, instanceCount, firstVertex, firstInstance);
			public void DrawIndexed(uint32 indexCount, uint32 instanceCount, uint32 firstIndex, int32 baseVertex, uint32 firstInstance) => Wgpu.wgpuRenderPassEncoderDrawIndexed(this, indexCount, instanceCount, firstIndex, baseVertex, firstInstance);
			public void DrawIndexedIndirect(WGPUBuffer indirectBuffer, uint64 indirectOffset) => Wgpu.wgpuRenderPassEncoderDrawIndexedIndirect(this, indirectBuffer, indirectOffset);
			public void DrawIndirect(WGPUBuffer indirectBuffer, uint64 indirectOffset) => Wgpu.wgpuRenderPassEncoderDrawIndirect(this, indirectBuffer, indirectOffset);
			public void End() => Wgpu.wgpuRenderPassEncoderEnd(this);
			public void EndOcclusionQuery() => Wgpu.wgpuRenderPassEncoderEndOcclusionQuery(this);
			public void ExecuteBundles(uint32 bundlesCount, WGPURenderBundle* bundles) => Wgpu.wgpuRenderPassEncoderExecuteBundles(this, bundlesCount, bundles);
			public void InsertDebugMarker(WGPUStringView markerLabel) => Wgpu.wgpuRenderPassEncoderInsertDebugMarker(this, markerLabel);
			public void PopDebugGroup() => Wgpu.wgpuRenderPassEncoderPopDebugGroup(this);
			public void PushDebugGroup(WGPUStringView groupLabel) => Wgpu.wgpuRenderPassEncoderPushDebugGroup(this, groupLabel);
			public void SetBindGroup(uint32 groupIndex, WGPUBindGroup group, uint32 dynamicOffsetCount, uint32* dynamicOffsets) => Wgpu.wgpuRenderPassEncoderSetBindGroup(this, groupIndex, group, dynamicOffsetCount, dynamicOffsets);
			public void SetBlendConstant(WGPUColor* color) => Wgpu.wgpuRenderPassEncoderSetBlendConstant(this, color);
			public void SetIndexBuffer(WGPUBuffer buffer, WGPUIndexFormat format, uint64 offset, uint64 size) => Wgpu.wgpuRenderPassEncoderSetIndexBuffer(this, buffer, format, offset, size);
			public void SetLabel(WGPUStringView label) => Wgpu.wgpuRenderPassEncoderSetLabel(this, label);
			public void SetPipeline(WGPURenderPipeline pipeline) => Wgpu.wgpuRenderPassEncoderSetPipeline(this, pipeline);
			public void SetScissorRect(uint32 x, uint32 y, uint32 width, uint32 height) => Wgpu.wgpuRenderPassEncoderSetScissorRect(this, x, y, width, height);
			public void SetStencilReference(uint32 reference) => Wgpu.wgpuRenderPassEncoderSetStencilReference(this, reference);
			public void SetVertexBuffer(uint32 slot, WGPUBuffer buffer, uint64 offset, uint64 size) => Wgpu.wgpuRenderPassEncoderSetVertexBuffer(this, slot, buffer, offset, size);
			public void SetViewport(float x, float y, float width, float height, float minDepth, float maxDepth) => Wgpu.wgpuRenderPassEncoderSetViewport(this, x, y, width, height, minDepth, maxDepth);
			public void AddRef() => Wgpu.wgpuRenderPassEncoderAddRef(this);
			public void Release() => Wgpu.wgpuRenderPassEncoderRelease(this);
		}

		[CRepr]
		public struct WGPURenderPipeline : this(void* Handle) {
			public static Self Null => .(null);

			public WGPUBindGroupLayout GetBindGroupLayout(uint32 groupIndex) => Wgpu.wgpuRenderPipelineGetBindGroupLayout(this, groupIndex);
			public void SetLabel(WGPUStringView label) => Wgpu.wgpuRenderPipelineSetLabel(this, label);
			public void AddRef() => Wgpu.wgpuRenderPipelineAddRef(this);
			public void Release() => Wgpu.wgpuRenderPipelineRelease(this);
		}

		[CRepr]
		public struct WGPUSampler : this(void* Handle) {
			public static Self Null => .(null);

			public void SetLabel(WGPUStringView label) => Wgpu.wgpuSamplerSetLabel(this, label);
			public void AddRef() => Wgpu.wgpuSamplerAddRef(this);
			public void Release() => Wgpu.wgpuSamplerRelease(this);
		}

		[CRepr]
		public struct WGPUShaderModule : this(void* Handle) {
			public static Self Null => .(null);

			public void GetCompilationInfo(WGPUCompilationInfoCallbackInfo callbackInfo) => Wgpu.wgpuShaderModuleGetCompilationInfo(this, callbackInfo);
			public void SetLabel(WGPUStringView label) => Wgpu.wgpuShaderModuleSetLabel(this, label);
			public void AddRef() => Wgpu.wgpuShaderModuleAddRef(this);
			public void Release() => Wgpu.wgpuShaderModuleRelease(this);
		}

		[CRepr]
		public struct WGPUSurface : this(void* Handle) {
			public static Self Null => .(null);

			public void Configure(WGPUSurfaceConfiguration* config) => Wgpu.wgpuSurfaceConfigure(this, config);
			public void GetCapabilities(WGPUAdapter adapter, WGPUSurfaceCapabilities* capabilities) => Wgpu.wgpuSurfaceGetCapabilities(this, adapter, capabilities);
			public void GetCurrentTexture(WGPUSurfaceTexture* surfaceTexture) => Wgpu.wgpuSurfaceGetCurrentTexture(this, surfaceTexture);
			public WGPUStatus Present() => Wgpu.wgpuSurfacePresent(this);
			public void SetLabel(WGPUStringView label) => Wgpu.wgpuSurfaceSetLabel(this, label);
			public void Unconfigure() => Wgpu.wgpuSurfaceUnconfigure(this);
			public void AddRef() => Wgpu.wgpuSurfaceAddRef(this);
			public void Release() => Wgpu.wgpuSurfaceRelease(this);
		}

		[CRepr]
		public struct WGPUTexture : this(void* Handle) {
			public static Self Null => .(null);

			public WGPUTextureView CreateView(WGPUTextureViewDescriptor* descriptor) => Wgpu.wgpuTextureCreateView(this, descriptor);
			public void Destroy() => Wgpu.wgpuTextureDestroy(this);
			public uint32 GetDepthOrArrayLayers() => Wgpu.wgpuTextureGetDepthOrArrayLayers(this);
			public WGPUTextureDimension GetDimension() => Wgpu.wgpuTextureGetDimension(this);
			public WGPUTextureFormat GetFormat() => Wgpu.wgpuTextureGetFormat(this);
			public uint32 GetHeight() => Wgpu.wgpuTextureGetHeight(this);
			public uint32 GetMipLevelCount() => Wgpu.wgpuTextureGetMipLevelCount(this);
			public uint32 GetSampleCount() => Wgpu.wgpuTextureGetSampleCount(this);
			public WGPUTextureUsage GetUsage() => Wgpu.wgpuTextureGetUsage(this);
			public uint32 GetWidth() => Wgpu.wgpuTextureGetWidth(this);
			public void SetLabel(WGPUStringView label) => Wgpu.wgpuTextureSetLabel(this, label);
			public void AddRef() => Wgpu.wgpuTextureAddRef(this);
			public void Release() => Wgpu.wgpuTextureRelease(this);
		}

		[CRepr]
		public struct WGPUTextureView : this(void* Handle) {
			public static Self Null => .(null);

			public void SetLabel(WGPUStringView label) => Wgpu.wgpuTextureViewSetLabel(this, label);
			public void AddRef() => Wgpu.wgpuTextureViewAddRef(this);
			public void Release() => Wgpu.wgpuTextureViewRelease(this);
		}
	}
}