using System;
using System.Interop;

namespace Wgpu {
	extension Wgpu {
		[CRepr]
		public struct Adapter : this(void* Handle) {
			public static Self Null => .(null);

			public c_size GetFeatures(SupportedFeatures* features) => Wgpu.AdapterGetFeatures(this, features);
			public c_bool GetLimits(Limits* limits) => Wgpu.AdapterGetLimits(this, limits);
			public void GetInfo(AdapterInfo* info) => Wgpu.AdapterGetInfo(this, info);
			public c_bool HasFeature(FeatureName feature) => Wgpu.AdapterHasFeature(this, feature);
			public void RequestDevice(DeviceDescriptor* descriptor, RequestDeviceCallbackInfo callbackInfo, void* userdata) => Wgpu.AdapterRequestDevice(this, descriptor, callbackInfo);
		}

		[CRepr]
		public struct BindGroup : this(void* Handle) {
			public static Self Null => .(null);

			public void Release() => Wgpu.wgpuBindGroupRelease(this);
		}

		[CRepr]
		public struct BindGroupLayout : this(void* Handle) {
			public static Self Null => .(null);

			public void Release() => Wgpu.wgpuBindGroupLayoutRelease(this);
		}

		[CRepr]
		public struct Buffer : this(void* Handle) {
			public static Self Null => .(null);

			public void Destroy() => Wgpu.BufferDestroy(this);
			public void* GetConstMappedRange(c_size offset, c_size size) => Wgpu.BufferGetConstMappedRange(this, offset, size);
			public void* GetMappedRange(c_size offset, c_size size) => Wgpu.BufferGetMappedRange(this, offset, size);
			public void MapAsync(MapMode mode, c_size offset, c_size size, BufferMapCallback callback, void* userdata) => Wgpu.BufferMapAsync(this, mode, offset, size, callback, userdata);
			public void Unmap() => Wgpu.BufferUnmap(this);
			public void Release() => Wgpu.BufferRelease(this);
		}

		[CRepr]
		public struct CommandBuffer : this(void* Handle) {
			public static Self Null => .(null);

			public void Release() => Wgpu.CommandBufferRelease(this);
		}

		[CRepr]
		public struct CommandEncoder : this(void* Handle) {
			public static Self Null => .(null);

			public ComputePassEncoder BeginComputePass(ComputePassDescriptor* descriptor) => Wgpu.CommandEncoderBeginComputePass(this, descriptor);
			public RenderPassEncoder BeginRenderPass(RenderPassDescriptor* descriptor) => Wgpu.CommandEncoderBeginRenderPass(this, descriptor);
			public void ClearBuffer(Buffer buffer, uint64 offset, uint64 size) => Wgpu.CommandEncoderClearBuffer(this, buffer, offset, size);
			public void CopyBufferToBuffer(Buffer source, uint64 sourceOffset, Buffer destination, uint64 destinationOffset, uint64 size) => Wgpu.CommandEncoderCopyBufferToBuffer(this, source, sourceOffset, destination, destinationOffset, size);
			public void CopyBufferToTexture(TexelCopyBufferInfo* source, TexelCopyTextureInfo* destination, Extent3D* copySize) => Wgpu.CommandEncoderCopyBufferToTexture(this, source, destination, copySize);
			public void CopyTextureToBuffer(TexelCopyTextureInfo* source, TexelCopyBufferInfo* destination, Extent3D* copySize) => Wgpu.CommandEncoderCopyTextureToBuffer(this, source, destination, copySize);
			public void CopyTextureToTexture(TexelCopyTextureInfo* source, TexelCopyTextureInfo* destination, Extent3D* copySize) => Wgpu.CommandEncoderCopyTextureToTexture(this, source, destination, copySize);
			public CommandBuffer Finish(CommandBufferDescriptor* descriptor) => Wgpu.CommandEncoderFinish(this, descriptor);
			public void InsertDebugMarker(WGPUStringView markerLabel) => Wgpu.CommandEncoderInsertDebugMarker(this, markerLabel);
			public void PopDebugGroup() => Wgpu.CommandEncoderPopDebugGroup(this);
			public void PushDebugGroup(WGPUStringView groupLabel) => Wgpu.CommandEncoderPushDebugGroup(this, groupLabel);
			public void ResolveQuerySet(QuerySet querySet, uint32 firstQuery, uint32 queryCount, Buffer destination, uint64 destinationOffset) => Wgpu.CommandEncoderResolveQuerySet(this, querySet, firstQuery, queryCount, destination, destinationOffset);
			public void WriteTimestamp(QuerySet querySet, uint32 queryIndex) => Wgpu.CommandEncoderWriteTimestamp(this, querySet, queryIndex);
			public void Release() => Wgpu.CommandEncoderRelease(this);
		}

		[CRepr]
		public struct ComputePassEncoder : this(void* Handle) {
			public static Self Null => .(null);

			public void BeginPipelineStatisticsQuery(QuerySet querySet, uint32 queryIndex) => Wgpu.ComputePassEncoderBeginPipelineStatisticsQuery(this, querySet, queryIndex);
			public void DispatchWorkgroups(uint32 workgroupCountX, uint32 workgroupCountY, uint32 workgroupCountZ) => Wgpu.ComputePassEncoderDispatchWorkgroups(this, workgroupCountX, workgroupCountY, workgroupCountZ);
			public void DispatchWorkgroupsIndirect(Buffer indirectBuffer, uint64 indirectOffset) => Wgpu.ComputePassEncoderDispatchWorkgroupsIndirect(this, indirectBuffer, indirectOffset);
			public void End() => Wgpu.ComputePassEncoderEnd(this);
			public void EndPipelineStatisticsQuery() => Wgpu.ComputePassEncoderEndPipelineStatisticsQuery(this);
			public void InsertDebugMarker(WGPUStringView markerLabel) => Wgpu.ComputePassEncoderInsertDebugMarker(this, markerLabel);
			public void PopDebugGroup() => Wgpu.ComputePassEncoderPopDebugGroup(this);
			public void PushDebugGroup(WGPUStringView groupLabel) => Wgpu.ComputePassEncoderPushDebugGroup(this, groupLabel);
			public void SetBindGroup(uint32 groupIndex, BindGroup group, uint32 dynamicOffsetCount, uint32* dynamicOffsets) => Wgpu.ComputePassEncoderSetBindGroup(this, groupIndex, group, dynamicOffsetCount, dynamicOffsets);
			public void SetPipeline(ComputePipeline pipeline) => Wgpu.ComputePassEncoderSetPipeline(this, pipeline);
		}

		[CRepr]
		public struct ComputePipeline : this(void* Handle) {
			public static Self Null => .(null);

			public BindGroupLayout GetBindGroupLayout(uint32 groupIndex) => Wgpu.ComputePipelineGetBindGroupLayout(this, groupIndex);
			public void SetLabel(WGPUStringView label) => Wgpu.ComputePipelineSetLabel(this, label);
			public void Release() => Wgpu.ComputePipelineRelease(this);
		}

		[CRepr]
		public struct Device : this(void* Handle) {
			public static Self Null => .(null);

			public ShaderModule CreateShaderModuleSpirV(ShaderModuleDescriptorSpirV* descriptor) => Wgpu.DeviceCreateShaderModuleSpirV(this, descriptor);
			public BindGroup CreateBindGroup(BindGroupDescriptor* descriptor) => Wgpu.DeviceCreateBindGroup(this, descriptor);
			public BindGroupLayout CreateBindGroupLayout(BindGroupLayoutDescriptor* descriptor) => Wgpu.DeviceCreateBindGroupLayout(this, descriptor);
			public Buffer CreateBuffer(BufferDescriptor* descriptor) => Wgpu.DeviceCreateBuffer(this, descriptor);
			public CommandEncoder CreateCommandEncoder(CommandEncoderDescriptor* descriptor) => Wgpu.DeviceCreateCommandEncoder(this, descriptor);
			public ComputePipeline CreateComputePipeline(ComputePipelineDescriptor* descriptor) => Wgpu.DeviceCreateComputePipeline(this, descriptor);
			public void CreateComputePipelineAsync(ComputePipelineDescriptor* descriptor, CreateComputePipelineAsyncCallback callback, void* userdata) => Wgpu.DeviceCreateComputePipelineAsync(this, descriptor, callback, userdata);
			public PipelineLayout CreatePipelineLayout(PipelineLayoutDescriptor* descriptor) => Wgpu.DeviceCreatePipelineLayout(this, descriptor);
			public QuerySet CreateQuerySet(QuerySetDescriptor* descriptor) => Wgpu.DeviceCreateQuerySet(this, descriptor);
			public RenderBundleEncoder CreateRenderBundleEncoder(RenderBundleEncoderDescriptor* descriptor) => Wgpu.DeviceCreateRenderBundleEncoder(this, descriptor);
			public RenderPipeline CreateRenderPipeline(RenderPipelineDescriptor* descriptor) => Wgpu.DeviceCreateRenderPipeline(this, descriptor);
			public void CreateRenderPipelineAsync(RenderPipelineDescriptor* descriptor, CreateRenderPipelineAsyncCallback callback, void* userdata) => Wgpu.DeviceCreateRenderPipelineAsync(this, descriptor, callback, userdata);
			public Sampler CreateSampler(SamplerDescriptor* descriptor) => Wgpu.DeviceCreateSampler(this, descriptor);
			public ShaderModule CreateShaderModule(ShaderModuleDescriptor* descriptor) => Wgpu.DeviceCreateShaderModule(this, descriptor);
			public Texture CreateTexture(TextureDescriptor* descriptor) => Wgpu.DeviceCreateTexture(this, descriptor);
			public void Destroy() => Wgpu.DeviceDestroy(this);
			public c_size GetFeatures(SupportedFeatures* features) => Wgpu.DeviceGetFeatures(this, features);
			public c_bool GetLimits(Limits* limits) => Wgpu.DeviceGetLimits(this, limits);
			public Queue GetQueue() => Wgpu.DeviceGetQueue(this);
			public c_bool HasFeature(FeatureName feature) => Wgpu.DeviceHasFeature(this, feature);
			public Future PopErrorScope(PopErrorScopeCallbackInfo callbackInfo, void* userdata) => Wgpu.DevicePopErrorScope(this, callbackInfo);
			public void PushErrorScope(ErrorFilter filter) => Wgpu.DevicePushErrorScope(this, filter);
			public void Poll(c_bool wait, uint64* wrappedSubmissionIndex) => Wgpu.DevicePoll(this, wait, wrappedSubmissionIndex);
			public void Release() => Wgpu.DeviceRelease(this);
		}

		[CRepr]
		public struct Instance : this(void* Handle) {
			public static Self Null => .(null);

			public void GenerateReport(GlobalReport* report) => Wgpu.GenerateReport(this, report);
			public c_size EnumerateAdapters(InstanceEnumerateAdapterOptions* options, Adapter* adapters) => Wgpu.InstanceEnumerateAdapters(this, options, adapters);
			public Surface CreateSurface(SurfaceDescriptor* descriptor) => Wgpu.InstanceCreateSurface(this, descriptor);
			public void ProcessEvents() => Wgpu.InstanceProcessEvents(this);
			public void RequestAdapter(RequestAdapterOptions* options, RequestAdapterCallbackInfo callbackInfo) => Wgpu.InstanceRequestAdapter(this, options, callbackInfo);
		}

		[CRepr]
		public struct PipelineLayout : this(void* Handle) {
			public static Self Null => .(null);

			public void Release() => Wgpu.wgpuPipelineLayoutRelease(this);
		}

		[CRepr]
		public struct QuerySet : this(void* Handle) {
			public static Self Null => .(null);

			public void Destroy() => Wgpu.QuerySetDestroy(this);
			public void Release() => Wgpu.wgpuQuerySetRelease(this);
		}

		[CRepr]
		public struct Queue : this(void* Handle) {
			public static Self Null => .(null);

			public uint64 SubmitForIndex(c_size commandCount, CommandBuffer* commands) => Wgpu.QueueSubmitForIndex(this, commandCount, commands);
			public void OnSubmittedWorkDone(QueueWorkDoneCallback callback, void* userdata) => Wgpu.QueueOnSubmittedWorkDone(this, callback, userdata);
			public void Submit(uint32 commandCount, CommandBuffer* commands) => Wgpu.QueueSubmit(this, commandCount, commands);
			public void WriteBuffer(Buffer buffer, uint64 bufferOffset, void* data, c_size size) => Wgpu.QueueWriteBuffer(this, buffer, bufferOffset, data, size);
			public void WriteTexture(TexelCopyTextureInfo* destination, void* data, c_size dataSize, TexelCopyBufferLayout* dataLayout, Extent3D* writeSize) => Wgpu.QueueWriteTexture(this, destination, data, dataSize, dataLayout, writeSize);
		}

		[CRepr]
		public struct RenderBundle : this(void* Handle) {
			public static Self Null => .(null);

			public void Release() => Wgpu.wgpuRenderBundleRelease(this);
		}

		[CRepr]
		public struct RenderBundleEncoder : this(void* Handle) {
			public static Self Null => .(null);

			public void Draw(uint32 vertexCount, uint32 instanceCount, uint32 firstVertex, uint32 firstInstance) => Wgpu.RenderBundleEncoderDraw(this, vertexCount, instanceCount, firstVertex, firstInstance);
			public void DrawIndexed(uint32 indexCount, uint32 instanceCount, uint32 firstIndex, int32 baseVertex, uint32 firstInstance) => Wgpu.RenderBundleEncoderDrawIndexed(this, indexCount, instanceCount, firstIndex, baseVertex, firstInstance);
			public void DrawIndexedIndirect(Buffer indirectBuffer, uint64 indirectOffset) => Wgpu.RenderBundleEncoderDrawIndexedIndirect(this, indirectBuffer, indirectOffset);
			public void DrawIndirect(Buffer indirectBuffer, uint64 indirectOffset) => Wgpu.RenderBundleEncoderDrawIndirect(this, indirectBuffer, indirectOffset);
			public RenderBundle Finish(RenderBundleDescriptor* descriptor) => Wgpu.RenderBundleEncoderFinish(this, descriptor);
			public void InsertDebugMarker(WGPUStringView markerLabel) => Wgpu.RenderBundleEncoderInsertDebugMarker(this, markerLabel);
			public void PopDebugGroup() => Wgpu.RenderBundleEncoderPopDebugGroup(this);
			public void PushDebugGroup(WGPUStringView groupLabel) => Wgpu.RenderBundleEncoderPushDebugGroup(this, groupLabel);
			public void SetBindGroup(uint32 groupIndex, BindGroup group, uint32 dynamicOffsetCount, uint32* dynamicOffsets) => Wgpu.RenderBundleEncoderSetBindGroup(this, groupIndex, group, dynamicOffsetCount, dynamicOffsets);
			public void SetIndexBuffer(Buffer buffer, IndexFormat format, uint64 offset, uint64 size) => Wgpu.RenderBundleEncoderSetIndexBuffer(this, buffer, format, offset, size);
			public void SetPipeline(RenderPipeline pipeline) => Wgpu.RenderBundleEncoderSetPipeline(this, pipeline);
			public void SetVertexBuffer(uint32 slot, Buffer buffer, uint64 offset, uint64 size) => Wgpu.RenderBundleEncoderSetVertexBuffer(this, slot, buffer, offset, size);
		}

		[CRepr]
		public struct RenderPassEncoder : this(void* Handle) {
			public static Self Null => .(null);

			public void BeginOcclusionQuery(uint32 queryIndex) => Wgpu.RenderPassEncoderBeginOcclusionQuery(this, queryIndex);
			public void BeginPipelineStatisticsQuery(QuerySet querySet, uint32 queryIndex) => Wgpu.RenderPassEncoderBeginPipelineStatisticsQuery(this, querySet, queryIndex);
			public void Draw(uint32 vertexCount, uint32 instanceCount, uint32 firstVertex, uint32 firstInstance) => Wgpu.RenderPassEncoderDraw(this, vertexCount, instanceCount, firstVertex, firstInstance);
			public void DrawIndexed(uint32 indexCount, uint32 instanceCount, uint32 firstIndex, int32 baseVertex, uint32 firstInstance) => Wgpu.RenderPassEncoderDrawIndexed(this, indexCount, instanceCount, firstIndex, baseVertex, firstInstance);
			public void DrawIndexedIndirect(Buffer indirectBuffer, uint64 indirectOffset) => Wgpu.RenderPassEncoderDrawIndexedIndirect(this, indirectBuffer, indirectOffset);
			public void DrawIndirect(Buffer indirectBuffer, uint64 indirectOffset) => Wgpu.RenderPassEncoderDrawIndirect(this, indirectBuffer, indirectOffset);
			public void End() => Wgpu.RenderPassEncoderEnd(this);
			public void EndOcclusionQuery() => Wgpu.RenderPassEncoderEndOcclusionQuery(this);
			public void EndPipelineStatisticsQuery() => Wgpu.RenderPassEncoderEndPipelineStatisticsQuery(this);
			public void ExecuteBundles(uint32 bundlesCount, RenderBundle* bundles) => Wgpu.RenderPassEncoderExecuteBundles(this, bundlesCount, bundles);
			public void InsertDebugMarker(WGPUStringView markerLabel) => Wgpu.RenderPassEncoderInsertDebugMarker(this, markerLabel);
			public void PopDebugGroup() => Wgpu.RenderPassEncoderPopDebugGroup(this);
			public void PushDebugGroup(WGPUStringView groupLabel) => Wgpu.RenderPassEncoderPushDebugGroup(this, groupLabel);
			public void SetBindGroup(uint32 groupIndex, BindGroup group, uint32 dynamicOffsetCount, uint32* dynamicOffsets) => Wgpu.RenderPassEncoderSetBindGroup(this, groupIndex, group, dynamicOffsetCount, dynamicOffsets);
			public void SetBlendConstant(Color* color) => Wgpu.RenderPassEncoderSetBlendConstant(this, color);
			public void SetIndexBuffer(Buffer buffer, IndexFormat format, uint64 offset, uint64 size) => Wgpu.RenderPassEncoderSetIndexBuffer(this, buffer, format, offset, size);
			public void SetPipeline(RenderPipeline pipeline) => Wgpu.RenderPassEncoderSetPipeline(this, pipeline);
			public void SetScissorRect(uint32 x, uint32 y, uint32 width, uint32 height) => Wgpu.RenderPassEncoderSetScissorRect(this, x, y, width, height);
			public void SetStencilReference(uint32 reference) => Wgpu.RenderPassEncoderSetStencilReference(this, reference);
			public void SetVertexBuffer(uint32 slot, Buffer buffer, uint64 offset, uint64 size) => Wgpu.RenderPassEncoderSetVertexBuffer(this, slot, buffer, offset, size);
			public void SetViewport(float x, float y, float width, float height, float minDepth, float maxDepth) => Wgpu.RenderPassEncoderSetViewport(this, x, y, width, height, minDepth, maxDepth);
			public void SetPushConstants(ShaderStage stages, uint32 offset, uint32 sizeBytes, void* data) => Wgpu.RenderPassEncoderSetPushConstants(this, stages, offset, sizeBytes, data);
		}

		[CRepr]
		public struct RenderPipeline : this(void* Handle) {
			public static Self Null => .(null);

			public BindGroupLayout GetBindGroupLayout(uint32 groupIndex) => Wgpu.RenderPipelineGetBindGroupLayout(this, groupIndex);
			public void SetLabel(WGPUStringView label) => Wgpu.RenderPipelineSetLabel(this, label);
			public void Release() => Wgpu.wgpuRenderPipelineRelease(this);
		}

		[CRepr]
		public struct Sampler : this(void* Handle) {
			public static Self Null => .(null);

			public void Release() => Wgpu.wgpuSamplerRelease(this);
		}

		[CRepr]
		public struct ShaderModule : this(void* Handle) {
			public static Self Null => .(null);

			public void GetCompilationInfo(CompilationInfoCallback callback, void* userdata) => Wgpu.ShaderModuleGetCompilationInfo(this, callback, userdata);
			public void SetLabel(WGPUStringView label) => Wgpu.ShaderModuleSetLabel(this, label);
			public void Release() => Wgpu.wgpuShaderModuleRelease(this);
		}

		[CRepr]
		public struct Surface : this(void* Handle) {
			public static Self Null => .(null);

			//public TextureFormat GetPreferredFormat(Adapter adapter) => Wgpu.SurfaceGetPreferredFormat(this, adapter);
		}

		[CRepr]
		public struct Texture : this(void* Handle) {
			public static Self Null => .(null);

			public TextureView CreateView(TextureViewDescriptor* descriptor) => Wgpu.TextureCreateView(this, descriptor);
			public void Destroy() => Wgpu.TextureDestroy(this);
			public void Release() => Wgpu.wgpuTextureRelease(this);
		}

		[CRepr]
		public struct TextureView : this(void* Handle) {
			public static Self Null => .(null);

			public void Release() => Wgpu.wgpuTextureViewRelease(this);
		}
	}
}