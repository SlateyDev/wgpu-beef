using System;
using System.Interop;

namespace Wgpu {
	public static class Wgpu {
		typealias WGPUBool = uint32;
		typealias WGPUSubmissionIndex = uint64;

		public const uint32 WGPUBool_False = 0;
		public const uint32 WGPUBool_True = 1;
		public const c_ulong WGPU_STRLEN = ~0;

		public enum WGPUAdapterType : c_uint {
			DiscreteGPU = 0x00000001,
			IntegratedGPU = 0x00000002,
			CPU = 0x00000003,
			Unknown = 0x00000004,
			Force32 = 0x7FFFFFFF
		}

		public enum WGPUAddressMode : c_uint {
			/**
			* `0x00000000`.
			* Indicates no value is passed for this argument. See @ref SentinelValues.
			*/
			Undefined = 0x00000000,
			ClampToEdge = 0x00000001,
			Repeat = 0x00000002,
			MirrorRepeat = 0x00000003,
			Force32 = 0x7FFFFFFF
		}

		public enum WGPUBackendType : c_uint {
			/**
			* `0x00000000`.
			* Indicates no value is passed for this argument. See @ref SentinelValues.
			*/
			Undefined = 0x00000000,
			Null = 0x00000001,
			WebGPU = 0x00000002,
			D3D11 = 0x00000003,
			D3D12 = 0x00000004,
			Metal = 0x00000005,
			Vulkan = 0x00000006,
			OpenGL = 0x00000007,
			OpenGLES = 0x00000008,
			Force32 = 0x7FFFFFFF
		}

		public enum WGPUBlendFactor : c_uint {
			/**
			* `0x00000000`.
			* Indicates no value is passed for this argument. See @ref SentinelValues.
			*/
			Undefined = 0x00000000,
			Zero = 0x00000001,
			One = 0x00000002,
			Src = 0x00000003,
			OneMinusSrc = 0x00000004,
			SrcAlpha = 0x00000005,
			OneMinusSrcAlpha = 0x00000006,
			Dst = 0x00000007,
			OneMinusDst = 0x00000008,
			DstAlpha = 0x00000009,
			OneMinusDstAlpha = 0x0000000A,
			SrcAlphaSaturated = 0x0000000B,
			Constant = 0x0000000C,
			OneMinusConstant = 0x0000000D,
			Src1 = 0x0000000E,
			OneMinusSrc1 = 0x0000000F,
			Src1Alpha = 0x00000010,
			OneMinusSrc1Alpha = 0x00000011,
			Force32 = 0x7FFFFFFF
		}

		public enum WGPUBlendOperation : c_uint {
			/**
			* `0x00000000`.
			* Indicates no value is passed for this argument. See @ref SentinelValues.
			*/
			Undefined = 0x00000000,
			Add = 0x00000001,
			Subtract = 0x00000002,
			ReverseSubtract = 0x00000003,
			Min = 0x00000004,
			Max = 0x00000005,
			Force32 = 0x7FFFFFFF
		}

		public enum WGPUBufferBindingType : c_uint {
			/**
			* `0x00000000`.
			* Indicates that this @ref WGPUBufferBindingLayout member of
			* its parent @ref WGPUBindGroupLayoutEntry is not used.
			* (See also @ref SentinelValues.)
			*/
			BindingNotUsed = 0x00000000,
			/**
			* `0x00000001`.
			* Indicates no value is passed for this argument. See @ref SentinelValues.
			*/
			Undefined = 0x00000001,
			Uniform = 0x00000002,
			Storage = 0x00000003,
			ReadOnlyStorage = 0x00000004,
			Force32 = 0x7FFFFFFF
		}

		public enum WGPUBufferMapState : c_uint {
			Unmapped = 0x00000001,
			Pending = 0x00000002,
			Mapped = 0x00000003,
			Force32 = 0x7FFFFFFF
		}

		/**
		* The callback mode controls how a callback for an asynchronous operation may be fired. See @ref Asynchronous-Operations for how these are used.
		*/
		public enum WGPUCallbackMode : c_uint {
			/**
			* `0x00000001`.
			* Callbacks created with `WaitAnyOnly`:
			* - fire when the asynchronous operation's future is passed to a call to `::wgpuInstanceWaitAny`
			*   AND the operation has already completed or it completes inside the call to `::wgpuInstanceWaitAny`.
			*/
			WaitAnyOnly = 0x00000001,
			/**
			* `0x00000002`.
			* Callbacks created with `AllowProcessEvents`:
			* - fire for the same reasons as callbacks created with `WGPUCallbackMode_WaitAnyOnly`
			* - fire inside a call to `::wgpuInstanceProcessEvents` if the asynchronous operation is complete.
			*/
			AllowProcessEvents = 0x00000002,
			/**
			* `0x00000003`.
			* Callbacks created with `AllowSpontaneous`:
			* - fire for the same reasons as callbacks created with `WGPUCallbackMode_AllowProcessEvents`
			* - **may** fire spontaneously on an arbitrary or application thread, when the WebGPU implementations discovers that the asynchronous operation is complete.
			*
			*   Implementations _should_ fire spontaneous callbacks as soon as possible.
			*
			* @note Because spontaneous callbacks may fire at an arbitrary time on an arbitrary thread, applications should take extra care when acquiring locks or mutating state inside the callback. It undefined behavior to re-entrantly call into the webgpu.h API if the callback fires while inside the callstack of another webgpu.h function that is not `wgpuInstanceWaitAny` or `wgpuInstanceProcessEvents`.
			*/
			AllowSpontaneous = 0x00000003,
			Force32 = 0x7FFFFFFF
		}

		public enum WGPUCompareFunction : c_uint {
			/**
			* `0x00000000`.
			* Indicates no value is passed for this argument. See @ref SentinelValues.
			*/
			Undefined = 0x00000000,
			Never = 0x00000001,
			Less = 0x00000002,
			Equal = 0x00000003,
			LessEqual = 0x00000004,
			Greater = 0x00000005,
			NotEqual = 0x00000006,
			GreaterEqual = 0x00000007,
			Always = 0x00000008,
			Force32 = 0x7FFFFFFF
		}

		public enum WGPUCompilationInfoRequestStatus : c_uint {
			Success = 0x00000001,
			InstanceDropped = 0x00000002,
			Error = 0x00000003,
			Unknown = 0x00000004,
			Force32 = 0x7FFFFFFF
		}

		public enum WGPUCompilationMessageType : c_uint {
			Error = 0x00000001,
			Warning = 0x00000002,
			Info = 0x00000003,
			Force32 = 0x7FFFFFFF
		}

		/**
		* Describes how frames are composited with other contents on the screen when `::wgpuSurfacePresent` is called.
		*/
		public enum WGPUCompositeAlphaMode : c_uint {
			/**
			* `0x00000000`.
			* Lets the WebGPU implementation choose the best mode (supported, and with the best performance) between @ref WGPUCompositeAlphaMode_Opaque or @ref WGPUCompositeAlphaMode_Inherit.
			*/
			Auto = 0x00000000,
			/**
			* `0x00000001`.
			* The alpha component of the image is ignored and teated as if it is always 1.0.
			*/
			Opaque = 0x00000001,
			/**
			* `0x00000002`.
			* The alpha component is respected and non-alpha components are assumed to be already multiplied with the alpha component. For example, (0.5, 0, 0, 0.5) is semi-transparent bright red.
			*/
			Premultiplied = 0x00000002,
			/**
			* `0x00000003`.
			* The alpha component is respected and non-alpha components are assumed to NOT be already multiplied with the alpha component. For example, (1.0, 0, 0, 0.5) is semi-transparent bright red.
			*/
			Unpremultiplied = 0x00000003,
			/**
			* `0x00000004`.
			* The handling of the alpha component is unknown to WebGPU and should be handled by the application using system-specific APIs. This mode may be unavailable (for example on Wasm).
			*/
			Inherit = 0x00000004,
			Force32 = 0x7FFFFFFF
		}

		public enum WGPUCreatePipelineAsyncStatus : c_uint {
			Success = 0x00000001,
			InstanceDropped = 0x00000002,
			ValidationError = 0x00000003,
			InternalError = 0x00000004,
			Unknown = 0x00000005,
			Force32 = 0x7FFFFFFF
		}

		public enum WGPUCullMode : c_uint {
			/**
			* `0x00000000`.
			* Indicates no value is passed for this argument. See @ref SentinelValues.
			*/
			Undefined = 0x00000000,
			None = 0x00000001,
			Front = 0x00000002,
			Back = 0x00000003,
			Force32 = 0x7FFFFFFF
		}

		public enum WGPUDeviceLostReason : c_uint {
			Unknown = 0x00000001,
			Destroyed = 0x00000002,
			InstanceDropped = 0x00000003,
			FailedCreation = 0x00000004,
			Force32 = 0x7FFFFFFF
		}

		public enum WGPUErrorFilter : c_uint {
			Validation = 0x00000001,
			OutOfMemory = 0x00000002,
			Internal = 0x00000003,
			Force32 = 0x7FFFFFFF
		}

		public enum WGPUErrorType : c_uint {
			NoError = 0x00000001,
			Validation = 0x00000002,
			OutOfMemory = 0x00000003,
			Internal = 0x00000004,
			Unknown = 0x00000005,
			Force32 = 0x7FFFFFFF
		}

		/**
		* See @ref WGPURequestAdapterOptions::featureLevel.
		*/
		public enum WGPUFeatureLevel : c_uint {
			/**
			* `0x00000001`.
			* "Compatibility" profile which can be supported on OpenGL ES 3.1.
			*/
			Compatibility = 0x00000001,
			/**
			* `0x00000002`.
			* "Core" profile which can be supported on Vulkan/Metal/D3D12.
			*/
			Core = 0x00000002,
			Force32 = 0x7FFFFFFF
		}

		public enum WGPUFeatureName : c_uint {
			Undefined = 0x00000000,
			DepthClipControl = 0x00000001,
			Depth32FloatStencil8 = 0x00000002,
			TimestampQuery = 0x00000003,
			TextureCompressionBC = 0x00000004,
			TextureCompressionBCSliced3D = 0x00000005,
			TextureCompressionETC2 = 0x00000006,
			TextureCompressionASTC = 0x00000007,
			TextureCompressionASTCSliced3D = 0x00000008,
			IndirectFirstInstance = 0x00000009,
			ShaderF16 = 0x0000000A,
			RG11B10UfloatRenderable = 0x0000000B,
			BGRA8UnormStorage = 0x0000000C,
			Float32Filterable = 0x0000000D,
			Float32Blendable = 0x0000000E,
			ClipDistances = 0x0000000F,
			DualSourceBlending = 0x00000010,
			Force32 = 0x7FFFFFFF
		}

		public enum WGPUFilterMode : c_uint {
			/**
			* `0x00000000`.
			* Indicates no value is passed for this argument. See @ref SentinelValues.
			*/
			Undefined = 0x00000000,
			Nearest = 0x00000001,
			Linear = 0x00000002,
			Force32 = 0x7FFFFFFF
		}

		public enum WGPUFrontFace : c_uint {
			/**
			* `0x00000000`.
			* Indicates no value is passed for this argument. See @ref SentinelValues.
			*/
			Undefined = 0x00000000,
			CCW = 0x00000001,
			CW = 0x00000002,
			Force32 = 0x7FFFFFFF
		}

		public enum WGPUIndexFormat : c_uint {
			/**
			* `0x00000000`.
			* Indicates no value is passed for this argument. See @ref SentinelValues.
			*/
			Undefined = 0x00000000,
			Uint16 = 0x00000001,
			Uint32 = 0x00000002,
			Force32 = 0x7FFFFFFF
		}

		public enum WGPULoadOp : c_uint {
			/**
			* `0x00000000`.
			* Indicates no value is passed for this argument. See @ref SentinelValues.
			*/
			Undefined = 0x00000000,
			Load = 0x00000001,
			Clear = 0x00000002,
			Force32 = 0x7FFFFFFF
		}

		public enum WGPUMapAsyncStatus : c_uint {
			Success = 0x00000001,
			InstanceDropped = 0x00000002,
			Error = 0x00000003,
			Aborted = 0x00000004,
			Unknown = 0x00000005,
			Force32 = 0x7FFFFFFF
		}

		public enum WGPUMipmapFilterMode : c_uint {
			/**
			* `0x00000000`.
			* Indicates no value is passed for this argument. See @ref SentinelValues.
			*/
			Undefined = 0x00000000,
			Nearest = 0x00000001,
			Linear = 0x00000002,
			Force32 = 0x7FFFFFFF
		}

		public enum WGPUOptionalBool : c_uint {
			False = 0x00000000,
			True = 0x00000001,
			Undefined = 0x00000002,
			Force32 = 0x7FFFFFFF
		}

		public enum WGPUPopErrorScopeStatus : c_uint {
			/**
			* `0x00000001`.
			* The error scope stack was successfully popped and a result was reported.
			*/
			Success = 0x00000001,
			InstanceDropped = 0x00000002,
			/**
			* `0x00000003`.
			* The error scope stack could not be popped, because it was empty.
			*/
			EmptyStack = 0x00000003,
			Force32 = 0x7FFFFFFF
		}

		public enum WGPUPowerPreference : c_uint {
			/**
			* `0x00000000`.
			* No preference. (See also @ref SentinelValues.)
			*/
			Undefined = 0x00000000,
			LowPower = 0x00000001,
			HighPerformance = 0x00000002,
			Force32 = 0x7FFFFFFF
		}

		/**
		* Describes when and in which order frames are presented on the screen when `::wgpuSurfacePresent` is called.
		*/
		public enum WGPUPresentMode : c_uint {
			/**
			* `0x00000000`.
			* Present mode is not specified. Use the default.
			*/
			Undefined = 0x00000000,
			/**
			* `0x00000001`.
			* The presentation of the image to the user waits for the next vertical blanking period to update in a first-in, first-out manner.
			* Tearing cannot be observed and frame-loop will be limited to the display's refresh rate.
			* This is the only mode that's always available.
			*/
			Fifo = 0x00000001,
			/**
			* `0x00000002`.
			* The presentation of the image to the user tries to wait for the next vertical blanking period but may decide to not wait if a frame is presented late.
			* Tearing can sometimes be observed but late-frame don't produce a full-frame stutter in the presentation.
			* This is still a first-in, first-out mechanism so a frame-loop will be limited to the display's refresh rate.
			*/
			FifoRelaxed = 0x00000002,
			/**
			* `0x00000003`.
			* The presentation of the image to the user is updated immediately without waiting for a vertical blank.
			* Tearing can be observed but latency is minimized.
			*/
			Immediate = 0x00000003,
			/**
			* `0x00000004`.
			* The presentation of the image to the user waits for the next vertical blanking period to update to the latest provided image.
			* Tearing cannot be observed and a frame-loop is not limited to the display's refresh rate.
			*/
			Mailbox = 0x00000004,
			Force32 = 0x7FFFFFFF
		}

		public enum WGPUPrimitiveTopology : c_uint {
			/**
			* `0x00000000`.
			* Indicates no value is passed for this argument. See @ref SentinelValues.
			*/
			Undefined = 0x00000000,
			PointList = 0x00000001,
			LineList = 0x00000002,
			LineStrip = 0x00000003,
			TriangleList = 0x00000004,
			TriangleStrip = 0x00000005,
			Force32 = 0x7FFFFFFF
		}

		public enum WGPUQueryType : c_uint {
			Occlusion = 0x00000001,
			Timestamp = 0x00000002,
			Force32 = 0x7FFFFFFF
		}

		public enum WGPUQueueWorkDoneStatus : c_uint {
			Success = 0x00000001,
			InstanceDropped = 0x00000002,
			Error = 0x00000003,
			Unknown = 0x00000004,
			Force32 = 0x7FFFFFFF
		}

		public enum WGPURequestAdapterStatus : c_uint {
			Success = 0x00000001,
			InstanceDropped = 0x00000002,
			Unavailable = 0x00000003,
			Error = 0x00000004,
			Unknown = 0x00000005,
			Force32 = 0x7FFFFFFF
		}

		public enum WGPURequestDeviceStatus : c_uint {
			Success = 0x00000001,
			InstanceDropped = 0x00000002,
			Error = 0x00000003,
			Unknown = 0x00000004,
			Force32 = 0x7FFFFFFF
		}

		public enum WGPUSType : c_uint {
			ShaderSourceSPIRV = 0x00000001,
			ShaderSourceWGSL = 0x00000002,
			RenderPassMaxDrawCount = 0x00000003,
			SurfaceSourceMetalLayer = 0x00000004,
			SurfaceSourceWindowsHWND = 0x00000005,
			SurfaceSourceXlibWindow = 0x00000006,
			SurfaceSourceWaylandSurface = 0x00000007,
			SurfaceSourceAndroidNativeWindow = 0x00000008,
			SurfaceSourceXCBWindow = 0x00000009,
			Force32 = 0x7FFFFFFF
		}

		public enum WGPUSamplerBindingType : c_uint {
			/**
			* `0x00000000`.
			* Indicates that this @ref WGPUSamplerBindingLayout member of
			* its parent @ref WGPUBindGroupLayoutEntry is not used.
			* (See also @ref SentinelValues.)
			*/
			BindingNotUsed = 0x00000000,
			/**
			* `0x00000001`.
			* Indicates no value is passed for this argument. See @ref SentinelValues.
			*/
			Undefined = 0x00000001,
			Filtering = 0x00000002,
			NonFiltering = 0x00000003,
			Comparison = 0x00000004,
			Force32 = 0x7FFFFFFF
		}

		/**
		* Status code returned (synchronously) from many operations. Generally
		* indicates an invalid input like an unknown enum value or @ref OutStructChainError.
		* Read the function's documentation for specific error conditions.
		*/
		public enum WGPUStatus : c_uint {
			Success = 0x00000001,
			Error = 0x00000002,
			Force32 = 0x7FFFFFFF
		}

		public enum WGPUStencilOperation : c_uint {
			/**
			* `0x00000000`.
			* Indicates no value is passed for this argument. See @ref SentinelValues.
			*/
			Undefined = 0x00000000,
			Keep = 0x00000001,
			Zero = 0x00000002,
			Replace = 0x00000003,
			Invert = 0x00000004,
			IncrementClamp = 0x00000005,
			DecrementClamp = 0x00000006,
			IncrementWrap = 0x00000007,
			DecrementWrap = 0x00000008,
			Force32 = 0x7FFFFFFF
		}

		public enum WGPUStorageTextureAccess : c_uint {
			/**
			* `0x00000000`.
			* Indicates that this @ref WGPUStorageTextureBindingLayout member of
			* its parent @ref WGPUBindGroupLayoutEntry is not used.
			* (See also @ref SentinelValues.)
			*/
			BindingNotUsed = 0x00000000,
			/**
			* `0x00000001`.
			* Indicates no value is passed for this argument. See @ref SentinelValues.
			*/
			Undefined = 0x00000001,
			WriteOnly = 0x00000002,
			ReadOnly = 0x00000003,
			ReadWrite = 0x00000004,
			Force32 = 0x7FFFFFFF
		}

		public enum WGPUStoreOp : c_uint {
			/**
			* `0x00000000`.
			* Indicates no value is passed for this argument. See @ref SentinelValues.
			*/
			Undefined = 0x00000000,
			Store = 0x00000001,
			Discard = 0x00000002,
			Force32 = 0x7FFFFFFF
		}

		/**
		* The status enum for `::wgpuSurfaceGetCurrentTexture`.
		*/
		public enum WGPUSurfaceGetCurrentTextureStatus : c_uint {
			/**
			* `0x00000001`.
			* Yay! Everything is good and we can render this frame.
			*/
			SuccessOptimal = 0x00000001,
			/**
			* `0x00000002`.
			* Still OK - the surface can present the frame, but in a suboptimal way. The surface may need reconfiguration.
			*/
			SuccessSuboptimal = 0x00000002,
			/**
			* `0x00000003`.
			* Some operation timed out while trying to acquire the frame.
			*/
			Timeout = 0x00000003,
			/**
			* `0x00000004`.
			* The surface is too different to be used, compared to when it was originally created.
			*/
			Outdated = 0x00000004,
			/**
			* `0x00000005`.
			* The connection to whatever owns the surface was lost.
			*/
			Lost = 0x00000005,
			/**
			* `0x00000006`.
			* The system ran out of memory.
			*/
			OutOfMemory = 0x00000006,
			/**
			* `0x00000007`.
			* The @ref WGPUDevice configured on the @ref WGPUSurface was lost.
			*/
			DeviceLost = 0x00000007,
			/**
			* `0x00000008`.
			* The surface is not configured, or there was an @ref OutStructChainError.
			*/
			Error = 0x00000008,
			Force32 = 0x7FFFFFFF
		}

		public enum WGPUTextureAspect : c_uint {
			/**
			* `0x00000000`.
			* Indicates no value is passed for this argument. See @ref SentinelValues.
			*/
			Undefined = 0x00000000,
			All = 0x00000001,
			StencilOnly = 0x00000002,
			DepthOnly = 0x00000003,
			Force32 = 0x7FFFFFFF
		}

		public enum WGPUTextureDimension : c_uint {
			/**
			* `0x00000000`.
			* Indicates no value is passed for this argument. See @ref SentinelValues.
			*/
			Undefined = 0x00000000,
			_1D = 0x00000001,
			_2D = 0x00000002,
			_3D = 0x00000003,
			Force32 = 0x7FFFFFFF
		}

		public enum WGPUTextureFormat : c_uint {
			/**
			* `0x00000000`.
			* Indicates no value is passed for this argument. See @ref SentinelValues.
			*/
			Undefined = 0x00000000,
			R8Unorm = 0x00000001,
			R8Snorm = 0x00000002,
			R8Uint = 0x00000003,
			R8Sint = 0x00000004,
			R16Uint = 0x00000005,
			R16Sint = 0x00000006,
			R16Float = 0x00000007,
			RG8Unorm = 0x00000008,
			RG8Snorm = 0x00000009,
			RG8Uint = 0x0000000A,
			RG8Sint = 0x0000000B,
			R32Float = 0x0000000C,
			R32Uint = 0x0000000D,
			R32Sint = 0x0000000E,
			RG16Uint = 0x0000000F,
			RG16Sint = 0x00000010,
			RG16Float = 0x00000011,
			RGBA8Unorm = 0x00000012,
			RGBA8UnormSrgb = 0x00000013,
			RGBA8Snorm = 0x00000014,
			RGBA8Uint = 0x00000015,
			RGBA8Sint = 0x00000016,
			BGRA8Unorm = 0x00000017,
			BGRA8UnormSrgb = 0x00000018,
			RGB10A2Uint = 0x00000019,
			RGB10A2Unorm = 0x0000001A,
			RG11B10Ufloat = 0x0000001B,
			RGB9E5Ufloat = 0x0000001C,
			RG32Float = 0x0000001D,
			RG32Uint = 0x0000001E,
			RG32Sint = 0x0000001F,
			RGBA16Uint = 0x00000020,
			RGBA16Sint = 0x00000021,
			RGBA16Float = 0x00000022,
			RGBA32Float = 0x00000023,
			RGBA32Uint = 0x00000024,
			RGBA32Sint = 0x00000025,
			Stencil8 = 0x00000026,
			Depth16Unorm = 0x00000027,
			Depth24Plus = 0x00000028,
			Depth24PlusStencil8 = 0x00000029,
			Depth32Float = 0x0000002A,
			Depth32FloatStencil8 = 0x0000002B,
			BC1RGBAUnorm = 0x0000002C,
			BC1RGBAUnormSrgb = 0x0000002D,
			BC2RGBAUnorm = 0x0000002E,
			BC2RGBAUnormSrgb = 0x0000002F,
			BC3RGBAUnorm = 0x00000030,
			BC3RGBAUnormSrgb = 0x00000031,
			BC4RUnorm = 0x00000032,
			BC4RSnorm = 0x00000033,
			BC5RGUnorm = 0x00000034,
			BC5RGSnorm = 0x00000035,
			BC6HRGBUfloat = 0x00000036,
			BC6HRGBFloat = 0x00000037,
			BC7RGBAUnorm = 0x00000038,
			BC7RGBAUnormSrgb = 0x00000039,
			ETC2RGB8Unorm = 0x0000003A,
			ETC2RGB8UnormSrgb = 0x0000003B,
			ETC2RGB8A1Unorm = 0x0000003C,
			ETC2RGB8A1UnormSrgb = 0x0000003D,
			ETC2RGBA8Unorm = 0x0000003E,
			ETC2RGBA8UnormSrgb = 0x0000003F,
			EACR11Unorm = 0x00000040,
			EACR11Snorm = 0x00000041,
			EACRG11Unorm = 0x00000042,
			EACRG11Snorm = 0x00000043,
			ASTC4x4Unorm = 0x00000044,
			ASTC4x4UnormSrgb = 0x00000045,
			ASTC5x4Unorm = 0x00000046,
			ASTC5x4UnormSrgb = 0x00000047,
			ASTC5x5Unorm = 0x00000048,
			ASTC5x5UnormSrgb = 0x00000049,
			ASTC6x5Unorm = 0x0000004A,
			ASTC6x5UnormSrgb = 0x0000004B,
			ASTC6x6Unorm = 0x0000004C,
			ASTC6x6UnormSrgb = 0x0000004D,
			ASTC8x5Unorm = 0x0000004E,
			ASTC8x5UnormSrgb = 0x0000004F,
			ASTC8x6Unorm = 0x00000050,
			ASTC8x6UnormSrgb = 0x00000051,
			ASTC8x8Unorm = 0x00000052,
			ASTC8x8UnormSrgb = 0x00000053,
			ASTC10x5Unorm = 0x00000054,
			ASTC10x5UnormSrgb = 0x00000055,
			ASTC10x6Unorm = 0x00000056,
			ASTC10x6UnormSrgb = 0x00000057,
			ASTC10x8Unorm = 0x00000058,
			ASTC10x8UnormSrgb = 0x00000059,
			ASTC10x10Unorm = 0x0000005A,
			ASTC10x10UnormSrgb = 0x0000005B,
			ASTC12x10Unorm = 0x0000005C,
			ASTC12x10UnormSrgb = 0x0000005D,
			ASTC12x12Unorm = 0x0000005E,
			ASTC12x12UnormSrgb = 0x0000005F,
			Force32 = 0x7FFFFFFF
		}

		public enum WGPUTextureSampleType : c_uint {
			/**
			* `0x00000000`.
			* Indicates that this @ref WGPUTextureBindingLayout member of
			* its parent @ref WGPUBindGroupLayoutEntry is not used.
			* (See also @ref SentinelValues.)
			*/
			BindingNotUsed = 0x00000000,
			/**
			* `0x00000001`.
			* Indicates no value is passed for this argument. See @ref SentinelValues.
			*/
			Undefined = 0x00000001,
			Float = 0x00000002,
			UnfilterableFloat = 0x00000003,
			Depth = 0x00000004,
			Sint = 0x00000005,
			Uint = 0x00000006,
			Force32 = 0x7FFFFFFF
		}

		public enum WGPUTextureViewDimension : c_uint {
			/**
			* `0x00000000`.
			* Indicates no value is passed for this argument. See @ref SentinelValues.
			*/
			Undefined = 0x00000000,
			_1D = 0x00000001,
			_2D = 0x00000002,
			_2DArray = 0x00000003,
			Cube = 0x00000004,
			CubeArray = 0x00000005,
			_3D = 0x00000006,
			Force32 = 0x7FFFFFFF
		}

		public enum WGPUVertexFormat : c_uint {
			Uint8 = 0x00000001,
			Uint8x2 = 0x00000002,
			Uint8x4 = 0x00000003,
			Sint8 = 0x00000004,
			Sint8x2 = 0x00000005,
			Sint8x4 = 0x00000006,
			Unorm8 = 0x00000007,
			Unorm8x2 = 0x00000008,
			Unorm8x4 = 0x00000009,
			Snorm8 = 0x0000000A,
			Snorm8x2 = 0x0000000B,
			Snorm8x4 = 0x0000000C,
			Uint16 = 0x0000000D,
			Uint16x2 = 0x0000000E,
			Uint16x4 = 0x0000000F,
			Sint16 = 0x00000010,
			Sint16x2 = 0x00000011,
			Sint16x4 = 0x00000012,
			Unorm16 = 0x00000013,
			Unorm16x2 = 0x00000014,
			Unorm16x4 = 0x00000015,
			Snorm16 = 0x00000016,
			Snorm16x2 = 0x00000017,
			Snorm16x4 = 0x00000018,
			Float16 = 0x00000019,
			Float16x2 = 0x0000001A,
			Float16x4 = 0x0000001B,
			Float32 = 0x0000001C,
			Float32x2 = 0x0000001D,
			Float32x3 = 0x0000001E,
			Float32x4 = 0x0000001F,
			Uint32 = 0x00000020,
			Uint32x2 = 0x00000021,
			Uint32x3 = 0x00000022,
			Uint32x4 = 0x00000023,
			Sint32 = 0x00000024,
			Sint32x2 = 0x00000025,
			Sint32x3 = 0x00000026,
			Sint32x4 = 0x00000027,
			Unorm10_10_10_2 = 0x00000028,
			Unorm8x4BGRA = 0x00000029,
			Force32 = 0x7FFFFFFF
		}

		public enum WGPUVertexStepMode : c_uint {
			/**
			* `0x00000000`.
			* This @ref WGPUVertexBufferLayout is a "hole" in the @ref WGPUVertexState `buffers` array.
			* (See also @ref SentinelValues.)
			*/
			VertexBufferNotUsed = 0x00000000,
			/**
			* `0x00000001`.
			* Indicates no value is passed for this argument. See @ref SentinelValues.
			*/
			Undefined = 0x00000001,
			Vertex = 0x00000002,
			Instance = 0x00000003,
			Force32 = 0x7FFFFFFF
		}

		public enum WGPUWGSLLanguageFeatureName : c_uint {
			ReadonlyAndReadwriteStorageTextures = 0x00000001,
			Packed4x8IntegerDotProduct = 0x00000002,
			UnrestrictedPointerParameters = 0x00000003,
			PointerCompositeAccess = 0x00000004,
			Force32 = 0x7FFFFFFF
		}

		/**
		* Status returned from a call to ::wgpuInstanceWaitAny.
		*/
		public enum WGPUWaitStatus : c_uint {
			/**
			* `0x00000001`.
			* At least one WGPUFuture completed successfully.
			*/
			Success = 0x00000001,
			/**
			* `0x00000002`.
			* No WGPUFutures completed within the timeout.
			*/
			TimedOut = 0x00000002,
			/**
			* `0x00000003`.
			* A @ref Timed-Wait was performed when WGPUInstanceFeatures::timedWaitAnyEnable is false.
			*/
			UnsupportedTimeout = 0x00000003,
			/**
			* `0x00000004`.
			* The number of futures waited on in a @ref Timed-Wait is greater than the supported WGPUInstanceFeatures::timedWaitAnyMaxCount.
			*/
			UnsupportedCount = 0x00000004,
			/**
			* `0x00000005`.
			* An invalid wait was performed with @ref Mixed-Sources.
			*/
			UnsupportedMixedSources = 0x00000005,
			Force32 = 0x7FFFFFFF
		}


		/**
		* \defgroup Bitflags
		* \brief Type and constant definitions for bitflag types.
		*/
		public enum WGPUBufferUsage : c_ulong {
			None = 0x0000000000000000,
			MapRead = 0x0000000000000001,
			MapWrite = 0x0000000000000002,
			CopySrc = 0x0000000000000004,
			CopyDst = 0x0000000000000008,
			Index = 0x0000000000000010,
			Vertex = 0x0000000000000020,
			Uniform = 0x0000000000000040,
			Storage = 0x0000000000000080,
			Indirect = 0x0000000000000100,
			QueryResolve = 0x0000000000000200
		}
		public enum WGPUColorWriteMask : c_ulong {
			None = 0x0000000000000000,
			Red = 0x0000000000000001,
			Green = 0x0000000000000002,
			Blue = 0x0000000000000004,
			Alpha = 0x0000000000000008,
			All = 0x000000000000000F /* Red | Green | Blue | Alpha */
		}

		public enum WGPUMapMode : c_ulong {
			None = 0x0000000000000000,
			Read = 0x0000000000000001,
			Write = 0x0000000000000002
		}

		public enum WGPUShaderStage : c_ulong {
			None = 0x0000000000000000,
			Vertex = 0x0000000000000001,
			Fragment = 0x0000000000000002,
			Compute = 0x0000000000000004
		}

		public enum WGPUTextureUsage : c_ulong {
			None = 0x0000000000000000,
			CopySrc = 0x0000000000000001,
			CopyDst = 0x0000000000000002,
			TextureBinding = 0x0000000000000004,
			StorageBinding = 0x0000000000000008,
			RenderAttachment = 0x0000000000000010
		}

		public enum WGPUNativeSType : c_uint {
			// Start at 0003 since that's allocated range for wgpu-native
			DeviceExtras = 0x00030001,
			NativeLimits = 0x00030002,
			PipelineLayoutExtras = 0x00030003,
			ShaderModuleGLSLDescriptor = 0x00030004,
			InstanceExtras = 0x00030006,
			BindGroupEntryExtras = 0x00030007,
			BindGroupLayoutEntryExtras = 0x00030008,
			QuerySetDescriptorExtras = 0x00030009,
			SurfaceConfigurationExtras = 0x0003000A,
			Force32 = 0x7FFFFFFF
		}

		public enum WGPUNativeFeature : c_uint {
			PushConstants = 0x00030001,
			TextureAdapterSpecificFormatFeatures = 0x00030002,
			MultiDrawIndirect = 0x00030003,
			MultiDrawIndirectCount = 0x00030004,
			VertexWritableStorage = 0x00030005,
			TextureBindingArray = 0x00030006,
			SampledTextureAndStorageBufferArrayNonUniformIndexing = 0x00030007,
			PipelineStatisticsQuery = 0x00030008,
			StorageResourceBindingArray = 0x00030009,
			PartiallyBoundBindingArray = 0x0003000A,
			TextureFormat16bitNorm = 0x0003000B,
			TextureCompressionAstcHdr = 0x0003000C,
			MappablePrimaryBuffers = 0x0003000E,
			BufferBindingArray = 0x0003000F,
			UniformBufferAndStorageTextureArrayNonUniformIndexing = 0x00030010,
			// TODO: requires wgpu.h api change
			// AddressModeClampToZero = 0x00030011,
			// AddressModeClampToBorder = 0x00030012,
			// PolygonModeLine = 0x00030013,
			// PolygonModePoint = 0x00030014,
			// ConservativeRasterization = 0x00030015,
			// ClearTexture = 0x00030016,
			SpirvShaderPassthrough = 0x00030017,
			// Multiview = 0x00030018,
			VertexAttribute64bit = 0x00030019,
			TextureFormatNv12 = 0x0003001A,
			RayTracingAccelerationStructure = 0x0003001B,
			RayQuery = 0x0003001C,
			ShaderF64 = 0x0003001D,
			ShaderI16 = 0x0003001E,
			ShaderPrimitiveIndex = 0x0003001F,
			ShaderEarlyDepthTest = 0x00030020,
			Subgroup = 0x00030021,
			SubgroupVertex = 0x00030022,
			SubgroupBarrier = 0x00030023,
			TimestampQueryInsideEncoders = 0x00030024,
			TimestampQueryInsidePasses = 0x00030025,
			Force32 = 0x7FFFFFFF
		}

		public enum WGPULogLevel : c_uint {
			Off = 0x00000000,
			Error = 0x00000001,
			Warn = 0x00000002,
			Info = 0x00000003,
			Debug = 0x00000004,
			Trace = 0x00000005,
			Force32 = 0x7FFFFFFF
		}

		public enum WGPUInstanceBackend : c_uint {
			All = 0x00000000,
			Vulkan = 1 << 0,
			GL = 1 << 1,
			Metal = 1 << 2,
			DX12 = 1 << 3,
			DX11 = 1 << 4,
			BrowserWebGPU = 1 << 5,
			// Vulkan, Metal, DX12 and BrowserWebGPU
			Primary = (1 << 0) | (1 << 2) | (1 << 3) | (1 << 5),
			// GL and DX11
			Secondary = (1 << 1) | (1 << 4),
			Force32 = 0x7FFFFFFF
		}

		public enum WGPUInstanceFlag : c_uint {
			Default = 0x00000000,
			Debug = 1 << 0,
			Validation = 1 << 1,
			DiscardHalLabels = 1 << 2,
			Force32 = 0x7FFFFFFF
		}

		public enum WGPUDx12Compiler : c_uint {
			Undefined = 0x00000000,
			Fxc = 0x00000001,
			Dxc = 0x00000002,
			Force32 = 0x7FFFFFFF
		}

		public enum WGPUGles3MinorVersion : c_uint {
			Automatic = 0x00000000,
			Version0 = 0x00000001,
			Version1 = 0x00000002,
			Version2 = 0x00000003,
			Force32 = 0x7FFFFFFF
		}

		public enum WGPUPipelineStatisticName : c_uint {
			VertexShaderInvocations = 0x00000000,
			ClipperInvocations = 0x00000001,
			ClipperPrimitivesOut = 0x00000002,
			FragmentShaderInvocations = 0x00000003,
			ComputeShaderInvocations = 0x00000004,
			Force32 = 0x7FFFFFFF
		}

		public enum WGPUNativeQueryType : c_uint {
			PipelineStatistics = 0x00030000,
			Force32 = 0x7FFFFFFF
		}

		public enum WGPUNativeTextureFormat : c_uint {
			// From Features::TEXTURE_FORMAT_16BIT_NORM
			R16Unorm = 0x00030001,
			R16Snorm = 0x00030002,
			Rg16Unorm = 0x00030003,
			Rg16Snorm = 0x00030004,
			Rgba16Unorm = 0x00030005,
			Rgba16Snorm = 0x00030006,
			// From Features::TEXTURE_FORMAT_NV12
			NV12 = 0x00030007
		}

		/**
		* Nullable value defining a pointer+length view into a UTF-8 encoded string.
		*
		* Values passed into the API may use the special length value @ref WGPU_STRLEN
		* to indicate a null-terminated string.
		* Non-null values passed out of the API (for example as callback arguments)
		* always provide an explicit length and **may or may not be null-terminated**.
		*
		* Some inputs to the API accept null values. Those which do not accept null
		* values "default" to the empty string when null values are passed.
		*
		* Values are encoded as follows:
		* - `{NULL, WGPU_STRLEN}`: the null value.
		* - `{non_null_pointer, WGPU_STRLEN}`: a null-terminated string view.
		* - `{any, 0}`: the empty string.
		* - `{NULL, non_zero_length}`: not allowed (null dereference).
		* - `{non_null_pointer, non_zero_length}`: an explictly-sized string view with
		*   size `non_zero_length` (in bytes).
		*
		* For info on how this is used in various places, see \ref Strings.
		*/
		[CRepr]
		public struct WGPUStringView {
			public c_char* data;
			public c_size length;

			public this() {
				this = default;
			}

			public this(StringView stringView) {
				this.data = stringView.Ptr;
				this.length = (uint)stringView.Length;
			}
		}

		/**
		* \defgroup ChainedStructures Chained Structures
		* \brief Structures used to extend descriptors.
		*/
		[CRepr]
		public struct WGPUChainedStruct {
			public WGPUChainedStruct* next;
			public WGPUSType sType;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUChainedStructOut {
			public WGPUChainedStructOut* next;
			public WGPUSType sType;

			public this() {
				this = default;
			}
		}


		/**
		* \defgroup Structures
		* \brief Descriptors and other transparent structures.
		*/

		/**
		* \defgroup WGPUCallbackInfo
		* \brief Callback info structures that are used in asynchronous functions.
		*/
		[CRepr]
		public struct WGPUBufferMapCallbackInfo {
			public WGPUChainedStruct* nextInChain;
			public WGPUCallbackMode mode;
			public WGPUBufferMapCallback callback;
			public void* userdata1;
			public void* userdata2;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUCompilationInfoCallbackInfo {
			public WGPUChainedStruct* nextInChain;
			public WGPUCallbackMode mode;
			public WGPUCompilationInfoCallback callback;
			public void* userdata1;
			public void* userdata2;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUCreateComputePipelineAsyncCallbackInfo {
			public WGPUChainedStruct* nextInChain;
			public WGPUCallbackMode mode;
			public WGPUCreateComputePipelineAsyncCallback callback;
			public void* userdata1;
			public void* userdata2;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUCreateRenderPipelineAsyncCallbackInfo {
			public WGPUChainedStruct* nextInChain;
			public WGPUCallbackMode mode;
			public WGPUCreateRenderPipelineAsyncCallback callback;
			public void* userdata1;
			public void* userdata2;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUDeviceLostCallbackInfo {
			public WGPUChainedStruct* nextInChain;
			public WGPUCallbackMode mode;
			public WGPUDeviceLostCallback callback;
			public void* userdata1;
			public void* userdata2;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUPopErrorScopeCallbackInfo {
			public WGPUChainedStruct* nextInChain;
			public WGPUCallbackMode mode;
			public WGPUPopErrorScopeCallback callback;
			public void* userdata1;
			public void* userdata2;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUQueueWorkDoneCallbackInfo {
			public WGPUChainedStruct* nextInChain;
			public WGPUCallbackMode mode;
			public WGPUQueueWorkDoneCallback callback;
			public void* userdata1;
			public void* userdata2;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPURequestAdapterCallbackInfo {
			public WGPUChainedStruct* nextInChain;
			public WGPUCallbackMode mode;
			public WGPURequestAdapterCallback callback;
			public void* userdata1;
			public void* userdata2;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPURequestDeviceCallbackInfo {
			public WGPUChainedStruct* nextInChain;
			public WGPUCallbackMode mode;
			public WGPURequestDeviceCallback callback;
			public void* userdata1;
			public void* userdata2;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUUncapturedErrorCallbackInfo {
			public WGPUChainedStruct* nextInChain;
			public WGPUUncapturedErrorCallback callback;
			public void* userdata1;
			public void* userdata2;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUAdapterInfo {
			public WGPUChainedStructOut* nextInChain;
			/**
			* This is an \ref OutputString.
			*/
			public WGPUStringView vendor;
			/**
			* This is an \ref OutputString.
			*/
			public WGPUStringView architecture;
			/**
			* This is an \ref OutputString.
			*/
			public WGPUStringView device;
			/**
			* This is an \ref OutputString.
			*/
			public WGPUStringView description;
			public WGPUBackendType backendType;
			public WGPUAdapterType adapterType;
			public uint32 vendorID;
			public uint32 deviceID;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUBindGroupEntry {
			public WGPUChainedStruct* nextInChain;
			public uint32 binding;
			public WGPUBuffer buffer;
			public uint64 offset;
			public uint64 size;
			public WGPUSampler sampler;
			public WGPUTextureView textureView;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUBlendComponent {
			public WGPUBlendOperation operation;
			public WGPUBlendFactor srcFactor;
			public WGPUBlendFactor dstFactor;

			public this() {
				this = default;
			}

			public this(WGPUBlendOperation operation, WGPUBlendFactor srcFactor, WGPUBlendFactor dstFactor) {
				this.operation = operation;
				this.srcFactor = srcFactor;
				this.dstFactor = dstFactor;
			}
		}

		[CRepr]
		public struct WGPUBufferBindingLayout {
			public WGPUChainedStruct* nextInChain;
			public WGPUBufferBindingType type;
			public WGPUBool hasDynamicOffset;
			public uint64 minBindingSize;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUBufferDescriptor {
			public WGPUChainedStruct* nextInChain;
			/**
			* This is a \ref NonNullInputString.
			*/
			public WGPUStringView label;
			public WGPUBufferUsage usage;
			public uint64 size;
			public WGPUBool mappedAtCreation;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUColor {
			public double r;
			public double g;
			public double b;
			public double a;

			public this() {
				this = default;
			}

			public this(double r, double g, double b, double a) {
				this.r = r;
				this.g = g;
				this.b = b;
				this.a = a;
			}
		}

		[CRepr]
		public struct WGPUCommandBufferDescriptor {
			public WGPUChainedStruct* nextInChain;
			/**
			* This is a \ref NonNullInputString.
			*/
			public WGPUStringView label;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUCommandEncoderDescriptor {
			public WGPUChainedStruct* nextInChain;
			/**
			* This is a \ref NonNullInputString.
			*/
			public WGPUStringView label;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUCompilationMessage {
			public WGPUChainedStruct* nextInChain;
			/**
			* A @ref LocalizableHumanReadableMessageString.
			*
			* This is an \ref OutputString.
			*/
			public WGPUStringView message;
			/**
			* Severity level of the message.
			*/
			public WGPUCompilationMessageType type;
			/**
			* Line number where the message is attached, starting at 1.
			*/
			public uint64 lineNum;
			/**
			* Offset in UTF-8 code units (bytes) from the beginning of the line, starting at 1.
			*/
			public uint64 linePos;
			/**
			* Offset in UTF-8 code units (bytes) from the beginning of the shader code, starting at 0.
			*/
			public uint64 offset;
			/**
			* Length in UTF-8 code units (bytes) of the span the message corresponds to.
			*/
			public uint64 length;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUComputePassTimestampWrites {
			public WGPUQuerySet querySet;
			public uint32 beginningOfPassWriteIndex;
			public uint32 endOfPassWriteIndex;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUConstantEntry {
			public WGPUChainedStruct* nextInChain;
			/**
			* This is a \ref NonNullInputString.
			*/
			public WGPUStringView key;
			public double value;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUExtent3D {
			public uint32 width;
			public uint32 height;
			public uint32 depthOrArrayLayers;

			public this() {
				this = default;
			}

			public this(uint32 width, uint32 height, uint32 depthOrArrayLayers) {
				this.width = width;
				this.height = height;
				this.depthOrArrayLayers = depthOrArrayLayers;
			}
		}

		/**
		* Opaque handle to an asynchronous operation. See @ref Asynchronous-Operations for more information.
		*/
		[CRepr]
		public struct WGPUFuture {
			/**
			* Opaque id of the @ref WGPUFuture
			*/
			public uint64 id;

			public this() {
				this = default;
			}
		}

		/**
		* Features enabled on the WGPUInstance
		*/
		[CRepr]
		public struct WGPUInstanceCapabilities {
			/** This struct chain is used as mutable in some places and immutable in others. */
			public WGPUChainedStructOut* nextInChain;
			/**
			* Enable use of ::wgpuInstanceWaitAny with `timeoutNS > 0`.
			*/
			public WGPUBool timedWaitAnyEnable;
			/**
			* The maximum number @ref WGPUFutureWaitInfo supported in a call to ::wgpuInstanceWaitAny with `timeoutNS > 0`.
			*/
			public c_size timedWaitAnyMaxCount;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPULimits {
			/** This struct chain is used as mutable in some places and immutable in others. */
			public WGPUChainedStructOut* nextInChain;
			public uint32 maxTextureDimension1D;
			public uint32 maxTextureDimension2D;
			public uint32 maxTextureDimension3D;
			public uint32 maxTextureArrayLayers;
			public uint32 maxBindGroups;
			public uint32 maxBindGroupsPlusVertexBuffers;
			public uint32 maxBindingsPerBindGroup;
			public uint32 maxDynamicUniformBuffersPerPipelineLayout;
			public uint32 maxDynamicStorageBuffersPerPipelineLayout;
			public uint32 maxSampledTexturesPerShaderStage;
			public uint32 maxSamplersPerShaderStage;
			public uint32 maxStorageBuffersPerShaderStage;
			public uint32 maxStorageTexturesPerShaderStage;
			public uint32 maxUniformBuffersPerShaderStage;
			public uint64 maxUniformBufferBindingSize;
			public uint64 maxStorageBufferBindingSize;
			public uint32 minUniformBufferOffsetAlignment;
			public uint32 minStorageBufferOffsetAlignment;
			public uint32 maxVertexBuffers;
			public uint64 maxBufferSize;
			public uint32 maxVertexAttributes;
			public uint32 maxVertexBufferArrayStride;
			public uint32 maxInterStageShaderVariables;
			public uint32 maxColorAttachments;
			public uint32 maxColorAttachmentBytesPerSample;
			public uint32 maxComputeWorkgroupStorageSize;
			public uint32 maxComputeInvocationsPerWorkgroup;
			public uint32 maxComputeWorkgroupSizeX;
			public uint32 maxComputeWorkgroupSizeY;
			public uint32 maxComputeWorkgroupSizeZ;
			public uint32 maxComputeWorkgroupsPerDimension;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUMultisampleState {
			public WGPUChainedStruct* nextInChain;
			public uint32 count;
			public uint32 mask;
			public WGPUBool alphaToCoverageEnabled;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUOrigin3D {
			public uint32 x;
			public uint32 y;
			public uint32 z;

			public this() {
				this = default;
			}

			public this(uint32 x, uint32 y, uint32 z) {
				this.x = x;
				this.y = y;
				this.z = z;
			}
		}

		[CRepr]
		public struct WGPUPipelineLayoutDescriptor {
			public WGPUChainedStruct* nextInChain;
			/**
			* This is a \ref NonNullInputString.
			*/
			public WGPUStringView label;
			public c_size bindGroupLayoutCount;
			public WGPUBindGroupLayout* bindGroupLayouts;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUPrimitiveState {
			public WGPUChainedStruct* nextInChain;
			public WGPUPrimitiveTopology topology;
			public WGPUIndexFormat stripIndexFormat;
			public WGPUFrontFace frontFace;
			public WGPUCullMode cullMode;
			public WGPUBool unclippedDepth;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUQuerySetDescriptor {
			public WGPUChainedStruct* nextInChain;
			/**
			* This is a \ref NonNullInputString.
			*/
			public WGPUStringView label;
			public WGPUQueryType type;
			public uint32 count;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUQueueDescriptor {
			public WGPUChainedStruct* nextInChain;
			/**
			* This is a \ref NonNullInputString.
			*/
			public WGPUStringView label;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPURenderBundleDescriptor {
			public WGPUChainedStruct* nextInChain;
			/**
			* This is a \ref NonNullInputString.
			*/
			public WGPUStringView label;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPURenderBundleEncoderDescriptor {
			public WGPUChainedStruct* nextInChain;
			/**
			* This is a \ref NonNullInputString.
			*/
			public WGPUStringView label;
			public c_size colorFormatCount;
			public WGPUTextureFormat* colorFormats;
			public WGPUTextureFormat depthStencilFormat;
			public uint32 sampleCount;
			public WGPUBool depthReadOnly;
			public WGPUBool stencilReadOnly;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPURenderPassDepthStencilAttachment {
			public WGPUTextureView view;
			public WGPULoadOp depthLoadOp;
			public WGPUStoreOp depthStoreOp;
			public float depthClearValue;
			public WGPUBool depthReadOnly;
			public WGPULoadOp stencilLoadOp;
			public WGPUStoreOp stencilStoreOp;
			public uint32 stencilClearValue;
			public WGPUBool stencilReadOnly;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPURenderPassMaxDrawCount {
			public WGPUChainedStruct chain;
			public uint64 maxDrawCount;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPURenderPassTimestampWrites {
			public WGPUQuerySet querySet;
			public uint32 beginningOfPassWriteIndex;
			public uint32 endOfPassWriteIndex;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPURequestAdapterOptions {
			public WGPUChainedStruct* nextInChain;
			/**
			* "Feature level" for the adapter request. If an adapter is returned, it must support the features and limits in the requested feature level.
			*
			* Implementations may ignore @ref WGPUFeatureLevel_Compatibility and provide @ref WGPUFeatureLevel_Core instead. @ref WGPUFeatureLevel_Core is the default in the JS API, but in C, this field is **required** (must not be undefined).
			*/
			public WGPUFeatureLevel featureLevel;
			public WGPUPowerPreference powerPreference;
			/**
			* If true, requires the adapter to be a "fallback" adapter as defined by the JS spec.
			* If this is not possible, the request returns null.
			*/
			public WGPUBool forceFallbackAdapter;
			/**
			* If set, requires the adapter to have a particular backend type.
			* If this is not possible, the request returns null.
			*/
			public WGPUBackendType backendType;
			/**
			* If set, requires the adapter to be able to output to a particular surface.
			* If this is not possible, the request returns null.
			*/
			public WGPUSurface compatibleSurface;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUSamplerBindingLayout {
			public WGPUChainedStruct* nextInChain;
			public WGPUSamplerBindingType type;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUSamplerDescriptor {
			public WGPUChainedStruct* nextInChain;
			/**
			* This is a \ref NonNullInputString.
			*/
			public WGPUStringView label;
			public WGPUAddressMode addressModeU;
			public WGPUAddressMode addressModeV;
			public WGPUAddressMode addressModeW;
			public WGPUFilterMode magFilter;
			public WGPUFilterMode minFilter;
			public WGPUMipmapFilterMode mipmapFilter;
			public float lodMinClamp;
			public float lodMaxClamp;
			public WGPUCompareFunction compare;
			public uint16 maxAnisotropy;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUShaderModuleDescriptor {
			public WGPUChainedStruct* nextInChain;
			/**
			* This is a \ref NonNullInputString.
			*/
			public WGPUStringView label;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUShaderSourceSPIRV {
			public WGPUChainedStruct chain;
			public uint32 codeSize;
			public uint32* code;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUShaderSourceWGSL {
			public WGPUChainedStruct chain;
			/**
			* This is a \ref NonNullInputString.
			*/
			public WGPUStringView code;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUStencilFaceState {
			public WGPUCompareFunction compare;
			public WGPUStencilOperation failOp;
			public WGPUStencilOperation depthFailOp;
			public WGPUStencilOperation passOp;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUStorageTextureBindingLayout {
			public WGPUChainedStruct* nextInChain;
			public WGPUStorageTextureAccess access;
			public WGPUTextureFormat format;
			public WGPUTextureViewDimension viewDimension;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUSupportedFeatures {
			public c_size featureCount;
			public WGPUFeatureName* features;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUSupportedWGSLLanguageFeatures {
			public c_size featureCount;
			public WGPUWGSLLanguageFeatureName* features;

			public this() {
				this = default;
			}
		}

		/**
		* Filled by `::wgpuSurfaceGetCapabilities` with what's supported for `::wgpuSurfaceConfigure` for a pair of @ref WGPUSurface and @ref WGPUAdapter.
		*/
		[CRepr]
		public struct WGPUSurfaceCapabilities {
			public WGPUChainedStructOut* nextInChain;
			/**
			* The bit set of supported @ref WGPUTextureUsage bits.
			* Guaranteed to contain @ref WGPUTextureUsage_RenderAttachment.
			*/
			public WGPUTextureUsage usages;
			/**
			* A list of supported @ref WGPUTextureFormat values, in order of preference.
			*/
			public c_size formatCount;
			public WGPUTextureFormat* formats;
			/**
			* A list of supported @ref WGPUPresentMode values.
			* Guaranteed to contain @ref WGPUPresentMode_Fifo.
			*/
			public c_size presentModeCount;
			public WGPUPresentMode* presentModes;
			/**
			* A list of supported @ref WGPUCompositeAlphaMode values.
			* @ref WGPUCompositeAlphaMode_Auto will be an alias for the first element and will never be present in this array.
			*/
			public c_size alphaModeCount;
			public WGPUCompositeAlphaMode* alphaModes;

			public this() {
				this = default;
			}
		}

		/**
		* Options to `::wgpuSurfaceConfigure` for defining how a @ref WGPUSurface will be rendered to and presented to the user.
		* See @ref Surface-Configuration for more details.
		*/
		[CRepr]
		public struct WGPUSurfaceConfiguration {
			public WGPUChainedStruct* nextInChain;
			/**
			* The @ref WGPUDevice to use to render to surface's textures.
			*/
			public WGPUDevice device;
			/**
			* The @ref WGPUTextureFormat of the surface's textures.
			*/
			public WGPUTextureFormat format;
			/**
			* The @ref WGPUTextureUsage of the surface's textures.
			*/
			public WGPUTextureUsage usage;
			/**
			* The width of the surface's textures.
			*/
			public uint32 width;
			/**
			* The height of the surface's textures.
			*/
			public uint32 height;
			/**
			* The additional @ref WGPUTextureFormat for @ref WGPUTextureView format reinterpretation of the surface's textures.
			*/
			public c_size viewFormatCount;
			public WGPUTextureFormat* viewFormats;
			/**
			* How the surface's frames will be composited on the screen.
			*/
			public WGPUCompositeAlphaMode alphaMode;
			/**
			* When and in which order the surface's frames will be shown on the screen. Defaults to @ref WGPUPresentMode_Fifo.
			*/
			public WGPUPresentMode presentMode;

			public this() {
				this = default;
			}
		}

		/**
		* The root descriptor for the creation of an @ref WGPUSurface with `::wgpuInstanceCreateSurface`.
		* It isn't sufficient by itself and must have one of the `WGPUSurfaceSource*` in its chain.
		* See @ref Surface-Creation for more details.
		*/
		[CRepr]
		public struct WGPUSurfaceDescriptor {
			public WGPUChainedStruct* nextInChain;
			/**
			* Label used to refer to the object.
			*
			* This is a \ref NonNullInputString.
			*/
			public WGPUStringView label;

			public this() {
				this = default;
			}
		}

		/**
		* Chained in @ref WGPUSurfaceDescriptor to make an @ref WGPUSurface wrapping an Android [`ANativeWindow`](https://developer.android.com/ndk/reference/group/a-native-window).
		*/
		[CRepr]
		public struct WGPUSurfaceSourceAndroidNativeWindow {
			public WGPUChainedStruct chain;
			/**
			* The pointer to the [`ANativeWindow`](https://developer.android.com/ndk/reference/group/a-native-window) that will be wrapped by the @ref WGPUSurface.
			*/
			public void* window;

			public this() {
				this = default;
			}
		}

		/**
		* Chained in @ref WGPUSurfaceDescriptor to make an @ref WGPUSurface wrapping a [`CAMetalLayer`](https://developer.apple.com/documentation/quartzcore/cametallayer?language=objc).
		*/
		[CRepr]
		public struct WGPUSurfaceSourceMetalLayer {
			public WGPUChainedStruct chain;
			/**
			* The pointer to the [`CAMetalLayer`](https://developer.apple.com/documentation/quartzcore/cametallayer?language=objc) that will be wrapped by the @ref WGPUSurface.
			*/
			public void* layer;

			public this() {
				this = default;
			}
		}

		/**
		* Chained in @ref WGPUSurfaceDescriptor to make an @ref WGPUSurface wrapping a [Wayland](https://wayland.freedesktop.org/) [`wl_surface`](https://wayland.freedesktop.org/docs/html/apa.html#protocol-spec-wl_surface).
		*/
		[CRepr]
		public struct WGPUSurfaceSourceWaylandSurface {
			public WGPUChainedStruct chain;
			/**
			* A [`wl_display`](https://wayland.freedesktop.org/docs/html/apa.html#protocol-spec-wl_display) for this Wayland instance.
			*/
			public void* display;
			/**
			* A [`wl_surface`](https://wayland.freedesktop.org/docs/html/apa.html#protocol-spec-wl_surface) that will be wrapped by the @ref WGPUSurface
			*/
			public void* surface;

			public this() {
				this = default;
			}
		}

		/**
		* Chained in @ref WGPUSurfaceDescriptor to make an @ref WGPUSurface wrapping a Windows [`HWND`](https://learn.microsoft.com/en-us/windows/apps/develop/ui-input/retrieve-hwnd).
		*/
		[CRepr]
		public struct WGPUSurfaceSourceWindowsHWND {
			public WGPUChainedStruct chain;
			/**
			* The [`HINSTANCE`](https://learn.microsoft.com/en-us/windows/win32/learnwin32/winmain--the-application-entry-point) for this application.
			* Most commonly `GetModuleHandle(nullptr)`.
			*/
			public void* hinstance;
			/**
			* The [`HWND`](https://learn.microsoft.com/en-us/windows/apps/develop/ui-input/retrieve-hwnd) that will be wrapped by the @ref WGPUSurface.
			*/
			public void* hwnd;

			public this() {
				this = default;
			}
		}

		/**
		* Chained in @ref WGPUSurfaceDescriptor to make an @ref WGPUSurface wrapping an [XCB](https://xcb.freedesktop.org/) `xcb_window_t`.
		*/
		[CRepr]
		public struct WGPUSurfaceSourceXCBWindow {
			public WGPUChainedStruct chain;
			/**
			* The `xcb_connection_t` for the connection to the X server.
			*/
			public void* connection;
			/**
			* The `xcb_window_t` for the window that will be wrapped by the @ref WGPUSurface.
			*/
			public uint32 window;

			public this() {
				this = default;
			}
		}

		/**
		* Chained in @ref WGPUSurfaceDescriptor to make an @ref WGPUSurface wrapping an [Xlib](https://www.x.org/releases/current/doc/libX11/libX11/libX11.html) `Window`.
		*/
		[CRepr]
		public struct WGPUSurfaceSourceXlibWindow {
			public WGPUChainedStruct chain;
			/**
			* A pointer to the [`Display`](https://www.x.org/releases/current/doc/libX11/libX11/libX11.html#Opening_the_Display) connected to the X server.
			*/
			public void* display;
			/**
			* The [`Window`](https://www.x.org/releases/current/doc/libX11/libX11/libX11.html#Creating_Windows) that will be wrapped by the @ref WGPUSurface.
			*/
			public uint64 window;

			public this() {
				this = default;
			}
		}

		/**
		* Queried each frame from a @ref WGPUSurface to get a @ref WGPUTexture to render to along with some metadata.
		* See @ref Surface-Presenting for more details.
		*/
		[CRepr]
		public struct WGPUSurfaceTexture {
			public WGPUChainedStructOut* nextInChain;
			/**
			* The @ref WGPUTexture representing the frame that will be shown on the surface.
			* It is @ref ReturnedWithOwnership from @ref wgpuSurfaceGetCurrentTexture.
			*/
			public WGPUTexture texture;
			/**
			* Whether the call to `::wgpuSurfaceGetCurrentTexture` succeeded and a hint as to why it might not have.
			*/
			public WGPUSurfaceGetCurrentTextureStatus status;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUTexelCopyBufferLayout {
			public uint64 offset;
			public uint32 bytesPerRow;
			public uint32 rowsPerImage;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUTextureBindingLayout {
			public WGPUChainedStruct* nextInChain;
			public WGPUTextureSampleType sampleType;
			public WGPUTextureViewDimension viewDimension;
			public WGPUBool multisampled;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUTextureViewDescriptor {
			public WGPUChainedStruct* nextInChain;
			/**
			* This is a \ref NonNullInputString.
			*/
			public WGPUStringView label;
			public WGPUTextureFormat format;
			public WGPUTextureViewDimension dimension;
			public uint32 baseMipLevel;
			public uint32 mipLevelCount;
			public uint32 baseArrayLayer;
			public uint32 arrayLayerCount;
			public WGPUTextureAspect aspect;
			public WGPUTextureUsage usage;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUVertexAttribute {
			public WGPUVertexFormat format;
			public uint64 offset;
			public uint32 shaderLocation;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUBindGroupDescriptor {
			public WGPUChainedStruct* nextInChain;
			/**
			* This is a \ref NonNullInputString.
			*/
			public WGPUStringView label;
			public WGPUBindGroupLayout layout;
			public c_size entryCount;
			public WGPUBindGroupEntry* entries;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUBindGroupLayoutEntry {
			public WGPUChainedStruct* nextInChain;
			public uint32 binding;
			public WGPUShaderStage visibility;
			public WGPUBufferBindingLayout buffer;
			public WGPUSamplerBindingLayout sampler;
			public WGPUTextureBindingLayout texture;
			public WGPUStorageTextureBindingLayout storageTexture;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUBlendState {
			public WGPUBlendComponent color;
			public WGPUBlendComponent alpha;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUCompilationInfo {
			public WGPUChainedStruct* nextInChain;
			public c_size messageCount;
			public WGPUCompilationMessage* messages;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUComputePassDescriptor {
			public WGPUChainedStruct* nextInChain;
			/**
			* This is a \ref NonNullInputString.
			*/
			public WGPUStringView label;
			public WGPUComputePassTimestampWrites* timestampWrites;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUDepthStencilState {
			public WGPUChainedStruct* nextInChain;
			public WGPUTextureFormat format;
			public WGPUOptionalBool depthWriteEnabled;
			public WGPUCompareFunction depthCompare;
			public WGPUStencilFaceState stencilFront;
			public WGPUStencilFaceState stencilBack;
			public uint32 stencilReadMask;
			public uint32 stencilWriteMask;
			public int32 depthBias;
			public float depthBiasSlopeScale;
			public float depthBiasClamp;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUDeviceDescriptor {
			public WGPUChainedStruct* nextInChain;
			/**
			* This is a \ref NonNullInputString.
			*/
			public WGPUStringView label;
			public c_size requiredFeatureCount;
			public WGPUFeatureName* requiredFeatures;
			public WGPULimits* requiredLimits;
			public WGPUQueueDescriptor defaultQueue;
			public WGPUDeviceLostCallbackInfo deviceLostCallbackInfo;
			public WGPUUncapturedErrorCallbackInfo uncapturedErrorCallbackInfo;

			public this() {
				this = default;
			}
		}

		/**
		* Struct holding a future to wait on, and a `completed` boolean flag.
		*/
		[CRepr]
		public struct WGPUFutureWaitInfo {
			/**
			* The future to wait on.
			*/
			public WGPUFuture future;
			/**
			* Whether or not the future completed.
			*/
			public WGPUBool completed;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUInstanceDescriptor {
			public WGPUChainedStruct* nextInChain;
			/**
			* Instance features to enable
			*/
			public WGPUInstanceCapabilities features;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUProgrammableStageDescriptor {
			public WGPUChainedStruct* nextInChain;
			public WGPUShaderModule module;
			/**
			* This is a \ref NullableInputString.
			*/
			public WGPUStringView entryPoint;
			public c_size constantCount;
			public WGPUConstantEntry* constants;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPURenderPassColorAttachment {
			public WGPUChainedStruct* nextInChain;
			public WGPUTextureView view;
			public uint32 depthSlice;
			public WGPUTextureView resolveTarget;
			public WGPULoadOp loadOp;
			public WGPUStoreOp storeOp;
			public WGPUColor clearValue;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUTexelCopyBufferInfo {
			public WGPUTexelCopyBufferLayout layout;
			public WGPUBuffer buffer;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUTexelCopyTextureInfo {
			public WGPUTexture texture;
			public uint32 mipLevel;
			public WGPUOrigin3D origin;
			public WGPUTextureAspect aspect;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUTextureDescriptor {
			public WGPUChainedStruct* nextInChain;
			/**
			* This is a \ref NonNullInputString.
			*/
			public WGPUStringView label;
			public WGPUTextureUsage usage;
			public WGPUTextureDimension dimension;
			public WGPUExtent3D size;
			public WGPUTextureFormat format;
			public uint32 mipLevelCount;
			public uint32 sampleCount;
			public c_size viewFormatCount;
			public WGPUTextureFormat* viewFormats;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUVertexBufferLayout {
			/**
			* The step mode for the vertex buffer. If @ref VertexBufferNotUsed,
			* indicates a "hole" in the parent @ref WGPUVertexState `buffers` array:
			* the pipeline does not use a vertex buffer at this `location`.
			*/
			public WGPUVertexStepMode stepMode;
			public uint64 arrayStride;
			public c_size attributeCount;
			public WGPUVertexAttribute* attributes;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUBindGroupLayoutDescriptor {
			public WGPUChainedStruct* nextInChain;
			/**
			* This is a \ref NonNullInputString.
			*/
			public WGPUStringView label;
			public c_size entryCount;
			public WGPUBindGroupLayoutEntry* entries;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUColorTargetState {
			public WGPUChainedStruct* nextInChain;
			/**
			* The texture format of the target. If @ref Undefined,
			* indicates a "hole" in the parent @ref WGPUFragmentState `targets` array:
			* the pipeline does not output a value at this `location`.
			*/
			public WGPUTextureFormat format;
			public WGPUBlendState* blend;
			public WGPUColorWriteMask writeMask;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUComputePipelineDescriptor {
			public WGPUChainedStruct* nextInChain;
			/**
			* This is a \ref NonNullInputString.
			*/
			public WGPUStringView label;
			public WGPUPipelineLayout layout;
			public WGPUProgrammableStageDescriptor compute;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPURenderPassDescriptor {
			public WGPUChainedStruct* nextInChain;
			/**
			* This is a \ref NonNullInputString.
			*/
			public WGPUStringView label;
			public c_size colorAttachmentCount;
			public WGPURenderPassColorAttachment* colorAttachments;
			public WGPURenderPassDepthStencilAttachment* depthStencilAttachment;
			public WGPUQuerySet occlusionQuerySet;
			public WGPURenderPassTimestampWrites* timestampWrites;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUVertexState {
			public WGPUChainedStruct* nextInChain;
			public WGPUShaderModule module;
			/**
			* This is a \ref NullableInputString.
			*/
			public WGPUStringView entryPoint;
			public c_size constantCount;
			public WGPUConstantEntry* constants;
			public c_size bufferCount;
			public WGPUVertexBufferLayout* buffers;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUFragmentState {
			public WGPUChainedStruct* nextInChain;
			public WGPUShaderModule module;
			/**
			* This is a \ref NullableInputString.
			*/
			public WGPUStringView entryPoint;
			public c_size constantCount;
			public WGPUConstantEntry* constants;
			public c_size targetCount;
			public WGPUColorTargetState* targets;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPURenderPipelineDescriptor {
			public WGPUChainedStruct* nextInChain;
			/**
			* This is a \ref NonNullInputString.
			*/
			public WGPUStringView label;
			public WGPUPipelineLayout layout;
			public WGPUVertexState vertex;
			public WGPUPrimitiveState primitive;
			public WGPUDepthStencilState* depthStencil;
			public WGPUMultisampleState multisample;
			public WGPUFragmentState* fragment;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUInstanceExtras {
			public WGPUChainedStruct chain;
			public WGPUInstanceBackend backends;
			public WGPUInstanceFlag flags;
			public WGPUDx12Compiler dx12ShaderCompiler;
			public WGPUGles3MinorVersion gles3MinorVersion;
			public WGPUStringView dxilPath;
			public WGPUStringView dxcPath;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUDeviceExtras {
			public WGPUChainedStruct chain;
			public WGPUStringView tracePath;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUNativeLimits {
			/** This struct chain is used as mutable in some places and immutable in others. */
			public WGPUChainedStructOut chain;
			public uint32 maxPushConstantSize;
			public uint32 maxNonSamplerBindings;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUPushConstantRange {
			public WGPUShaderStage stages;
			public uint32 start;
			public uint32 end;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUPipelineLayoutExtras {
			public WGPUChainedStruct chain;
			public c_size pushConstantRangeCount;
			public WGPUPushConstantRange* pushConstantRanges;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUShaderDefine {
			public WGPUStringView name;
			public WGPUStringView value;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUShaderModuleGLSLDescriptor {
			public WGPUChainedStruct chain;
			public WGPUShaderStage stage;
			public WGPUStringView code;
			public uint32 defineCount;
			public WGPUShaderDefine* defines;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUShaderModuleDescriptorSpirV {
			public WGPUStringView label;
			public uint32 sourceSize;
			public uint32* source;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPURegistryReport {
			public c_size numAllocated;
			public c_size numKeptFromUser;
			public c_size numReleasedFromUser;
			public c_size elementSize;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUHubReport {
			public WGPURegistryReport adapters;
			public WGPURegistryReport devices;
			public WGPURegistryReport queues;
			public WGPURegistryReport pipelineLayouts;
			public WGPURegistryReport shaderModules;
			public WGPURegistryReport bindGroupLayouts;
			public WGPURegistryReport bindGroups;
			public WGPURegistryReport commandBuffers;
			public WGPURegistryReport renderBundles;
			public WGPURegistryReport renderPipelines;
			public WGPURegistryReport computePipelines;
			public WGPURegistryReport pipelineCaches;
			public WGPURegistryReport querySets;
			public WGPURegistryReport buffers;
			public WGPURegistryReport textures;
			public WGPURegistryReport textureViews;
			public WGPURegistryReport samplers;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUGlobalReport {
			public WGPURegistryReport surfaces;
			public WGPUHubReport hub;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUInstanceEnumerateAdapterOptions {
			public WGPUChainedStruct* nextInChain;
			public WGPUInstanceBackend backends;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUBindGroupEntryExtras {
			public WGPUChainedStruct chain;
			public WGPUBuffer* buffers;
			public c_size bufferCount;
			public WGPUSampler* samplers;
			public c_size samplerCount;
			public WGPUTextureView* textureViews;
			public c_size textureViewCount;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUBindGroupLayoutEntryExtras {
			public WGPUChainedStruct chain;
			public uint32 count;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUQuerySetDescriptorExtras {
			public WGPUChainedStruct chain;
			public WGPUPipelineStatisticName* pipelineStatistics;
			public c_size pipelineStatisticCount;

			public this() {
				this = default;
			}
		}

		[CRepr]
		public struct WGPUSurfaceConfigurationExtras {
			public WGPUChainedStruct chain;
			public uint32 desiredMaximumFrameLatency;

			public this() {
				this = default;
			}
		}

		public function void WGPUProc(void);

		/**
		* \defgroup Callbacks
		* \brief Callbacks through which asynchronous functions return.
		*/
		/**
		* @param message
		* This parameter is @ref PassedWithoutOwnership.
		*/
		public function void WGPUBufferMapCallback(WGPUMapAsyncStatus status, WGPUStringView message, void* userdata1, void* userdata2);
		/**
		* @param compilationInfo
		* This parameter is @ref PassedWithoutOwnership.
		*/
		public function void WGPUCompilationInfoCallback(WGPUCompilationInfoRequestStatus status, WGPUCompilationInfo* compilationInfo, void* userdata1, void* userdata2);
		/**
		* @param pipeline
		* This parameter is @ref PassedWithOwnership.
		*/
		public function void WGPUCreateComputePipelineAsyncCallback(WGPUCreatePipelineAsyncStatus status, WGPUComputePipeline pipeline, WGPUStringView message, void* userdata1, void* userdata2);
		/**
		* @param pipeline
		* This parameter is @ref PassedWithOwnership.
		*/
		public function void WGPUCreateRenderPipelineAsyncCallback(WGPUCreatePipelineAsyncStatus status, WGPURenderPipeline pipeline, WGPUStringView message, void* userdata1, void* userdata2);
		/**
		* @param device
		* Reference to the device which was lost. If, and only if, the `reason` is @ref WGPUDeviceLostReason_FailedCreation, this is a non-null pointer to a null @ref WGPUDevice.
		* This parameter is @ref PassedWithoutOwnership.
		*
		* @param message
		* This parameter is @ref PassedWithoutOwnership.
		*/
		public function void WGPUDeviceLostCallback(WGPUDevice* device, WGPUDeviceLostReason reason, WGPUStringView message, void* userdata1, void* userdata2);
		/**
		* @param status
		* See @ref WGPUPopErrorScopeStatus.
		*
		* @param type
		* The type of the error caught by the scope, or @ref WGPUErrorType_NoError if there was none.
		* If the `status` is not @ref WGPUPopErrorScopeStatus_Success, this is @ref WGPUErrorType_NoError.
		*
		* @param message
		* If the `type` is not @ref WGPUErrorType_NoError, this is a non-empty @ref LocalizableHumanReadableMessageString;
		* otherwise, this is an empty string.
		* This parameter is @ref PassedWithoutOwnership.
		*/
		public function void WGPUPopErrorScopeCallback(WGPUPopErrorScopeStatus status, WGPUErrorType type, WGPUStringView message, void* userdata1, void* userdata2);
		public function void WGPUQueueWorkDoneCallback(WGPUQueueWorkDoneStatus status, void* userdata1, void* userdata2);
		/**
		* @param adapter
		* This parameter is @ref PassedWithOwnership.
		*
		* @param message
		* This parameter is @ref PassedWithoutOwnership.
		*/
		public function void WGPURequestAdapterCallback(WGPURequestAdapterStatus status, WGPUAdapter adapter, WGPUStringView message, void* userdata1, void* userdata2);
		/**
		* @param device
		* This parameter is @ref PassedWithOwnership.
		*
		* @param message
		* This parameter is @ref PassedWithoutOwnership.
		*/
		public function void WGPURequestDeviceCallback(WGPURequestDeviceStatus status, WGPUDevice device, WGPUStringView message, void* userdata1, void* userdata2);
		/**
		* @param device
		* This parameter is @ref PassedWithoutOwnership.
		*
		* @param message
		* This parameter is @ref PassedWithoutOwnership.
		*/
		public function void WGPUUncapturedErrorCallback(WGPUDevice* device, WGPUErrorType type, WGPUStringView message, void* userdata1, void* userdata2);

		/**
		* Proc pointer type for @ref wgpuCreateInstance:
		* > @copydoc wgpuCreateInstance
		*/
		public function WGPUInstance WGPUProcCreateInstance(WGPUInstanceDescriptor* descriptor);
		/**
		* Proc pointer type for @ref wgpuGetInstanceCapabilities:
		* > @copydoc wgpuGetInstanceCapabilities
		*/
		public function WGPUStatus WGPUProcGetInstanceCapabilities(WGPUInstanceCapabilities* capabilities);
		/**
		* Proc pointer type for @ref wgpuGetProcAddress:
		* > @copydoc wgpuGetProcAddress
		*/
		public function WGPUProc WGPUProcGetProcAddress(WGPUStringView procName);

		// Procs of Adapter
		/**
		* Proc pointer type for @ref wgpuAdapterGetFeatures:
		* > @copydoc wgpuAdapterGetFeatures
		*/
		public function void WGPUProcAdapterGetFeatures(WGPUAdapter adapter, WGPUSupportedFeatures* features);
		/**
		* Proc pointer type for @ref wgpuAdapterGetInfo:
		* > @copydoc wgpuAdapterGetInfo
		*/
		public function WGPUStatus WGPUProcAdapterGetInfo(WGPUAdapter adapter, WGPUAdapterInfo* info);
		/**
		* Proc pointer type for @ref wgpuAdapterGetLimits:
		* > @copydoc wgpuAdapterGetLimits
		*/
		public function WGPUStatus WGPUProcAdapterGetLimits(WGPUAdapter adapter, WGPULimits* limits);
		/**
		* Proc pointer type for @ref wgpuAdapterHasFeature:
		* > @copydoc wgpuAdapterHasFeature
		*/
		public function WGPUBool WGPUProcAdapterHasFeature(WGPUAdapter adapter, WGPUFeatureName feature);
		/**
		* Proc pointer type for @ref wgpuAdapterRequestDevice:
		* > @copydoc wgpuAdapterRequestDevice
		*/
		public function WGPUFuture WGPUProcAdapterRequestDevice(WGPUAdapter adapter, WGPUDeviceDescriptor* descriptor, WGPURequestDeviceCallbackInfo callbackInfo);
		/**
		* Proc pointer type for @ref wgpuAdapterAddRef.
		* > @copydoc wgpuAdapterAddRef
		*/
		public function void WGPUProcAdapterAddRef(WGPUAdapter adapter);
		/**
		* Proc pointer type for @ref wgpuAdapterRelease.
		* > @copydoc wgpuAdapterRelease
		*/
		public function void WGPUProcAdapterRelease(WGPUAdapter adapter);

		// Procs of AdapterInfo
		/**
		* Proc pointer type for @ref wgpuAdapterInfoFreeMembers:
		* > @copydoc wgpuAdapterInfoFreeMembers
		*/
		public function void WGPUProcAdapterInfoFreeMembers(WGPUAdapterInfo adapterInfo);

		// Procs of BindGroup
		/**
		* Proc pointer type for @ref wgpuBindGroupSetLabel:
		* > @copydoc wgpuBindGroupSetLabel
		*/
		public function void WGPUProcBindGroupSetLabel(WGPUBindGroup bindGroup, WGPUStringView label);
		/**
		* Proc pointer type for @ref wgpuBindGroupAddRef.
		* > @copydoc wgpuBindGroupAddRef
		*/
		public function void WGPUProcBindGroupAddRef(WGPUBindGroup bindGroup);
		/**
		* Proc pointer type for @ref wgpuBindGroupRelease.
		* > @copydoc wgpuBindGroupRelease
		*/
		public function void WGPUProcBindGroupRelease(WGPUBindGroup bindGroup);

		// Procs of BindGroupLayout
		/**
		* Proc pointer type for @ref wgpuBindGroupLayoutSetLabel:
		* > @copydoc wgpuBindGroupLayoutSetLabel
		*/
		public function void WGPUProcBindGroupLayoutSetLabel(WGPUBindGroupLayout bindGroupLayout, WGPUStringView label);
		/**
		* Proc pointer type for @ref wgpuBindGroupLayoutAddRef.
		* > @copydoc wgpuBindGroupLayoutAddRef
		*/
		public function void WGPUProcBindGroupLayoutAddRef(WGPUBindGroupLayout bindGroupLayout);
		/**
		* Proc pointer type for @ref wgpuBindGroupLayoutRelease.
		* > @copydoc wgpuBindGroupLayoutRelease
		*/
		public function void WGPUProcBindGroupLayoutRelease(WGPUBindGroupLayout bindGroupLayout);

		// Procs of Buffer
		/**
		* Proc pointer type for @ref wgpuBufferDestroy:
		* > @copydoc wgpuBufferDestroy
		*/
		public function void WGPUProcBufferDestroy(WGPUBuffer buffer);
		/**
		* Proc pointer type for @ref wgpuBufferGetConstMappedRange:
		* > @copydoc wgpuBufferGetConstMappedRange
		*/
		public function void* WGPUProcBufferGetConstMappedRange(WGPUBuffer buffer, c_size offset, c_size size);
		/**
		* Proc pointer type for @ref wgpuBufferGetMapState:
		* > @copydoc wgpuBufferGetMapState
		*/
		public function WGPUBufferMapState WGPUProcBufferGetMapState(WGPUBuffer buffer);
		/**
		* Proc pointer type for @ref wgpuBufferGetMappedRange:
		* > @copydoc wgpuBufferGetMappedRange
		*/
		public function void* WGPUProcBufferGetMappedRange(WGPUBuffer buffer, c_size offset, c_size size);
		/**
		* Proc pointer type for @ref wgpuBufferGetSize:
		* > @copydoc wgpuBufferGetSize
		*/
		public function uint64 WGPUProcBufferGetSize(WGPUBuffer buffer);
		/**
		* Proc pointer type for @ref wgpuBufferGetUsage:
		* > @copydoc wgpuBufferGetUsage
		*/
		public function WGPUBufferUsage WGPUProcBufferGetUsage(WGPUBuffer buffer);
		/**
		* Proc pointer type for @ref wgpuBufferMapAsync:
		* > @copydoc wgpuBufferMapAsync
		*/
		public function WGPUFuture WGPUProcBufferMapAsync(WGPUBuffer buffer, WGPUMapMode mode, c_size offset, c_size size, WGPUBufferMapCallbackInfo callbackInfo);
		/**
		* Proc pointer type for @ref wgpuBufferSetLabel:
		* > @copydoc wgpuBufferSetLabel
		*/
		public function void WGPUProcBufferSetLabel(WGPUBuffer buffer, WGPUStringView label);
		/**
		* Proc pointer type for @ref wgpuBufferUnmap:
		* > @copydoc wgpuBufferUnmap
		*/
		public function void WGPUProcBufferUnmap(WGPUBuffer buffer);
		/**
		* Proc pointer type for @ref wgpuBufferAddRef.
		* > @copydoc wgpuBufferAddRef
		*/
		public function void WGPUProcBufferAddRef(WGPUBuffer buffer);
		/**
		* Proc pointer type for @ref wgpuBufferRelease.
		* > @copydoc wgpuBufferRelease
		*/
		public function void WGPUProcBufferRelease(WGPUBuffer buffer);

		// Procs of CommandBuffer
		/**
		* Proc pointer type for @ref wgpuCommandBufferSetLabel:
		* > @copydoc wgpuCommandBufferSetLabel
		*/
		public function void WGPUProcCommandBufferSetLabel(WGPUCommandBuffer commandBuffer, WGPUStringView label);
		/**
		* Proc pointer type for @ref wgpuCommandBufferAddRef.
		* > @copydoc wgpuCommandBufferAddRef
		*/
		public function void WGPUProcCommandBufferAddRef(WGPUCommandBuffer commandBuffer);
		/**
		* Proc pointer type for @ref wgpuCommandBufferRelease.
		* > @copydoc wgpuCommandBufferRelease
		*/
		public function void WGPUProcCommandBufferRelease(WGPUCommandBuffer commandBuffer);

		// Procs of CommandEncoder
		/**
		* Proc pointer type for @ref wgpuCommandEncoderBeginComputePass:
		* > @copydoc wgpuCommandEncoderBeginComputePass
		*/
		public function WGPUComputePassEncoder WGPUProcCommandEncoderBeginComputePass(WGPUCommandEncoder commandEncoder, WGPUComputePassDescriptor* descriptor);
		/**
		* Proc pointer type for @ref wgpuCommandEncoderBeginRenderPass:
		* > @copydoc wgpuCommandEncoderBeginRenderPass
		*/
		public function WGPURenderPassEncoder WGPUProcCommandEncoderBeginRenderPass(WGPUCommandEncoder commandEncoder, WGPURenderPassDescriptor* descriptor);
		/**
		* Proc pointer type for @ref wgpuCommandEncoderClearBuffer:
		* > @copydoc wgpuCommandEncoderClearBuffer
		*/
		public function void WGPUProcCommandEncoderClearBuffer(WGPUCommandEncoder commandEncoder, WGPUBuffer buffer, uint64 offset, uint64 size);
		/**
		* Proc pointer type for @ref wgpuCommandEncoderCopyBufferToBuffer:
		* > @copydoc wgpuCommandEncoderCopyBufferToBuffer
		*/
		public function void WGPUProcCommandEncoderCopyBufferToBuffer(WGPUCommandEncoder commandEncoder, WGPUBuffer source, uint64 sourceOffset, WGPUBuffer destination, uint64 destinationOffset, uint64 size);
		/**
		* Proc pointer type for @ref wgpuCommandEncoderCopyBufferToTexture:
		* > @copydoc wgpuCommandEncoderCopyBufferToTexture
		*/
		public function void WGPUProcCommandEncoderCopyBufferToTexture(WGPUCommandEncoder commandEncoder, WGPUTexelCopyBufferInfo* source, WGPUTexelCopyTextureInfo* destination, WGPUExtent3D* copySize);
		/**
		* Proc pointer type for @ref wgpuCommandEncoderCopyTextureToBuffer:
		* > @copydoc wgpuCommandEncoderCopyTextureToBuffer
		*/
		public function void WGPUProcCommandEncoderCopyTextureToBuffer(WGPUCommandEncoder commandEncoder, WGPUTexelCopyTextureInfo* source, WGPUTexelCopyBufferInfo* destination, WGPUExtent3D* copySize);
		/**
		* Proc pointer type for @ref wgpuCommandEncoderCopyTextureToTexture:
		* > @copydoc wgpuCommandEncoderCopyTextureToTexture
		*/
		public function void WGPUProcCommandEncoderCopyTextureToTexture(WGPUCommandEncoder commandEncoder, WGPUTexelCopyTextureInfo* source, WGPUTexelCopyTextureInfo* destination, WGPUExtent3D* copySize);
		/**
		* Proc pointer type for @ref wgpuCommandEncoderFinish:
		* > @copydoc wgpuCommandEncoderFinish
		*/
		public function WGPUCommandBuffer WGPUProcCommandEncoderFinish(WGPUCommandEncoder commandEncoder, WGPUCommandBufferDescriptor* descriptor);
		/**
		* Proc pointer type for @ref wgpuCommandEncoderInsertDebugMarker:
		* > @copydoc wgpuCommandEncoderInsertDebugMarker
		*/
		public function void WGPUProcCommandEncoderInsertDebugMarker(WGPUCommandEncoder commandEncoder, WGPUStringView markerLabel);
		/**
		* Proc pointer type for @ref wgpuCommandEncoderPopDebugGroup:
		* > @copydoc wgpuCommandEncoderPopDebugGroup
		*/
		public function void WGPUProcCommandEncoderPopDebugGroup(WGPUCommandEncoder commandEncoder);
		/**
		* Proc pointer type for @ref wgpuCommandEncoderPushDebugGroup:
		* > @copydoc wgpuCommandEncoderPushDebugGroup
		*/
		public function void WGPUProcCommandEncoderPushDebugGroup(WGPUCommandEncoder commandEncoder, WGPUStringView groupLabel);
		/**
		* Proc pointer type for @ref wgpuCommandEncoderResolveQuerySet:
		* > @copydoc wgpuCommandEncoderResolveQuerySet
		*/
		public function void WGPUProcCommandEncoderResolveQuerySet(WGPUCommandEncoder commandEncoder, WGPUQuerySet querySet, uint32 firstQuery, uint32 queryCount, WGPUBuffer destination, uint64 destinationOffset);
		/**
		* Proc pointer type for @ref wgpuCommandEncoderSetLabel:
		* > @copydoc wgpuCommandEncoderSetLabel
		*/
		public function void WGPUProcCommandEncoderSetLabel(WGPUCommandEncoder commandEncoder, WGPUStringView label);
		/**
		* Proc pointer type for @ref wgpuCommandEncoderWriteTimestamp:
		* > @copydoc wgpuCommandEncoderWriteTimestamp
		*/
		public function void WGPUProcCommandEncoderWriteTimestamp(WGPUCommandEncoder commandEncoder, WGPUQuerySet querySet, uint32 queryIndex);
		/**
		* Proc pointer type for @ref wgpuCommandEncoderAddRef.
		* > @copydoc wgpuCommandEncoderAddRef
		*/
		public function void WGPUProcCommandEncoderAddRef(WGPUCommandEncoder commandEncoder);
		/**
		* Proc pointer type for @ref wgpuCommandEncoderRelease.
		* > @copydoc wgpuCommandEncoderRelease
		*/
		public function void WGPUProcCommandEncoderRelease(WGPUCommandEncoder commandEncoder);

		// Procs of ComputePassEncoder
		/**
		* Proc pointer type for @ref wgpuComputePassEncoderDispatchWorkgroups:
		* > @copydoc wgpuComputePassEncoderDispatchWorkgroups
		*/
		public function void WGPUProcComputePassEncoderDispatchWorkgroups(WGPUComputePassEncoder computePassEncoder, uint32 workgroupCountX, uint32 workgroupCountY, uint32 workgroupCountZ);
		/**
		* Proc pointer type for @ref wgpuComputePassEncoderDispatchWorkgroupsIndirect:
		* > @copydoc wgpuComputePassEncoderDispatchWorkgroupsIndirect
		*/
		public function void WGPUProcComputePassEncoderDispatchWorkgroupsIndirect(WGPUComputePassEncoder computePassEncoder, WGPUBuffer indirectBuffer, uint64 indirectOffset);
		/**
		* Proc pointer type for @ref wgpuComputePassEncoderEnd:
		* > @copydoc wgpuComputePassEncoderEnd
		*/
		public function void WGPUProcComputePassEncoderEnd(WGPUComputePassEncoder computePassEncoder);
		/**
		* Proc pointer type for @ref wgpuComputePassEncoderInsertDebugMarker:
		* > @copydoc wgpuComputePassEncoderInsertDebugMarker
		*/
		public function void WGPUProcComputePassEncoderInsertDebugMarker(WGPUComputePassEncoder computePassEncoder, WGPUStringView markerLabel);
		/**
		* Proc pointer type for @ref wgpuComputePassEncoderPopDebugGroup:
		* > @copydoc wgpuComputePassEncoderPopDebugGroup
		*/
		public function void WGPUProcComputePassEncoderPopDebugGroup(WGPUComputePassEncoder computePassEncoder);
		/**
		* Proc pointer type for @ref wgpuComputePassEncoderPushDebugGroup:
		* > @copydoc wgpuComputePassEncoderPushDebugGroup
		*/
		public function void WGPUProcComputePassEncoderPushDebugGroup(WGPUComputePassEncoder computePassEncoder, WGPUStringView groupLabel);
		/**
		* Proc pointer type for @ref wgpuComputePassEncoderSetBindGroup:
		* > @copydoc wgpuComputePassEncoderSetBindGroup
		*/
		public function void WGPUProcComputePassEncoderSetBindGroup(WGPUComputePassEncoder computePassEncoder, uint32 groupIndex, WGPUBindGroup group, c_size dynamicOffsetCount, uint32* dynamicOffsets);
		/**
		* Proc pointer type for @ref wgpuComputePassEncoderSetLabel:
		* > @copydoc wgpuComputePassEncoderSetLabel
		*/
		public function void WGPUProcComputePassEncoderSetLabel(WGPUComputePassEncoder computePassEncoder, WGPUStringView label);
		/**
		* Proc pointer type for @ref wgpuComputePassEncoderSetPipeline:
		* > @copydoc wgpuComputePassEncoderSetPipeline
		*/
		public function void WGPUProcComputePassEncoderSetPipeline(WGPUComputePassEncoder computePassEncoder, WGPUComputePipeline pipeline);
		/**
		* Proc pointer type for @ref wgpuComputePassEncoderAddRef.
		* > @copydoc wgpuComputePassEncoderAddRef
		*/
		public function void WGPUProcComputePassEncoderAddRef(WGPUComputePassEncoder computePassEncoder);
		/**
		* Proc pointer type for @ref wgpuComputePassEncoderRelease.
		* > @copydoc wgpuComputePassEncoderRelease
		*/
		public function void WGPUProcComputePassEncoderRelease(WGPUComputePassEncoder computePassEncoder);

		// Procs of ComputePipeline
		/**
		* Proc pointer type for @ref wgpuComputePipelineGetBindGroupLayout:
		* > @copydoc wgpuComputePipelineGetBindGroupLayout
		*/
		public function WGPUBindGroupLayout WGPUProcComputePipelineGetBindGroupLayout(WGPUComputePipeline computePipeline, uint32 groupIndex);
		/**
		* Proc pointer type for @ref wgpuComputePipelineSetLabel:
		* > @copydoc wgpuComputePipelineSetLabel
		*/
		public function void WGPUProcComputePipelineSetLabel(WGPUComputePipeline computePipeline, WGPUStringView label);
		/**
		* Proc pointer type for @ref wgpuComputePipelineAddRef.
		* > @copydoc wgpuComputePipelineAddRef
		*/
		public function void WGPUProcComputePipelineAddRef(WGPUComputePipeline computePipeline);
		/**
		* Proc pointer type for @ref wgpuComputePipelineRelease.
		* > @copydoc wgpuComputePipelineRelease
		*/
		public function void WGPUProcComputePipelineRelease(WGPUComputePipeline computePipeline);

		// Procs of Device
		/**
		* Proc pointer type for @ref wgpuDeviceCreateBindGroup:
		* > @copydoc wgpuDeviceCreateBindGroup
		*/
		public function WGPUBindGroup WGPUProcDeviceCreateBindGroup(WGPUDevice device, WGPUBindGroupDescriptor* descriptor);
		/**
		* Proc pointer type for @ref wgpuDeviceCreateBindGroupLayout:
		* > @copydoc wgpuDeviceCreateBindGroupLayout
		*/
		public function WGPUBindGroupLayout WGPUProcDeviceCreateBindGroupLayout(WGPUDevice device, WGPUBindGroupLayoutDescriptor* descriptor);
		/**
		* Proc pointer type for @ref wgpuDeviceCreateBuffer:
		* > @copydoc wgpuDeviceCreateBuffer
		*/
		public function WGPUBuffer WGPUProcDeviceCreateBuffer(WGPUDevice device, WGPUBufferDescriptor* descriptor);
		/**
		* Proc pointer type for @ref wgpuDeviceCreateCommandEncoder:
		* > @copydoc wgpuDeviceCreateCommandEncoder
		*/
		public function WGPUCommandEncoder WGPUProcDeviceCreateCommandEncoder(WGPUDevice device, WGPUCommandEncoderDescriptor* descriptor);
		/**
		* Proc pointer type for @ref wgpuDeviceCreateComputePipeline:
		* > @copydoc wgpuDeviceCreateComputePipeline
		*/
		public function WGPUComputePipeline WGPUProcDeviceCreateComputePipeline(WGPUDevice device, WGPUComputePipelineDescriptor* descriptor);
		/**
		* Proc pointer type for @ref wgpuDeviceCreateComputePipelineAsync:
		* > @copydoc wgpuDeviceCreateComputePipelineAsync
		*/
		public function WGPUFuture WGPUProcDeviceCreateComputePipelineAsync(WGPUDevice device, WGPUComputePipelineDescriptor* descriptor, WGPUCreateComputePipelineAsyncCallbackInfo callbackInfo);
		/**
		* Proc pointer type for @ref wgpuDeviceCreatePipelineLayout:
		* > @copydoc wgpuDeviceCreatePipelineLayout
		*/
		public function WGPUPipelineLayout WGPUProcDeviceCreatePipelineLayout(WGPUDevice device, WGPUPipelineLayoutDescriptor* descriptor);
		/**
		* Proc pointer type for @ref wgpuDeviceCreateQuerySet:
		* > @copydoc wgpuDeviceCreateQuerySet
		*/
		public function WGPUQuerySet WGPUProcDeviceCreateQuerySet(WGPUDevice device, WGPUQuerySetDescriptor* descriptor);
		/**
		* Proc pointer type for @ref wgpuDeviceCreateRenderBundleEncoder:
		* > @copydoc wgpuDeviceCreateRenderBundleEncoder
		*/
		public function WGPURenderBundleEncoder WGPUProcDeviceCreateRenderBundleEncoder(WGPUDevice device, WGPURenderBundleEncoderDescriptor* descriptor);
		/**
		* Proc pointer type for @ref wgpuDeviceCreateRenderPipeline:
		* > @copydoc wgpuDeviceCreateRenderPipeline
		*/
		public function WGPURenderPipeline WGPUProcDeviceCreateRenderPipeline(WGPUDevice device, WGPURenderPipelineDescriptor* descriptor);
		/**
		* Proc pointer type for @ref wgpuDeviceCreateRenderPipelineAsync:
		* > @copydoc wgpuDeviceCreateRenderPipelineAsync
		*/
		public function WGPUFuture WGPUProcDeviceCreateRenderPipelineAsync(WGPUDevice device, WGPURenderPipelineDescriptor* descriptor, WGPUCreateRenderPipelineAsyncCallbackInfo callbackInfo);
		/**
		* Proc pointer type for @ref wgpuDeviceCreateSampler:
		* > @copydoc wgpuDeviceCreateSampler
		*/
		public function WGPUSampler WGPUProcDeviceCreateSampler(WGPUDevice device, WGPUSamplerDescriptor* descriptor);
		/**
		* Proc pointer type for @ref wgpuDeviceCreateShaderModule:
		* > @copydoc wgpuDeviceCreateShaderModule
		*/
		public function WGPUShaderModule WGPUProcDeviceCreateShaderModule(WGPUDevice device, WGPUShaderModuleDescriptor* descriptor);
		/**
		* Proc pointer type for @ref wgpuDeviceCreateTexture:
		* > @copydoc wgpuDeviceCreateTexture
		*/
		public function WGPUTexture WGPUProcDeviceCreateTexture(WGPUDevice device, WGPUTextureDescriptor* descriptor);
		/**
		* Proc pointer type for @ref wgpuDeviceDestroy:
		* > @copydoc wgpuDeviceDestroy
		*/
		public function void WGPUProcDeviceDestroy(WGPUDevice device);
		/**
		* Proc pointer type for @ref wgpuDeviceGetAdapterInfo:
		* > @copydoc wgpuDeviceGetAdapterInfo
		*/
		public function WGPUAdapterInfo WGPUProcDeviceGetAdapterInfo(WGPUDevice device);
		/**
		* Proc pointer type for @ref wgpuDeviceGetFeatures:
		* > @copydoc wgpuDeviceGetFeatures
		*/
		public function void WGPUProcDeviceGetFeatures(WGPUDevice device, WGPUSupportedFeatures* features);
		/**
		* Proc pointer type for @ref wgpuDeviceGetLimits:
		* > @copydoc wgpuDeviceGetLimits
		*/
		public function WGPUStatus WGPUProcDeviceGetLimits(WGPUDevice device, WGPULimits* limits);
		/**
		* Proc pointer type for @ref wgpuDeviceGetLostFuture:
		* > @copydoc wgpuDeviceGetLostFuture
		*/
		public function WGPUFuture WGPUProcDeviceGetLostFuture(WGPUDevice device);
		/**
		* Proc pointer type for @ref wgpuDeviceGetQueue:
		* > @copydoc wgpuDeviceGetQueue
		*/
		public function WGPUQueue WGPUProcDeviceGetQueue(WGPUDevice device);
		/**
		* Proc pointer type for @ref wgpuDeviceHasFeature:
		* > @copydoc wgpuDeviceHasFeature
		*/
		public function WGPUBool WGPUProcDeviceHasFeature(WGPUDevice device, WGPUFeatureName feature);
		/**
		* Proc pointer type for @ref wgpuDevicePopErrorScope:
		* > @copydoc wgpuDevicePopErrorScope
		*/
		public function WGPUFuture WGPUProcDevicePopErrorScope(WGPUDevice device, WGPUPopErrorScopeCallbackInfo callbackInfo);
		/**
		* Proc pointer type for @ref wgpuDevicePushErrorScope:
		* > @copydoc wgpuDevicePushErrorScope
		*/
		public function void WGPUProcDevicePushErrorScope(WGPUDevice device, WGPUErrorFilter filter);
		/**
		* Proc pointer type for @ref wgpuDeviceSetLabel:
		* > @copydoc wgpuDeviceSetLabel
		*/
		public function void WGPUProcDeviceSetLabel(WGPUDevice device, WGPUStringView label);
		/**
		* Proc pointer type for @ref wgpuDeviceAddRef.
		* > @copydoc wgpuDeviceAddRef
		*/
		public function void WGPUProcDeviceAddRef(WGPUDevice device);
		/**
		* Proc pointer type for @ref wgpuDeviceRelease.
		* > @copydoc wgpuDeviceRelease
		*/
		public function void WGPUProcDeviceRelease(WGPUDevice device);

		// Procs of Instance
		/**
		* Proc pointer type for @ref wgpuInstanceCreateSurface:
		* > @copydoc wgpuInstanceCreateSurface
		*/
		public function WGPUSurface WGPUProcInstanceCreateSurface(WGPUInstance instance, WGPUSurfaceDescriptor* descriptor);
		/**
		* Proc pointer type for @ref wgpuInstanceGetWGSLLanguageFeatures:
		* > @copydoc wgpuInstanceGetWGSLLanguageFeatures
		*/
		public function WGPUStatus WGPUProcInstanceGetWGSLLanguageFeatures(WGPUInstance instance, WGPUSupportedWGSLLanguageFeatures* features);
		/**
		* Proc pointer type for @ref wgpuInstanceHasWGSLLanguageFeature:
		* > @copydoc wgpuInstanceHasWGSLLanguageFeature
		*/
		public function WGPUBool WGPUProcInstanceHasWGSLLanguageFeature(WGPUInstance instance, WGPUWGSLLanguageFeatureName feature);
		/**
		* Proc pointer type for @ref wgpuInstanceProcessEvents:
		* > @copydoc wgpuInstanceProcessEvents
		*/
		public function void WGPUProcInstanceProcessEvents(WGPUInstance instance);
		/**
		* Proc pointer type for @ref wgpuInstanceRequestAdapter:
		* > @copydoc wgpuInstanceRequestAdapter
		*/
		public function WGPUFuture WGPUProcInstanceRequestAdapter(WGPUInstance instance, WGPURequestAdapterOptions* options, WGPURequestAdapterCallbackInfo callbackInfo);
		/**
		* Proc pointer type for @ref wgpuInstanceWaitAny:
		* > @copydoc wgpuInstanceWaitAny
		*/
		public function WGPUWaitStatus WGPUProcInstanceWaitAny(WGPUInstance instance, c_size futureCount, WGPUFutureWaitInfo* futures, uint64 timeoutNS);
		/**
		* Proc pointer type for @ref wgpuInstanceAddRef.
		* > @copydoc wgpuInstanceAddRef
		*/
		public function void WGPUProcInstanceAddRef(WGPUInstance instance);
		/**
		* Proc pointer type for @ref wgpuInstanceRelease.
		* > @copydoc wgpuInstanceRelease
		*/
		public function void WGPUProcInstanceRelease(WGPUInstance instance);

		// Procs of PipelineLayout
		/**
		* Proc pointer type for @ref wgpuPipelineLayoutSetLabel:
		* > @copydoc wgpuPipelineLayoutSetLabel
		*/
		public function void WGPUProcPipelineLayoutSetLabel(WGPUPipelineLayout pipelineLayout, WGPUStringView label);
		/**
		* Proc pointer type for @ref wgpuPipelineLayoutAddRef.
		* > @copydoc wgpuPipelineLayoutAddRef
		*/
		public function void WGPUProcPipelineLayoutAddRef(WGPUPipelineLayout pipelineLayout);
		/**
		* Proc pointer type for @ref wgpuPipelineLayoutRelease.
		* > @copydoc wgpuPipelineLayoutRelease
		*/
		public function void WGPUProcPipelineLayoutRelease(WGPUPipelineLayout pipelineLayout);

		// Procs of QuerySet
		/**
		* Proc pointer type for @ref wgpuQuerySetDestroy:
		* > @copydoc wgpuQuerySetDestroy
		*/
		public function void WGPUProcQuerySetDestroy(WGPUQuerySet querySet);
		/**
		* Proc pointer type for @ref wgpuQuerySetGetCount:
		* > @copydoc wgpuQuerySetGetCount
		*/
		public function uint32 WGPUProcQuerySetGetCount(WGPUQuerySet querySet);
		/**
		* Proc pointer type for @ref wgpuQuerySetGetType:
		* > @copydoc wgpuQuerySetGetType
		*/
		public function WGPUQueryType WGPUProcQuerySetGetType(WGPUQuerySet querySet);
		/**
		* Proc pointer type for @ref wgpuQuerySetSetLabel:
		* > @copydoc wgpuQuerySetSetLabel
		*/
		public function void WGPUProcQuerySetSetLabel(WGPUQuerySet querySet, WGPUStringView label);
		/**
		* Proc pointer type for @ref wgpuQuerySetAddRef.
		* > @copydoc wgpuQuerySetAddRef
		*/
		public function void WGPUProcQuerySetAddRef(WGPUQuerySet querySet);
		/**
		* Proc pointer type for @ref wgpuQuerySetRelease.
		* > @copydoc wgpuQuerySetRelease
		*/
		public function void WGPUProcQuerySetRelease(WGPUQuerySet querySet);

		// Procs of Queue
		/**
		* Proc pointer type for @ref wgpuQueueOnSubmittedWorkDone:
		* > @copydoc wgpuQueueOnSubmittedWorkDone
		*/
		public function WGPUFuture WGPUProcQueueOnSubmittedWorkDone(WGPUQueue queue, WGPUQueueWorkDoneCallbackInfo callbackInfo);
		/**
		* Proc pointer type for @ref wgpuQueueSetLabel:
		* > @copydoc wgpuQueueSetLabel
		*/
		public function void WGPUProcQueueSetLabel(WGPUQueue queue, WGPUStringView label);
		/**
		* Proc pointer type for @ref wgpuQueueSubmit:
		* > @copydoc wgpuQueueSubmit
		*/
		public function void WGPUProcQueueSubmit(WGPUQueue queue, c_size commandCount, WGPUCommandBuffer* commands);
		/**
		* Proc pointer type for @ref wgpuQueueWriteBuffer:
		* > @copydoc wgpuQueueWriteBuffer
		*/
		public function void WGPUProcQueueWriteBuffer(WGPUQueue queue, WGPUBuffer buffer, uint64 bufferOffset, void* data, c_size size);
		/**
		* Proc pointer type for @ref wgpuQueueWriteTexture:
		* > @copydoc wgpuQueueWriteTexture
		*/
		public function void WGPUProcQueueWriteTexture(WGPUQueue queue, WGPUTexelCopyTextureInfo* destination, void* data, c_size dataSize, WGPUTexelCopyBufferLayout* dataLayout, WGPUExtent3D* writeSize);
		/**
		* Proc pointer type for @ref wgpuQueueAddRef.
		* > @copydoc wgpuQueueAddRef
		*/
		public function void WGPUProcQueueAddRef(WGPUQueue queue);
		/**
		* Proc pointer type for @ref wgpuQueueRelease.
		* > @copydoc wgpuQueueRelease
		*/
		public function void WGPUProcQueueRelease(WGPUQueue queue);

		// Procs of RenderBundle
		/**
		* Proc pointer type for @ref wgpuRenderBundleSetLabel:
		* > @copydoc wgpuRenderBundleSetLabel
		*/
		public function void WGPUProcRenderBundleSetLabel(WGPURenderBundle renderBundle, WGPUStringView label);
		/**
		* Proc pointer type for @ref wgpuRenderBundleAddRef.
		* > @copydoc wgpuRenderBundleAddRef
		*/
		public function void WGPUProcRenderBundleAddRef(WGPURenderBundle renderBundle);
		/**
		* Proc pointer type for @ref wgpuRenderBundleRelease.
		* > @copydoc wgpuRenderBundleRelease
		*/
		public function void WGPUProcRenderBundleRelease(WGPURenderBundle renderBundle);

		// Procs of RenderBundleEncoder
		/**
		* Proc pointer type for @ref wgpuRenderBundleEncoderDraw:
		* > @copydoc wgpuRenderBundleEncoderDraw
		*/
		public function void WGPUProcRenderBundleEncoderDraw(WGPURenderBundleEncoder renderBundleEncoder, uint32 vertexCount, uint32 instanceCount, uint32 firstVertex, uint32 firstInstance);
		/**
		* Proc pointer type for @ref wgpuRenderBundleEncoderDrawIndexed:
		* > @copydoc wgpuRenderBundleEncoderDrawIndexed
		*/
		public function void WGPUProcRenderBundleEncoderDrawIndexed(WGPURenderBundleEncoder renderBundleEncoder, uint32 indexCount, uint32 instanceCount, uint32 firstIndex, int32 baseVertex, uint32 firstInstance);
		/**
		* Proc pointer type for @ref wgpuRenderBundleEncoderDrawIndexedIndirect:
		* > @copydoc wgpuRenderBundleEncoderDrawIndexedIndirect
		*/
		public function void WGPUProcRenderBundleEncoderDrawIndexedIndirect(WGPURenderBundleEncoder renderBundleEncoder, WGPUBuffer indirectBuffer, uint64 indirectOffset);
		/**
		* Proc pointer type for @ref wgpuRenderBundleEncoderDrawIndirect:
		* > @copydoc wgpuRenderBundleEncoderDrawIndirect
		*/
		public function void WGPUProcRenderBundleEncoderDrawIndirect(WGPURenderBundleEncoder renderBundleEncoder, WGPUBuffer indirectBuffer, uint64 indirectOffset);
		/**
		* Proc pointer type for @ref wgpuRenderBundleEncoderFinish:
		* > @copydoc wgpuRenderBundleEncoderFinish
		*/
		public function WGPURenderBundle WGPUProcRenderBundleEncoderFinish(WGPURenderBundleEncoder renderBundleEncoder, WGPURenderBundleDescriptor* descriptor);
		/**
		* Proc pointer type for @ref wgpuRenderBundleEncoderInsertDebugMarker:
		* > @copydoc wgpuRenderBundleEncoderInsertDebugMarker
		*/
		public function void WGPUProcRenderBundleEncoderInsertDebugMarker(WGPURenderBundleEncoder renderBundleEncoder, WGPUStringView markerLabel);
		/**
		* Proc pointer type for @ref wgpuRenderBundleEncoderPopDebugGroup:
		* > @copydoc wgpuRenderBundleEncoderPopDebugGroup
		*/
		public function void WGPUProcRenderBundleEncoderPopDebugGroup(WGPURenderBundleEncoder renderBundleEncoder);
		/**
		* Proc pointer type for @ref wgpuRenderBundleEncoderPushDebugGroup:
		* > @copydoc wgpuRenderBundleEncoderPushDebugGroup
		*/
		public function void WGPUProcRenderBundleEncoderPushDebugGroup(WGPURenderBundleEncoder renderBundleEncoder, WGPUStringView groupLabel);
		/**
		* Proc pointer type for @ref wgpuRenderBundleEncoderSetBindGroup:
		* > @copydoc wgpuRenderBundleEncoderSetBindGroup
		*/
		public function void WGPUProcRenderBundleEncoderSetBindGroup(WGPURenderBundleEncoder renderBundleEncoder, uint32 groupIndex, WGPUBindGroup group, c_size dynamicOffsetCount, uint32* dynamicOffsets);
		/**
		* Proc pointer type for @ref wgpuRenderBundleEncoderSetIndexBuffer:
		* > @copydoc wgpuRenderBundleEncoderSetIndexBuffer
		*/
		public function void WGPUProcRenderBundleEncoderSetIndexBuffer(WGPURenderBundleEncoder renderBundleEncoder, WGPUBuffer buffer, WGPUIndexFormat format, uint64 offset, uint64 size);
		/**
		* Proc pointer type for @ref wgpuRenderBundleEncoderSetLabel:
		* > @copydoc wgpuRenderBundleEncoderSetLabel
		*/
		public function void WGPUProcRenderBundleEncoderSetLabel(WGPURenderBundleEncoder renderBundleEncoder, WGPUStringView label);
		/**
		* Proc pointer type for @ref wgpuRenderBundleEncoderSetPipeline:
		* > @copydoc wgpuRenderBundleEncoderSetPipeline
		*/
		public function void WGPUProcRenderBundleEncoderSetPipeline(WGPURenderBundleEncoder renderBundleEncoder, WGPURenderPipeline pipeline);
		/**
		* Proc pointer type for @ref wgpuRenderBundleEncoderSetVertexBuffer:
		* > @copydoc wgpuRenderBundleEncoderSetVertexBuffer
		*/
		public function void WGPUProcRenderBundleEncoderSetVertexBuffer(WGPURenderBundleEncoder renderBundleEncoder, uint32 slot, WGPUBuffer buffer, uint64 offset, uint64 size);
		/**
		* Proc pointer type for @ref wgpuRenderBundleEncoderAddRef.
		* > @copydoc wgpuRenderBundleEncoderAddRef
		*/
		public function void WGPUProcRenderBundleEncoderAddRef(WGPURenderBundleEncoder renderBundleEncoder);
		/**
		* Proc pointer type for @ref wgpuRenderBundleEncoderRelease.
		* > @copydoc wgpuRenderBundleEncoderRelease
		*/
		public function void WGPUProcRenderBundleEncoderRelease(WGPURenderBundleEncoder renderBundleEncoder);

		// Procs of RenderPassEncoder
		/**
		* Proc pointer type for @ref wgpuRenderPassEncoderBeginOcclusionQuery:
		* > @copydoc wgpuRenderPassEncoderBeginOcclusionQuery
		*/
		public function void WGPUProcRenderPassEncoderBeginOcclusionQuery(WGPURenderPassEncoder renderPassEncoder, uint32 queryIndex);
		/**
		* Proc pointer type for @ref wgpuRenderPassEncoderDraw:
		* > @copydoc wgpuRenderPassEncoderDraw
		*/
		public function void WGPUProcRenderPassEncoderDraw(WGPURenderPassEncoder renderPassEncoder, uint32 vertexCount, uint32 instanceCount, uint32 firstVertex, uint32 firstInstance);
		/**
		* Proc pointer type for @ref wgpuRenderPassEncoderDrawIndexed:
		* > @copydoc wgpuRenderPassEncoderDrawIndexed
		*/
		public function void WGPUProcRenderPassEncoderDrawIndexed(WGPURenderPassEncoder renderPassEncoder, uint32 indexCount, uint32 instanceCount, uint32 firstIndex, int32 baseVertex, uint32 firstInstance);
		/**
		* Proc pointer type for @ref wgpuRenderPassEncoderDrawIndexedIndirect:
		* > @copydoc wgpuRenderPassEncoderDrawIndexedIndirect
		*/
		public function void WGPUProcRenderPassEncoderDrawIndexedIndirect(WGPURenderPassEncoder renderPassEncoder, WGPUBuffer indirectBuffer, uint64 indirectOffset);
		/**
		* Proc pointer type for @ref wgpuRenderPassEncoderDrawIndirect:
		* > @copydoc wgpuRenderPassEncoderDrawIndirect
		*/
		public function void WGPUProcRenderPassEncoderDrawIndirect(WGPURenderPassEncoder renderPassEncoder, WGPUBuffer indirectBuffer, uint64 indirectOffset);
		/**
		* Proc pointer type for @ref wgpuRenderPassEncoderEnd:
		* > @copydoc wgpuRenderPassEncoderEnd
		*/
		public function void WGPUProcRenderPassEncoderEnd(WGPURenderPassEncoder renderPassEncoder);
		/**
		* Proc pointer type for @ref wgpuRenderPassEncoderEndOcclusionQuery:
		* > @copydoc wgpuRenderPassEncoderEndOcclusionQuery
		*/
		public function void WGPUProcRenderPassEncoderEndOcclusionQuery(WGPURenderPassEncoder renderPassEncoder);
		/**
		* Proc pointer type for @ref wgpuRenderPassEncoderExecuteBundles:
		* > @copydoc wgpuRenderPassEncoderExecuteBundles
		*/
		public function void WGPUProcRenderPassEncoderExecuteBundles(WGPURenderPassEncoder renderPassEncoder, c_size bundleCount, WGPURenderBundle* bundles);
		/**
		* Proc pointer type for @ref wgpuRenderPassEncoderInsertDebugMarker:
		* > @copydoc wgpuRenderPassEncoderInsertDebugMarker
		*/
		public function void WGPUProcRenderPassEncoderInsertDebugMarker(WGPURenderPassEncoder renderPassEncoder, WGPUStringView markerLabel);
		/**
		* Proc pointer type for @ref wgpuRenderPassEncoderPopDebugGroup:
		* > @copydoc wgpuRenderPassEncoderPopDebugGroup
		*/
		public function void WGPUProcRenderPassEncoderPopDebugGroup(WGPURenderPassEncoder renderPassEncoder);
		/**
		* Proc pointer type for @ref wgpuRenderPassEncoderPushDebugGroup:
		* > @copydoc wgpuRenderPassEncoderPushDebugGroup
		*/
		public function void WGPUProcRenderPassEncoderPushDebugGroup(WGPURenderPassEncoder renderPassEncoder, WGPUStringView groupLabel);
		/**
		* Proc pointer type for @ref wgpuRenderPassEncoderSetBindGroup:
		* > @copydoc wgpuRenderPassEncoderSetBindGroup
		*/
		public function void WGPUProcRenderPassEncoderSetBindGroup(WGPURenderPassEncoder renderPassEncoder, uint32 groupIndex, WGPUBindGroup group, c_size dynamicOffsetCount, uint32* dynamicOffsets);
		/**
		* Proc pointer type for @ref wgpuRenderPassEncoderSetBlendConstant:
		* > @copydoc wgpuRenderPassEncoderSetBlendConstant
		*/
		public function void WGPUProcRenderPassEncoderSetBlendConstant(WGPURenderPassEncoder renderPassEncoder, WGPUColor* color);
		/**
		* Proc pointer type for @ref wgpuRenderPassEncoderSetIndexBuffer:
		* > @copydoc wgpuRenderPassEncoderSetIndexBuffer
		*/
		public function void WGPUProcRenderPassEncoderSetIndexBuffer(WGPURenderPassEncoder renderPassEncoder, WGPUBuffer buffer, WGPUIndexFormat format, uint64 offset, uint64 size);
		/**
		* Proc pointer type for @ref wgpuRenderPassEncoderSetLabel:
		* > @copydoc wgpuRenderPassEncoderSetLabel
		*/
		public function void WGPUProcRenderPassEncoderSetLabel(WGPURenderPassEncoder renderPassEncoder, WGPUStringView label);
		/**
		* Proc pointer type for @ref wgpuRenderPassEncoderSetPipeline:
		* > @copydoc wgpuRenderPassEncoderSetPipeline
		*/
		public function void WGPUProcRenderPassEncoderSetPipeline(WGPURenderPassEncoder renderPassEncoder, WGPURenderPipeline pipeline);
		/**
		* Proc pointer type for @ref wgpuRenderPassEncoderSetScissorRect:
		* > @copydoc wgpuRenderPassEncoderSetScissorRect
		*/
		public function void WGPUProcRenderPassEncoderSetScissorRect(WGPURenderPassEncoder renderPassEncoder, uint32 x, uint32 y, uint32 width, uint32 height);
		/**
		* Proc pointer type for @ref wgpuRenderPassEncoderSetStencilReference:
		* > @copydoc wgpuRenderPassEncoderSetStencilReference
		*/
		public function void WGPUProcRenderPassEncoderSetStencilReference(WGPURenderPassEncoder renderPassEncoder, uint32 reference);
		/**
		* Proc pointer type for @ref wgpuRenderPassEncoderSetVertexBuffer:
		* > @copydoc wgpuRenderPassEncoderSetVertexBuffer
		*/
		public function void WGPUProcRenderPassEncoderSetVertexBuffer(WGPURenderPassEncoder renderPassEncoder, uint32 slot, WGPUBuffer buffer, uint64 offset, uint64 size);
		/**
		* Proc pointer type for @ref wgpuRenderPassEncoderSetViewport:
		* > @copydoc wgpuRenderPassEncoderSetViewport
		*/
		public function void WGPUProcRenderPassEncoderSetViewport(WGPURenderPassEncoder renderPassEncoder, float x, float y, float width, float height, float minDepth, float maxDepth);
		/**
		* Proc pointer type for @ref wgpuRenderPassEncoderAddRef.
		* > @copydoc wgpuRenderPassEncoderAddRef
		*/
		public function void WGPUProcRenderPassEncoderAddRef(WGPURenderPassEncoder renderPassEncoder);
		/**
		* Proc pointer type for @ref wgpuRenderPassEncoderRelease.
		* > @copydoc wgpuRenderPassEncoderRelease
		*/
		public function void WGPUProcRenderPassEncoderRelease(WGPURenderPassEncoder renderPassEncoder);

		// Procs of RenderPipeline
		/**
		* Proc pointer type for @ref wgpuRenderPipelineGetBindGroupLayout:
		* > @copydoc wgpuRenderPipelineGetBindGroupLayout
		*/
		public function WGPUBindGroupLayout WGPUProcRenderPipelineGetBindGroupLayout(WGPURenderPipeline renderPipeline, uint32 groupIndex);
		/**
		* Proc pointer type for @ref wgpuRenderPipelineSetLabel:
		* > @copydoc wgpuRenderPipelineSetLabel
		*/
		public function void WGPUProcRenderPipelineSetLabel(WGPURenderPipeline renderPipeline, WGPUStringView label);
		/**
		* Proc pointer type for @ref wgpuRenderPipelineAddRef.
		* > @copydoc wgpuRenderPipelineAddRef
		*/
		public function void WGPUProcRenderPipelineAddRef(WGPURenderPipeline renderPipeline);
		/**
		* Proc pointer type for @ref wgpuRenderPipelineRelease.
		* > @copydoc wgpuRenderPipelineRelease
		*/
		public function void WGPUProcRenderPipelineRelease(WGPURenderPipeline renderPipeline);

		// Procs of Sampler
		/**
		* Proc pointer type for @ref wgpuSamplerSetLabel:
		* > @copydoc wgpuSamplerSetLabel
		*/
		public function void WGPUProcSamplerSetLabel(WGPUSampler sampler, WGPUStringView label);
		/**
		* Proc pointer type for @ref wgpuSamplerAddRef.
		* > @copydoc wgpuSamplerAddRef
		*/
		public function void WGPUProcSamplerAddRef(WGPUSampler sampler);
		/**
		* Proc pointer type for @ref wgpuSamplerRelease.
		* > @copydoc wgpuSamplerRelease
		*/
		public function void WGPUProcSamplerRelease(WGPUSampler sampler);

		// Procs of ShaderModule
		/**
		* Proc pointer type for @ref wgpuShaderModuleGetCompilationInfo:
		* > @copydoc wgpuShaderModuleGetCompilationInfo
		*/
		public function WGPUFuture WGPUProcShaderModuleGetCompilationInfo(WGPUShaderModule shaderModule, WGPUCompilationInfoCallbackInfo callbackInfo);
		/**
		* Proc pointer type for @ref wgpuShaderModuleSetLabel:
		* > @copydoc wgpuShaderModuleSetLabel
		*/
		public function void WGPUProcShaderModuleSetLabel(WGPUShaderModule shaderModule, WGPUStringView label);
		/**
		* Proc pointer type for @ref wgpuShaderModuleAddRef.
		* > @copydoc wgpuShaderModuleAddRef
		*/
		public function void WGPUProcShaderModuleAddRef(WGPUShaderModule shaderModule);
		/**
		* Proc pointer type for @ref wgpuShaderModuleRelease.
		* > @copydoc wgpuShaderModuleRelease
		*/
		public function void WGPUProcShaderModuleRelease(WGPUShaderModule shaderModule);

		// Procs of SupportedFeatures
		/**
		* Proc pointer type for @ref wgpuSupportedFeaturesFreeMembers:
		* > @copydoc wgpuSupportedFeaturesFreeMembers
		*/
		public function void WGPUProcSupportedFeaturesFreeMembers(WGPUSupportedFeatures supportedFeatures);

		// Procs of SupportedWGSLLanguageFeatures
		/**
		* Proc pointer type for @ref wgpuSupportedWGSLLanguageFeaturesFreeMembers:
		* > @copydoc wgpuSupportedWGSLLanguageFeaturesFreeMembers
		*/
		public function void WGPUProcSupportedWGSLLanguageFeaturesFreeMembers(WGPUSupportedWGSLLanguageFeatures supportedWGSLLanguageFeatures);

		// Procs of Surface
		/**
		* Proc pointer type for @ref wgpuSurfaceConfigure:
		* > @copydoc wgpuSurfaceConfigure
		*/
		public function void WGPUProcSurfaceConfigure(WGPUSurface surface, WGPUSurfaceConfiguration* config);
		/**
		* Proc pointer type for @ref wgpuSurfaceGetCapabilities:
		* > @copydoc wgpuSurfaceGetCapabilities
		*/
		public function WGPUStatus WGPUProcSurfaceGetCapabilities(WGPUSurface surface, WGPUAdapter adapter, WGPUSurfaceCapabilities* capabilities);
		/**
		* Proc pointer type for @ref wgpuSurfaceGetCurrentTexture:
		* > @copydoc wgpuSurfaceGetCurrentTexture
		*/
		public function void WGPUProcSurfaceGetCurrentTexture(WGPUSurface surface, WGPUSurfaceTexture* surfaceTexture);
		/**
		* Proc pointer type for @ref wgpuSurfacePresent:
		* > @copydoc wgpuSurfacePresent
		*/
		public function WGPUStatus WGPUProcSurfacePresent(WGPUSurface surface);
		/**
		* Proc pointer type for @ref wgpuSurfaceSetLabel:
		* > @copydoc wgpuSurfaceSetLabel
		*/
		public function void WGPUProcSurfaceSetLabel(WGPUSurface surface, WGPUStringView label);
		/**
		* Proc pointer type for @ref wgpuSurfaceUnconfigure:
		* > @copydoc wgpuSurfaceUnconfigure
		*/
		public function void WGPUProcSurfaceUnconfigure(WGPUSurface surface);
		/**
		* Proc pointer type for @ref wgpuSurfaceAddRef.
		* > @copydoc wgpuSurfaceAddRef
		*/
		public function void WGPUProcSurfaceAddRef(WGPUSurface surface);
		/**
		* Proc pointer type for @ref wgpuSurfaceRelease.
		* > @copydoc wgpuSurfaceRelease
		*/
		public function void WGPUProcSurfaceRelease(WGPUSurface surface);

		// Procs of SurfaceCapabilities
		/**
		* Proc pointer type for @ref wgpuSurfaceCapabilitiesFreeMembers:
		* > @copydoc wgpuSurfaceCapabilitiesFreeMembers
		*/
		public function void WGPUProcSurfaceCapabilitiesFreeMembers(WGPUSurfaceCapabilities surfaceCapabilities);

		// Procs of Texture
		/**
		* Proc pointer type for @ref wgpuTextureCreateView:
		* > @copydoc wgpuTextureCreateView
		*/
		public function WGPUTextureView WGPUProcTextureCreateView(WGPUTexture texture, WGPUTextureViewDescriptor* descriptor);
		/**
		* Proc pointer type for @ref wgpuTextureDestroy:
		* > @copydoc wgpuTextureDestroy
		*/
		public function void WGPUProcTextureDestroy(WGPUTexture texture);
		/**
		* Proc pointer type for @ref wgpuTextureGetDepthOrArrayLayers:
		* > @copydoc wgpuTextureGetDepthOrArrayLayers
		*/
		public function uint32 WGPUProcTextureGetDepthOrArrayLayers(WGPUTexture texture);
		/**
		* Proc pointer type for @ref wgpuTextureGetDimension:
		* > @copydoc wgpuTextureGetDimension
		*/
		public function WGPUTextureDimension WGPUProcTextureGetDimension(WGPUTexture texture);
		/**
		* Proc pointer type for @ref wgpuTextureGetFormat:
		* > @copydoc wgpuTextureGetFormat
		*/
		public function WGPUTextureFormat WGPUProcTextureGetFormat(WGPUTexture texture);
		/**
		* Proc pointer type for @ref wgpuTextureGetHeight:
		* > @copydoc wgpuTextureGetHeight
		*/
		public function uint32 WGPUProcTextureGetHeight(WGPUTexture texture);
		/**
		* Proc pointer type for @ref wgpuTextureGetMipLevelCount:
		* > @copydoc wgpuTextureGetMipLevelCount
		*/
		public function uint32 WGPUProcTextureGetMipLevelCount(WGPUTexture texture);
		/**
		* Proc pointer type for @ref wgpuTextureGetSampleCount:
		* > @copydoc wgpuTextureGetSampleCount
		*/
		public function uint32 WGPUProcTextureGetSampleCount(WGPUTexture texture);
		/**
		* Proc pointer type for @ref wgpuTextureGetUsage:
		* > @copydoc wgpuTextureGetUsage
		*/
		public function WGPUTextureUsage WGPUProcTextureGetUsage(WGPUTexture texture);
		/**
		* Proc pointer type for @ref wgpuTextureGetWidth:
		* > @copydoc wgpuTextureGetWidth
		*/
		public function uint32 WGPUProcTextureGetWidth(WGPUTexture texture);
		/**
		* Proc pointer type for @ref wgpuTextureSetLabel:
		* > @copydoc wgpuTextureSetLabel
		*/
		public function void WGPUProcTextureSetLabel(WGPUTexture texture, WGPUStringView label);
		/**
		* Proc pointer type for @ref wgpuTextureAddRef.
		* > @copydoc wgpuTextureAddRef
		*/
		public function void WGPUProcTextureAddRef(WGPUTexture texture);
		/**
		* Proc pointer type for @ref wgpuTextureRelease.
		* > @copydoc wgpuTextureRelease
		*/
		public function void WGPUProcTextureRelease(WGPUTexture texture);

		// Procs of TextureView
		/**
		* Proc pointer type for @ref wgpuTextureViewSetLabel:
		* > @copydoc wgpuTextureViewSetLabel
		*/
		public function void WGPUProcTextureViewSetLabel(WGPUTextureView textureView, WGPUStringView label);
		/**
		* Proc pointer type for @ref wgpuTextureViewAddRef.
		* > @copydoc wgpuTextureViewAddRef
		*/
		public function void WGPUProcTextureViewAddRef(WGPUTextureView textureView);
		/**
		* Proc pointer type for @ref wgpuTextureViewRelease.
		* > @copydoc wgpuTextureViewRelease
		*/
		public function void WGPUProcTextureViewRelease(WGPUTextureView textureView);

		public function void WGPULogCallback(WGPULogLevel level, WGPUStringView message, void* userdata);


		/**
		* \defgroup GlobalFunctions Global Functions
		* \brief Functions that are not specific to an object.
		*/
		/**
		* Create a WGPUInstance
		*/
		[LinkName("wgpuCreateInstance")]
		public static extern WGPUInstance wgpuCreateInstance(WGPUInstanceDescriptor* descriptor);
		/**
		* Query the supported instance capabilities.
		*
		* @param capabilities
		* The supported instance capabilities
		*
		* @returns
		* Indicates if there was an @ref OutStructChainError.
		*/
		[LinkName("wgpuGetInstanceCapabilities")]
		public static extern WGPUStatus wgpuGetInstanceCapabilities(WGPUInstanceCapabilities* capabilities);
		/**
		* Returns the "procedure address" (function pointer) of the named function.
		* The result must be cast to the appropriate proc pointer type.
		*/
		[LinkName("wgpuGetProcAddress")]
		public static extern WGPUProc wgpuGetProcAddress(WGPUStringView procName);

		/**
		* \defgroup Methods
		* \brief Functions that are relative to a specific object.
		*/

		/**
		* \defgroup WGPUAdapterMethods WGPUAdapter methods
		* \brief Functions whose first argument has type WGPUAdapter.
		*/
		/**
		* Get the list of @ref WGPUFeatureName values supported by the adapter.
		*
		* @param features
		* This parameter is @ref ReturnedWithOwnership.
		*/
		[LinkName("wgpuAdapterGetFeatures")]
		public static extern void wgpuAdapterGetFeatures(WGPUAdapter adapter, WGPUSupportedFeatures* features);
		/**
		* @param info
		* This parameter is @ref ReturnedWithOwnership.
		*
		* @returns
		* Indicates if there was an @ref OutStructChainError.
		*/
		[LinkName("wgpuAdapterGetInfo")]
		public static extern WGPUStatus wgpuAdapterGetInfo(WGPUAdapter adapter, WGPUAdapterInfo* info);
		/**
		* @returns
		* Indicates if there was an @ref OutStructChainError.
		*/
		[LinkName("wgpuAdapterGetLimits")]
		public static extern WGPUStatus wgpuAdapterGetLimits(WGPUAdapter adapter, WGPULimits* limits);
		[LinkName("wgpuAdapterHasFeature")]
		public static extern WGPUBool wgpuAdapterHasFeature(WGPUAdapter adapter, WGPUFeatureName feature);
		[LinkName("wgpuAdapterRequestDevice")]
		public static extern WGPUFuture wgpuAdapterRequestDevice(WGPUAdapter adapter, WGPUDeviceDescriptor* descriptor, WGPURequestDeviceCallbackInfo callbackInfo);
		[LinkName("wgpuAdapterAddRef")]
		public static extern void wgpuAdapterAddRef(WGPUAdapter adapter);
		[LinkName("wgpuAdapterRelease")]
		public static extern void wgpuAdapterRelease(WGPUAdapter adapter);



		/**
		* \defgroup WGPUAdapterInfoMethods WGPUAdapterInfo methods
		* \brief Functions whose first argument has type WGPUAdapterInfo.
		*/
		/**
		* Frees array members of WGPUAdapterInfo which were allocated by the API.
		*/
		[LinkName("wgpuAdapterInfoFreeMembers")]
		public static extern void wgpuAdapterInfoFreeMembers(WGPUAdapterInfo adapterInfo);



		/**
		* \defgroup WGPUBindGroupMethods WGPUBindGroup methods
		* \brief Functions whose first argument has type WGPUBindGroup.
		*/
		[LinkName("wgpuBindGroupSetLabel")]
		public static extern void wgpuBindGroupSetLabel(WGPUBindGroup bindGroup, WGPUStringView label);
		[LinkName("wgpuBindGroupAddRef")]
		public static extern void wgpuBindGroupAddRef(WGPUBindGroup bindGroup);
		[LinkName("wgpuBindGroupRelease")]
		public static extern void wgpuBindGroupRelease(WGPUBindGroup bindGroup);



		/**
		* \defgroup WGPUBindGroupLayoutMethods WGPUBindGroupLayout methods
		* \brief Functions whose first argument has type WGPUBindGroupLayout.
		*/
		[LinkName("wgpuBindGroupLayoutSetLabel")]
		public static extern void wgpuBindGroupLayoutSetLabel(WGPUBindGroupLayout bindGroupLayout, WGPUStringView label);
		[LinkName("wgpuBindGroupLayoutAddRef")]
		public static extern void wgpuBindGroupLayoutAddRef(WGPUBindGroupLayout bindGroupLayout);
		[LinkName("wgpuBindGroupLayoutRelease")]
		public static extern void wgpuBindGroupLayoutRelease(WGPUBindGroupLayout bindGroupLayout);



		/**
		* \defgroup WGPUBufferMethods WGPUBuffer methods
		* \brief Functions whose first argument has type WGPUBuffer.
		*/
		[LinkName("wgpuBufferDestroy")]
		public static extern void wgpuBufferDestroy(WGPUBuffer buffer);
		/**
		* @param offset
		* Byte offset relative to the beginning of the buffer.
		*
		* @param size
		* Byte size of the range to get. The returned pointer is valid for exactly this many bytes.
		*
		* @returns
		* Returns a const pointer to beginning of the mapped range.
		* It must not be written; writing to this range causes undefined behavior.
		* Returns `NULL` with @ref ImplementationDefinedLogging if:
		*
		* - There is any content-timeline error as defined in the WebGPU specification for `getMappedRange()` (alignments, overlaps, etc.)
		*   **except** for overlaps with other *const* ranges, which are allowed in C.
		*   (JS does not allow this because const ranges do not exist.)
		*/
		[LinkName("wgpuBufferGetConstMappedRange")]
		public static extern void* wgpuBufferGetConstMappedRange(WGPUBuffer buffer, c_size offset, c_size size);
		[LinkName("wgpuBufferGetMapState")]
		public static extern WGPUBufferMapState wgpuBufferGetMapState(WGPUBuffer buffer);
		/**
		* @param offset
		* Byte offset relative to the beginning of the buffer.
		*
		* @param size
		* Byte size of the range to get. The returned pointer is valid for exactly this many bytes.
		*
		* @returns
		* Returns a mutable pointer to beginning of the mapped range.
		* Returns `NULL` with @ref ImplementationDefinedLogging if:
		*
		* - There is any content-timeline error as defined in the WebGPU specification for `getMappedRange()` (alignments, overlaps, etc.)
		* - The buffer is not mapped with @ref WGPUMapMode_Write.
		*/
		[LinkName("wgpuBufferGetMappedRange")]
		public static extern void* wgpuBufferGetMappedRange(WGPUBuffer buffer, c_size offset, c_size size);
		[LinkName("wgpuBufferGetSize")]
		public static extern uint64 wgpuBufferGetSize(WGPUBuffer buffer);
		[LinkName("wgpuBufferGetUsage")]
		public static extern WGPUBufferUsage wgpuBufferGetUsage(WGPUBuffer buffer);
		[LinkName("wgpuBufferMapAsync")]
		public static extern WGPUFuture wgpuBufferMapAsync(WGPUBuffer buffer, WGPUMapMode mode, c_size offset, c_size size, WGPUBufferMapCallbackInfo callbackInfo);
		[LinkName("wgpuBufferSetLabel")]
		public static extern void wgpuBufferSetLabel(WGPUBuffer buffer, WGPUStringView label);
		[LinkName("wgpuBufferUnmap")]
		public static extern void wgpuBufferUnmap(WGPUBuffer buffer);
		[LinkName("wgpuBufferAddRef")]
		public static extern void wgpuBufferAddRef(WGPUBuffer buffer);
		[LinkName("wgpuBufferRelease")]
		public static extern void wgpuBufferRelease(WGPUBuffer buffer);



		/**
		* \defgroup WGPUCommandBufferMethods WGPUCommandBuffer methods
		* \brief Functions whose first argument has type WGPUCommandBuffer.
		*/
		[LinkName("wgpuCommandBufferSetLabel")]
		public static extern void wgpuCommandBufferSetLabel(WGPUCommandBuffer commandBuffer, WGPUStringView label);
		[LinkName("wgpuCommandBufferAddRef")]
		public static extern void wgpuCommandBufferAddRef(WGPUCommandBuffer commandBuffer);
		[LinkName("wgpuCommandBufferRelease")]
		public static extern void wgpuCommandBufferRelease(WGPUCommandBuffer commandBuffer);



		/**
		* \defgroup WGPUCommandEncoderMethods WGPUCommandEncoder methods
		* \brief Functions whose first argument has type WGPUCommandEncoder.
		*/
		[LinkName("wgpuCommandEncoderBeginComputePass")]
		public static extern WGPUComputePassEncoder wgpuCommandEncoderBeginComputePass(WGPUCommandEncoder commandEncoder, WGPUComputePassDescriptor* descriptor);
		[LinkName("wgpuCommandEncoderBeginRenderPass")]
		public static extern WGPURenderPassEncoder wgpuCommandEncoderBeginRenderPass(WGPUCommandEncoder commandEncoder, WGPURenderPassDescriptor* descriptor);
		[LinkName("wgpuCommandEncoderClearBuffer")]
		public static extern void wgpuCommandEncoderClearBuffer(WGPUCommandEncoder commandEncoder, WGPUBuffer buffer, uint64 offset, uint64 size);
		[LinkName("wgpuCommandEncoderCopyBufferToBuffer")]
		public static extern void wgpuCommandEncoderCopyBufferToBuffer(WGPUCommandEncoder commandEncoder, WGPUBuffer source, uint64 sourceOffset, WGPUBuffer destination, uint64 destinationOffset, uint64 size);
		[LinkName("wgpuCommandEncoderCopyBufferToTexture")]
		public static extern void wgpuCommandEncoderCopyBufferToTexture(WGPUCommandEncoder commandEncoder, WGPUTexelCopyBufferInfo* source, WGPUTexelCopyTextureInfo* destination, WGPUExtent3D* copySize);
		[LinkName("wgpuCommandEncoderCopyTextureToBuffer")]
		public static extern void wgpuCommandEncoderCopyTextureToBuffer(WGPUCommandEncoder commandEncoder, WGPUTexelCopyTextureInfo* source, WGPUTexelCopyBufferInfo* destination, WGPUExtent3D* copySize);
		[LinkName("wgpuCommandEncoderCopyTextureToTexture")]
		public static extern void wgpuCommandEncoderCopyTextureToTexture(WGPUCommandEncoder commandEncoder, WGPUTexelCopyTextureInfo* source, WGPUTexelCopyTextureInfo* destination, WGPUExtent3D* copySize);
		[LinkName("wgpuCommandEncoderFinish")]
		public static extern WGPUCommandBuffer wgpuCommandEncoderFinish(WGPUCommandEncoder commandEncoder, WGPUCommandBufferDescriptor* descriptor);
		[LinkName("wgpuCommandEncoderInsertDebugMarker")]
		public static extern void wgpuCommandEncoderInsertDebugMarker(WGPUCommandEncoder commandEncoder, WGPUStringView markerLabel);
		[LinkName("wgpuCommandEncoderPopDebugGroup")]
		public static extern void wgpuCommandEncoderPopDebugGroup(WGPUCommandEncoder commandEncoder);
		[LinkName("wgpuCommandEncoderPushDebugGroup")]
		public static extern void wgpuCommandEncoderPushDebugGroup(WGPUCommandEncoder commandEncoder, WGPUStringView groupLabel);
		[LinkName("wgpuCommandEncoderResolveQuerySet")]
		public static extern void wgpuCommandEncoderResolveQuerySet(WGPUCommandEncoder commandEncoder, WGPUQuerySet querySet, uint32 firstQuery, uint32 queryCount, WGPUBuffer destination, uint64 destinationOffset);
		[LinkName("wgpuCommandEncoderSetLabel")]
		public static extern void wgpuCommandEncoderSetLabel(WGPUCommandEncoder commandEncoder, WGPUStringView label);
		[LinkName("wgpuCommandEncoderWriteTimestamp")]
		public static extern void wgpuCommandEncoderWriteTimestamp(WGPUCommandEncoder commandEncoder, WGPUQuerySet querySet, uint32 queryIndex);
		[LinkName("wgpuCommandEncoderAddRef")]
		public static extern void wgpuCommandEncoderAddRef(WGPUCommandEncoder commandEncoder);
		[LinkName("wgpuCommandEncoderRelease")]
		public static extern void wgpuCommandEncoderRelease(WGPUCommandEncoder commandEncoder);



		/**
		* \defgroup WGPUComputePassEncoderMethods WGPUComputePassEncoder methods
		* \brief Functions whose first argument has type WGPUComputePassEncoder.
		*/
		[LinkName("wgpuComputePassEncoderDispatchWorkgroups")]
		public static extern void wgpuComputePassEncoderDispatchWorkgroups(WGPUComputePassEncoder computePassEncoder, uint32 workgroupCountX, uint32 workgroupCountY, uint32 workgroupCountZ);
		[LinkName("wgpuComputePassEncoderDispatchWorkgroupsIndirect")]
		public static extern void wgpuComputePassEncoderDispatchWorkgroupsIndirect(WGPUComputePassEncoder computePassEncoder, WGPUBuffer indirectBuffer, uint64 indirectOffset);
		[LinkName("wgpuComputePassEncoderEnd")]
		public static extern void wgpuComputePassEncoderEnd(WGPUComputePassEncoder computePassEncoder);
		[LinkName("wgpuComputePassEncoderInsertDebugMarker")]
		public static extern void wgpuComputePassEncoderInsertDebugMarker(WGPUComputePassEncoder computePassEncoder, WGPUStringView markerLabel);
		[LinkName("wgpuComputePassEncoderPopDebugGroup")]
		public static extern void wgpuComputePassEncoderPopDebugGroup(WGPUComputePassEncoder computePassEncoder);
		[LinkName("wgpuComputePassEncoderPushDebugGroup")]
		public static extern void wgpuComputePassEncoderPushDebugGroup(WGPUComputePassEncoder computePassEncoder, WGPUStringView groupLabel);
		[LinkName("wgpuComputePassEncoderSetBindGroup")]
		public static extern void wgpuComputePassEncoderSetBindGroup(WGPUComputePassEncoder computePassEncoder, uint32 groupIndex, WGPUBindGroup group, c_size dynamicOffsetCount, uint32* dynamicOffsets);
		[LinkName("wgpuComputePassEncoderSetLabel")]
		public static extern void wgpuComputePassEncoderSetLabel(WGPUComputePassEncoder computePassEncoder, WGPUStringView label);
		[LinkName("wgpuComputePassEncoderSetPipeline")]
		public static extern void wgpuComputePassEncoderSetPipeline(WGPUComputePassEncoder computePassEncoder, WGPUComputePipeline pipeline);
		[LinkName("wgpuComputePassEncoderAddRef")]
		public static extern void wgpuComputePassEncoderAddRef(WGPUComputePassEncoder computePassEncoder);
		[LinkName("wgpuComputePassEncoderRelease")]
		public static extern void wgpuComputePassEncoderRelease(WGPUComputePassEncoder computePassEncoder);



		/**
		* \defgroup WGPUComputePipelineMethods WGPUComputePipeline methods
		* \brief Functions whose first argument has type WGPUComputePipeline.
		*/
		[LinkName("wgpuComputePipelineGetBindGroupLayout")]
		public static extern WGPUBindGroupLayout wgpuComputePipelineGetBindGroupLayout(WGPUComputePipeline computePipeline, uint32 groupIndex);
		[LinkName("wgpuComputePipelineSetLabel")]
		public static extern void wgpuComputePipelineSetLabel(WGPUComputePipeline computePipeline, WGPUStringView label);
		[LinkName("wgpuComputePipelineAddRef")]
		public static extern void wgpuComputePipelineAddRef(WGPUComputePipeline computePipeline);
		[LinkName("wgpuComputePipelineRelease")]
		public static extern void wgpuComputePipelineRelease(WGPUComputePipeline computePipeline);



		/**
		* \defgroup WGPUDeviceMethods WGPUDevice methods
		* \brief Functions whose first argument has type WGPUDevice.
		*/
		[LinkName("wgpuDeviceCreateBindGroup")]
		public static extern WGPUBindGroup wgpuDeviceCreateBindGroup(WGPUDevice device, WGPUBindGroupDescriptor* descriptor);
		[LinkName("wgpuDeviceCreateBindGroupLayout")]
		public static extern WGPUBindGroupLayout wgpuDeviceCreateBindGroupLayout(WGPUDevice device, WGPUBindGroupLayoutDescriptor* descriptor);
		[LinkName("wgpuDeviceCreateBuffer")]
		public static extern WGPUBuffer wgpuDeviceCreateBuffer(WGPUDevice device, WGPUBufferDescriptor* descriptor);
		[LinkName("wgpuDeviceCreateCommandEncoder")]
		public static extern WGPUCommandEncoder wgpuDeviceCreateCommandEncoder(WGPUDevice device, WGPUCommandEncoderDescriptor* descriptor);
		[LinkName("wgpuDeviceCreateComputePipeline")]
		public static extern WGPUComputePipeline wgpuDeviceCreateComputePipeline(WGPUDevice device, WGPUComputePipelineDescriptor* descriptor);
		[LinkName("wgpuDeviceCreateComputePipelineAsync")]
		public static extern WGPUFuture wgpuDeviceCreateComputePipelineAsync(WGPUDevice device, WGPUComputePipelineDescriptor* descriptor, WGPUCreateComputePipelineAsyncCallbackInfo callbackInfo);
		[LinkName("wgpuDeviceCreatePipelineLayout")]
		public static extern WGPUPipelineLayout wgpuDeviceCreatePipelineLayout(WGPUDevice device, WGPUPipelineLayoutDescriptor* descriptor);
		[LinkName("wgpuDeviceCreateQuerySet")]
		public static extern WGPUQuerySet wgpuDeviceCreateQuerySet(WGPUDevice device, WGPUQuerySetDescriptor* descriptor);
		[LinkName("wgpuDeviceCreateRenderBundleEncoder")]
		public static extern WGPURenderBundleEncoder wgpuDeviceCreateRenderBundleEncoder(WGPUDevice device, WGPURenderBundleEncoderDescriptor* descriptor);
		[LinkName("wgpuDeviceCreateRenderPipeline")]
		public static extern WGPURenderPipeline wgpuDeviceCreateRenderPipeline(WGPUDevice device, WGPURenderPipelineDescriptor* descriptor);
		[LinkName("wgpuDeviceCreateRenderPipelineAsync")]
		public static extern WGPUFuture wgpuDeviceCreateRenderPipelineAsync(WGPUDevice device, WGPURenderPipelineDescriptor* descriptor, WGPUCreateRenderPipelineAsyncCallbackInfo callbackInfo);
		[LinkName("wgpuDeviceCreateSampler")]
		public static extern WGPUSampler wgpuDeviceCreateSampler(WGPUDevice device, WGPUSamplerDescriptor* descriptor);
		[LinkName("wgpuDeviceCreateShaderModule")]
		public static extern WGPUShaderModule wgpuDeviceCreateShaderModule(WGPUDevice device, WGPUShaderModuleDescriptor* descriptor);
		[LinkName("wgpuDeviceCreateTexture")]
		public static extern WGPUTexture wgpuDeviceCreateTexture(WGPUDevice device, WGPUTextureDescriptor* descriptor);
		[LinkName("wgpuDeviceDestroy")]
		public static extern void wgpuDeviceDestroy(WGPUDevice device);
		[LinkName("wgpuDeviceGetAdapterInfo")]
		public static extern WGPUAdapterInfo wgpuDeviceGetAdapterInfo(WGPUDevice device);
		/**
		* Get the list of @ref WGPUFeatureName values supported by the device.
		*
		* @param features
		* This parameter is @ref ReturnedWithOwnership.
		*/
		[LinkName("wgpuDeviceGetFeatures")]
		public static extern void wgpuDeviceGetFeatures(WGPUDevice device, WGPUSupportedFeatures* features);
		/**
		* @returns
		* Indicates if there was an @ref OutStructChainError.
		*/
		[LinkName("wgpuDeviceGetLimits")]
		public static extern WGPUStatus wgpuDeviceGetLimits(WGPUDevice device, WGPULimits* limits);
		/**
		* @returns
		* The @ref WGPUFuture for the device-lost event of the device.
		*/
		[LinkName("wgpuDeviceGetLostFuture")]
		public static extern WGPUFuture wgpuDeviceGetLostFuture(WGPUDevice device);
		[LinkName("wgpuDeviceGetQueue")]
		public static extern WGPUQueue wgpuDeviceGetQueue(WGPUDevice device);
		[LinkName("wgpuDeviceHasFeature")]
		public static extern WGPUBool wgpuDeviceHasFeature(WGPUDevice device, WGPUFeatureName feature);
		[LinkName("wgpuDevicePopErrorScope")]
		public static extern WGPUFuture wgpuDevicePopErrorScope(WGPUDevice device, WGPUPopErrorScopeCallbackInfo callbackInfo);
		[LinkName("wgpuDevicePushErrorScope")]
		public static extern void wgpuDevicePushErrorScope(WGPUDevice device, WGPUErrorFilter filter);
		[LinkName("wgpuDeviceSetLabel")]
		public static extern void wgpuDeviceSetLabel(WGPUDevice device, WGPUStringView label);
		[LinkName("wgpuDeviceAddRef")]
		public static extern void wgpuDeviceAddRef(WGPUDevice device);
		[LinkName("wgpuDeviceRelease")]
		public static extern void wgpuDeviceRelease(WGPUDevice device);



		/**
		* \defgroup WGPUInstanceMethods WGPUInstance methods
		* \brief Functions whose first argument has type WGPUInstance.
		*/
		/**
		* Creates a @ref WGPUSurface, see @ref Surface-Creation for more details.
		*
		* @param descriptor
		* The description of the @ref WGPUSurface to create.
		*
		* @returns
		* A new @ref WGPUSurface for this descriptor (or an error @ref WGPUSurface).
		*/
		[LinkName("wgpuInstanceCreateSurface")]
		public static extern WGPUSurface wgpuInstanceCreateSurface(WGPUInstance instance, WGPUSurfaceDescriptor* descriptor);
		/**
		* Get the list of @ref WGPUWGSLLanguageFeatureName values supported by the instance.
		*/
		[LinkName("wgpuInstanceGetWGSLLanguageFeatures")]
		public static extern WGPUStatus wgpuInstanceGetWGSLLanguageFeatures(WGPUInstance instance, WGPUSupportedWGSLLanguageFeatures* features);
		[LinkName("wgpuInstanceHasWGSLLanguageFeature")]
		public static extern WGPUBool wgpuInstanceHasWGSLLanguageFeature(WGPUInstance instance, WGPUWGSLLanguageFeatureName feature);
		/**
		* Processes asynchronous events on this `WGPUInstance`, calling any callbacks for asynchronous operations created with `::WGPUCallbackMode_AllowProcessEvents`.
		*
		* See @ref Process-Events for more information.
		*/
		[LinkName("wgpuInstanceProcessEvents")]
		public static extern void wgpuInstanceProcessEvents(WGPUInstance instance);
		[LinkName("wgpuInstanceRequestAdapter")]
		public static extern WGPUFuture wgpuInstanceRequestAdapter(WGPUInstance instance, WGPURequestAdapterOptions* options, WGPURequestAdapterCallbackInfo callbackInfo);
		/**
		* Wait for at least one WGPUFuture in `futures` to complete, and call callbacks of the respective completed asynchronous operations.
		*
		* See @ref Wait-Any for more information.
		*/
		[LinkName("wgpuInstanceWaitAny")]
		public static extern WGPUWaitStatus wgpuInstanceWaitAny(WGPUInstance instance, c_size futureCount, WGPUFutureWaitInfo* futures, uint64 timeoutNS);
		[LinkName("wgpuInstanceAddRef")]
		public static extern void wgpuInstanceAddRef(WGPUInstance instance);
		[LinkName("wgpuInstanceRelease")]
		public static extern void wgpuInstanceRelease(WGPUInstance instance);



		/**
		* \defgroup WGPUPipelineLayoutMethods WGPUPipelineLayout methods
		* \brief Functions whose first argument has type WGPUPipelineLayout.
		*/
		[LinkName("wgpuPipelineLayoutSetLabel")]
		public static extern void wgpuPipelineLayoutSetLabel(WGPUPipelineLayout pipelineLayout, WGPUStringView label);
		[LinkName("wgpuPipelineLayoutAddRef")]
		public static extern void wgpuPipelineLayoutAddRef(WGPUPipelineLayout pipelineLayout);
		[LinkName("wgpuPipelineLayoutRelease")]
		public static extern void wgpuPipelineLayoutRelease(WGPUPipelineLayout pipelineLayout);



		/**
		* \defgroup WGPUQuerySetMethods WGPUQuerySet methods
		* \brief Functions whose first argument has type WGPUQuerySet.
		*/
		[LinkName("wgpuQuerySetDestroy")]
		public static extern void wgpuQuerySetDestroy(WGPUQuerySet querySet);
		[LinkName("wgpuQuerySetGetCount")]
		public static extern uint32 wgpuQuerySetGetCount(WGPUQuerySet querySet);
		[LinkName("wgpuQuerySetGetType")]
		public static extern WGPUQueryType wgpuQuerySetGetType(WGPUQuerySet querySet);
		[LinkName("wgpuQuerySetSetLabel")]
		public static extern void wgpuQuerySetSetLabel(WGPUQuerySet querySet, WGPUStringView label);
		[LinkName("wgpuQuerySetAddRef")]
		public static extern void wgpuQuerySetAddRef(WGPUQuerySet querySet);
		[LinkName("wgpuQuerySetRelease")]
		public static extern void wgpuQuerySetRelease(WGPUQuerySet querySet);



		/**
		* \defgroup WGPUQueueMethods WGPUQueue methods
		* \brief Functions whose first argument has type WGPUQueue.
		*/
		[LinkName("wgpuQueueOnSubmittedWorkDone")]
		public static extern WGPUFuture wgpuQueueOnSubmittedWorkDone(WGPUQueue queue, WGPUQueueWorkDoneCallbackInfo callbackInfo);
		[LinkName("wgpuQueueSetLabel")]
		public static extern void wgpuQueueSetLabel(WGPUQueue queue, WGPUStringView label);
		[LinkName("wgpuQueueSubmit")]
		public static extern void wgpuQueueSubmit(WGPUQueue queue, c_size commandCount, WGPUCommandBuffer* commands);
		/**
		* Produces a @ref DeviceError both content-timeline (`size` alignment) and device-timeline
		* errors defined by the WebGPU specification.
		*/
		[LinkName("wgpuQueueWriteBuffer")]
		public static extern void wgpuQueueWriteBuffer(WGPUQueue queue, WGPUBuffer buffer, uint64 bufferOffset, void* data, c_size size);
		[LinkName("wgpuQueueWriteTexture")]
		public static extern void wgpuQueueWriteTexture(WGPUQueue queue, WGPUTexelCopyTextureInfo* destination, void* data, c_size dataSize, WGPUTexelCopyBufferLayout* dataLayout, WGPUExtent3D* writeSize);
		[LinkName("wgpuQueueAddRef")]
		public static extern void wgpuQueueAddRef(WGPUQueue queue);
		[LinkName("wgpuQueueRelease")]
		public static extern void wgpuQueueRelease(WGPUQueue queue);



		/**
		* \defgroup WGPURenderBundleMethods WGPURenderBundle methods
		* \brief Functions whose first argument has type WGPURenderBundle.
		*/
		[LinkName("wgpuRenderBundleSetLabel")]
		public static extern void wgpuRenderBundleSetLabel(WGPURenderBundle renderBundle, WGPUStringView label);
		[LinkName("wgpuRenderBundleAddRef")]
		public static extern void wgpuRenderBundleAddRef(WGPURenderBundle renderBundle);
		[LinkName("wgpuRenderBundleRelease")]
		public static extern void wgpuRenderBundleRelease(WGPURenderBundle renderBundle);



		/**
		* \defgroup WGPURenderBundleEncoderMethods WGPURenderBundleEncoder methods
		* \brief Functions whose first argument has type WGPURenderBundleEncoder.
		*/
		[LinkName("wgpuRenderBundleEncoderDraw")]
		public static extern void wgpuRenderBundleEncoderDraw(WGPURenderBundleEncoder renderBundleEncoder, uint32 vertexCount, uint32 instanceCount, uint32 firstVertex, uint32 firstInstance);
		[LinkName("wgpuRenderBundleEncoderDrawIndexed")]
		public static extern void wgpuRenderBundleEncoderDrawIndexed(WGPURenderBundleEncoder renderBundleEncoder, uint32 indexCount, uint32 instanceCount, uint32 firstIndex, int32 baseVertex, uint32 firstInstance);
		[LinkName("wgpuRenderBundleEncoderDrawIndexedIndirect")]
		public static extern void wgpuRenderBundleEncoderDrawIndexedIndirect(WGPURenderBundleEncoder renderBundleEncoder, WGPUBuffer indirectBuffer, uint64 indirectOffset);
		[LinkName("wgpuRenderBundleEncoderDrawIndirect")]
		public static extern void wgpuRenderBundleEncoderDrawIndirect(WGPURenderBundleEncoder renderBundleEncoder, WGPUBuffer indirectBuffer, uint64 indirectOffset);
		[LinkName("wgpuRenderBundleEncoderFinish")]
		public static extern WGPURenderBundle wgpuRenderBundleEncoderFinish(WGPURenderBundleEncoder renderBundleEncoder, WGPURenderBundleDescriptor* descriptor);
		[LinkName("wgpuRenderBundleEncoderInsertDebugMarker")]
		public static extern void wgpuRenderBundleEncoderInsertDebugMarker(WGPURenderBundleEncoder renderBundleEncoder, WGPUStringView markerLabel);
		[LinkName("wgpuRenderBundleEncoderPopDebugGroup")]
		public static extern void wgpuRenderBundleEncoderPopDebugGroup(WGPURenderBundleEncoder renderBundleEncoder);
		[LinkName("wgpuRenderBundleEncoderPushDebugGroup")]
		public static extern void wgpuRenderBundleEncoderPushDebugGroup(WGPURenderBundleEncoder renderBundleEncoder, WGPUStringView groupLabel);
		[LinkName("wgpuRenderBundleEncoderSetBindGroup")]
		public static extern void wgpuRenderBundleEncoderSetBindGroup(WGPURenderBundleEncoder renderBundleEncoder, uint32 groupIndex, WGPUBindGroup group, c_size dynamicOffsetCount, uint32* dynamicOffsets);
		[LinkName("wgpuRenderBundleEncoderSetIndexBuffer")]
		public static extern void wgpuRenderBundleEncoderSetIndexBuffer(WGPURenderBundleEncoder renderBundleEncoder, WGPUBuffer buffer, WGPUIndexFormat format, uint64 offset, uint64 size);
		[LinkName("wgpuRenderBundleEncoderSetLabel")]
		public static extern void wgpuRenderBundleEncoderSetLabel(WGPURenderBundleEncoder renderBundleEncoder, WGPUStringView label);
		[LinkName("wgpuRenderBundleEncoderSetPipeline")]
		public static extern void wgpuRenderBundleEncoderSetPipeline(WGPURenderBundleEncoder renderBundleEncoder, WGPURenderPipeline pipeline);
		[LinkName("wgpuRenderBundleEncoderSetVertexBuffer")]
		public static extern void wgpuRenderBundleEncoderSetVertexBuffer(WGPURenderBundleEncoder renderBundleEncoder, uint32 slot, WGPUBuffer buffer, uint64 offset, uint64 size);
		[LinkName("wgpuRenderBundleEncoderAddRef")]
		public static extern void wgpuRenderBundleEncoderAddRef(WGPURenderBundleEncoder renderBundleEncoder);
		[LinkName("wgpuRenderBundleEncoderRelease")]
		public static extern void wgpuRenderBundleEncoderRelease(WGPURenderBundleEncoder renderBundleEncoder);



		/**
		* \defgroup WGPURenderPassEncoderMethods WGPURenderPassEncoder methods
		* \brief Functions whose first argument has type WGPURenderPassEncoder.
		*/
		[LinkName("wgpuRenderPassEncoderBeginOcclusionQuery")]
		public static extern void wgpuRenderPassEncoderBeginOcclusionQuery(WGPURenderPassEncoder renderPassEncoder, uint32 queryIndex);
		[LinkName("wgpuRenderPassEncoderDraw")]
		public static extern void wgpuRenderPassEncoderDraw(WGPURenderPassEncoder renderPassEncoder, uint32 vertexCount, uint32 instanceCount, uint32 firstVertex, uint32 firstInstance);
		[LinkName("wgpuRenderPassEncoderDrawIndexed")]
		public static extern void wgpuRenderPassEncoderDrawIndexed(WGPURenderPassEncoder renderPassEncoder, uint32 indexCount, uint32 instanceCount, uint32 firstIndex, int32 baseVertex, uint32 firstInstance);
		[LinkName("wgpuRenderPassEncoderDrawIndexedIndirect")]
		public static extern void wgpuRenderPassEncoderDrawIndexedIndirect(WGPURenderPassEncoder renderPassEncoder, WGPUBuffer indirectBuffer, uint64 indirectOffset);
		[LinkName("wgpuRenderPassEncoderDrawIndirect")]
		public static extern void wgpuRenderPassEncoderDrawIndirect(WGPURenderPassEncoder renderPassEncoder, WGPUBuffer indirectBuffer, uint64 indirectOffset);
		[LinkName("wgpuRenderPassEncoderEnd")]
		public static extern void wgpuRenderPassEncoderEnd(WGPURenderPassEncoder renderPassEncoder);
		[LinkName("wgpuRenderPassEncoderEndOcclusionQuery")]
		public static extern void wgpuRenderPassEncoderEndOcclusionQuery(WGPURenderPassEncoder renderPassEncoder);
		[LinkName("wgpuRenderPassEncoderExecuteBundles")]
		public static extern void wgpuRenderPassEncoderExecuteBundles(WGPURenderPassEncoder renderPassEncoder, c_size bundleCount, WGPURenderBundle* bundles);
		[LinkName("wgpuRenderPassEncoderInsertDebugMarker")]
		public static extern void wgpuRenderPassEncoderInsertDebugMarker(WGPURenderPassEncoder renderPassEncoder, WGPUStringView markerLabel);
		[LinkName("wgpuRenderPassEncoderPopDebugGroup")]
		public static extern void wgpuRenderPassEncoderPopDebugGroup(WGPURenderPassEncoder renderPassEncoder);
		[LinkName("wgpuRenderPassEncoderPushDebugGroup")]
		public static extern void wgpuRenderPassEncoderPushDebugGroup(WGPURenderPassEncoder renderPassEncoder, WGPUStringView groupLabel);
		[LinkName("wgpuRenderPassEncoderSetBindGroup")]
		public static extern void wgpuRenderPassEncoderSetBindGroup(WGPURenderPassEncoder renderPassEncoder, uint32 groupIndex, WGPUBindGroup group, c_size dynamicOffsetCount, uint32* dynamicOffsets);
		[LinkName("wgpuRenderPassEncoderSetBlendConstant")]
		public static extern void wgpuRenderPassEncoderSetBlendConstant(WGPURenderPassEncoder renderPassEncoder, WGPUColor* color);
		[LinkName("wgpuRenderPassEncoderSetIndexBuffer")]
		public static extern void wgpuRenderPassEncoderSetIndexBuffer(WGPURenderPassEncoder renderPassEncoder, WGPUBuffer buffer, WGPUIndexFormat format, uint64 offset, uint64 size);
		[LinkName("wgpuRenderPassEncoderSetLabel")]
		public static extern void wgpuRenderPassEncoderSetLabel(WGPURenderPassEncoder renderPassEncoder, WGPUStringView label);
		[LinkName("wgpuRenderPassEncoderSetPipeline")]
		public static extern void wgpuRenderPassEncoderSetPipeline(WGPURenderPassEncoder renderPassEncoder, WGPURenderPipeline pipeline);
		[LinkName("wgpuRenderPassEncoderSetScissorRect")]
		public static extern void wgpuRenderPassEncoderSetScissorRect(WGPURenderPassEncoder renderPassEncoder, uint32 x, uint32 y, uint32 width, uint32 height);
		[LinkName("wgpuRenderPassEncoderSetStencilReference")]
		public static extern void wgpuRenderPassEncoderSetStencilReference(WGPURenderPassEncoder renderPassEncoder, uint32 reference);
		[LinkName("wgpuRenderPassEncoderSetVertexBuffer")]
		public static extern void wgpuRenderPassEncoderSetVertexBuffer(WGPURenderPassEncoder renderPassEncoder, uint32 slot, WGPUBuffer buffer, uint64 offset, uint64 size);
		[LinkName("wgpuRenderPassEncoderSetViewport")]
		public static extern void wgpuRenderPassEncoderSetViewport(WGPURenderPassEncoder renderPassEncoder, float x, float y, float width, float height, float minDepth, float maxDepth);
		[LinkName("wgpuRenderPassEncoderAddRef")]
		public static extern void wgpuRenderPassEncoderAddRef(WGPURenderPassEncoder renderPassEncoder);
		[LinkName("wgpuRenderPassEncoderRelease")]
		public static extern void wgpuRenderPassEncoderRelease(WGPURenderPassEncoder renderPassEncoder);



		/**
		* \defgroup WGPURenderPipelineMethods WGPURenderPipeline methods
		* \brief Functions whose first argument has type WGPURenderPipeline.
		*/
		[LinkName("wgpuRenderPipelineGetBindGroupLayout")]
		public static extern WGPUBindGroupLayout wgpuRenderPipelineGetBindGroupLayout(WGPURenderPipeline renderPipeline, uint32 groupIndex);
		[LinkName("wgpuRenderPipelineSetLabel")]
		public static extern void wgpuRenderPipelineSetLabel(WGPURenderPipeline renderPipeline, WGPUStringView label);
		[LinkName("wgpuRenderPipelineAddRef")]
		public static extern void wgpuRenderPipelineAddRef(WGPURenderPipeline renderPipeline);
		[LinkName("wgpuRenderPipelineRelease")]
		public static extern void wgpuRenderPipelineRelease(WGPURenderPipeline renderPipeline);



		/**
		* \defgroup WGPUSamplerMethods WGPUSampler methods
		* \brief Functions whose first argument has type WGPUSampler.
		*/
		[LinkName("wgpuSamplerSetLabel")]
		public static extern void wgpuSamplerSetLabel(WGPUSampler sampler, WGPUStringView label);
		[LinkName("wgpuSamplerAddRef")]
		public static extern void wgpuSamplerAddRef(WGPUSampler sampler);
		[LinkName("wgpuSamplerRelease")]
		public static extern void wgpuSamplerRelease(WGPUSampler sampler);



		/**
		* \defgroup WGPUShaderModuleMethods WGPUShaderModule methods
		* \brief Functions whose first argument has type WGPUShaderModule.
		*/
		[LinkName("wgpuShaderModuleGetCompilationInfo")]
		public static extern WGPUFuture wgpuShaderModuleGetCompilationInfo(WGPUShaderModule shaderModule, WGPUCompilationInfoCallbackInfo callbackInfo);
		[LinkName("wgpuShaderModuleSetLabel")]
		public static extern void wgpuShaderModuleSetLabel(WGPUShaderModule shaderModule, WGPUStringView label);
		[LinkName("wgpuShaderModuleAddRef")]
		public static extern void wgpuShaderModuleAddRef(WGPUShaderModule shaderModule);
		[LinkName("wgpuShaderModuleRelease")]
		public static extern void wgpuShaderModuleRelease(WGPUShaderModule shaderModule);



		/**
		* \defgroup WGPUSupportedFeaturesMethods WGPUSupportedFeatures methods
		* \brief Functions whose first argument has type WGPUSupportedFeatures.
		*/
		/**
		* Frees array members of WGPUSupportedFeatures which were allocated by the API.
		*/
		[LinkName("wgpuSupportedFeaturesFreeMembers")]
		public static extern void wgpuSupportedFeaturesFreeMembers(WGPUSupportedFeatures supportedFeatures);



		/**
		* \defgroup WGPUSupportedWGSLLanguageFeaturesMethods WGPUSupportedWGSLLanguageFeatures methods
		* \brief Functions whose first argument has type WGPUSupportedWGSLLanguageFeatures.
		*/
		/**
		* Frees array members of WGPUSupportedWGSLLanguageFeatures which were allocated by the API.
		*/
		[LinkName("wgpuSupportedWGSLLanguageFeaturesFreeMembers")]
		public static extern void wgpuSupportedWGSLLanguageFeaturesFreeMembers(WGPUSupportedWGSLLanguageFeatures supportedWGSLLanguageFeatures);



		/**
		* \defgroup WGPUSurfaceMethods WGPUSurface methods
		* \brief Functions whose first argument has type WGPUSurface.
		*/
		/**
		* Configures parameters for rendering to `surface`.
		* Produces a @ref DeviceError for all content-timeline errors defined by the WebGPU specification.
		*
		* See @ref Surface-Configuration for more details.
		*
		* @param config
		* The new configuration to use.
		*/
		[LinkName("wgpuSurfaceConfigure")]
		public static extern void wgpuSurfaceConfigure(WGPUSurface surface, WGPUSurfaceConfiguration* config);
		/**
		* Provides information on how `adapter` is able to use `surface`.
		* See @ref Surface-Capabilities for more details.
		*
		* @param adapter
		* The @ref WGPUAdapter to get capabilities for presenting to this @ref WGPUSurface.
		*
		* @param capabilities
		* The structure to fill capabilities in.
		* It may contain memory allocations so `::wgpuSurfaceCapabilitiesFreeMembers` must be called to avoid memory leaks.
		* This parameter is @ref ReturnedWithOwnership.
		*
		* @returns
		* Indicates if there was an @ref OutStructChainError.
		*/
		[LinkName("wgpuSurfaceGetCapabilities")]
		public static extern WGPUStatus wgpuSurfaceGetCapabilities(WGPUSurface surface, WGPUAdapter adapter, WGPUSurfaceCapabilities* capabilities);
		/**
		* Returns the @ref WGPUTexture to render to `surface` this frame along with metadata on the frame.
		* Returns `NULL` and @ref WGPUSurfaceGetCurrentTextureStatus_Error if the surface is not configured.
		*
		* See @ref Surface-Presenting for more details.
		*
		* @param surfaceTexture
		* The structure to fill the @ref WGPUTexture and metadata in.
		*/
		[LinkName("wgpuSurfaceGetCurrentTexture")]
		public static extern void wgpuSurfaceGetCurrentTexture(WGPUSurface surface, WGPUSurfaceTexture* surfaceTexture);
		/**
		* Shows `surface`'s current texture to the user.
		* See @ref Surface-Presenting for more details.
		*
		* @returns
		* Returns @ref WGPUStatus_Error if the surface doesn't have a current texture.
		*/
		[LinkName("wgpuSurfacePresent")]
		public static extern WGPUStatus wgpuSurfacePresent(WGPUSurface surface);
		/**
		* Modifies the label used to refer to `surface`.
		*
		* @param label
		* The new label.
		*/
		[LinkName("wgpuSurfaceSetLabel")]
		public static extern void wgpuSurfaceSetLabel(WGPUSurface surface, WGPUStringView label);
		/**
		* Removes the configuration for `surface`.
		* See @ref Surface-Configuration for more details.
		*/
		[LinkName("wgpuSurfaceUnconfigure")]
		public static extern void wgpuSurfaceUnconfigure(WGPUSurface surface);
		[LinkName("wgpuSurfaceAddRef")]
		public static extern void wgpuSurfaceAddRef(WGPUSurface surface);
		[LinkName("wgpuSurfaceRelease")]
		public static extern void wgpuSurfaceRelease(WGPUSurface surface);



		/**
		* \defgroup WGPUSurfaceCapabilitiesMethods WGPUSurfaceCapabilities methods
		* \brief Functions whose first argument has type WGPUSurfaceCapabilities.
		*/
		/**
		* Frees array members of WGPUSurfaceCapabilities which were allocated by the API.
		*/
		[LinkName("wgpuSurfaceCapabilitiesFreeMembers")]
		public static extern void wgpuSurfaceCapabilitiesFreeMembers(WGPUSurfaceCapabilities surfaceCapabilities);



		/**
		* \defgroup WGPUTextureMethods WGPUTexture methods
		* \brief Functions whose first argument has type WGPUTexture.
		*/
		[LinkName("wgpuTextureCreateView")]
		public static extern WGPUTextureView wgpuTextureCreateView(WGPUTexture texture, WGPUTextureViewDescriptor* descriptor);
		[LinkName("wgpuTextureDestroy")]
		public static extern void wgpuTextureDestroy(WGPUTexture texture);
		[LinkName("wgpuTextureGetDepthOrArrayLayers")]
		public static extern uint32 wgpuTextureGetDepthOrArrayLayers(WGPUTexture texture);
		[LinkName("wgpuTextureGetDimension")]
		public static extern WGPUTextureDimension wgpuTextureGetDimension(WGPUTexture texture);
		[LinkName("wgpuTextureGetFormat")]
		public static extern WGPUTextureFormat wgpuTextureGetFormat(WGPUTexture texture);
		[LinkName("wgpuTextureGetHeight")]
		public static extern uint32 wgpuTextureGetHeight(WGPUTexture texture);
		[LinkName("wgpuTextureGetMipLevelCount")]
		public static extern uint32 wgpuTextureGetMipLevelCount(WGPUTexture texture);
		[LinkName("wgpuTextureGetSampleCount")]
		public static extern uint32 wgpuTextureGetSampleCount(WGPUTexture texture);
		[LinkName("wgpuTextureGetUsage")]
		public static extern WGPUTextureUsage wgpuTextureGetUsage(WGPUTexture texture);
		[LinkName("wgpuTextureGetWidth")]
		public static extern uint32 wgpuTextureGetWidth(WGPUTexture texture);
		[LinkName("wgpuTextureSetLabel")]
		public static extern void wgpuTextureSetLabel(WGPUTexture texture, WGPUStringView label);
		[LinkName("wgpuTextureAddRef")]
		public static extern void wgpuTextureAddRef(WGPUTexture texture);
		[LinkName("wgpuTextureRelease")]
		public static extern void wgpuTextureRelease(WGPUTexture texture);



		/**
		* \defgroup WGPUTextureViewMethods WGPUTextureView methods
		* \brief Functions whose first argument has type WGPUTextureView.
		*/
		[LinkName("wgpuTextureViewSetLabel")]
		public static extern void wgpuTextureViewSetLabel(WGPUTextureView textureView, WGPUStringView label);
		[LinkName("wgpuTextureViewAddRef")]
		public static extern void wgpuTextureViewAddRef(WGPUTextureView textureView);
		[LinkName("wgpuTextureViewRelease")]
		public static extern void wgpuTextureViewRelease(WGPUTextureView textureView);



		[LinkName("wgpuGenerateReport")]
		public static extern void wgpuGenerateReport(WGPUInstance instance, WGPUGlobalReport* report);
		[LinkName("wgpuInstanceEnumerateAdapters")]
		public static extern c_size wgpuInstanceEnumerateAdapters(WGPUInstance instance, WGPUInstanceEnumerateAdapterOptions* options, WGPUAdapter* adapters);
		[LinkName("wgpuQueueSubmitForIndex")]
		public static extern WGPUSubmissionIndex wgpuQueueSubmitForIndex(WGPUQueue queue, c_size commandCount, WGPUCommandBuffer* commands);
		// Returns true if the queue is empty, or false if there are more queue submissions still in flight.
		[LinkName("wgpuDevicePoll")]
		public static extern WGPUBool wgpuDevicePoll(WGPUDevice device, WGPUBool wait, WGPUSubmissionIndex* wrappedSubmissionIndex);
		[LinkName("wgpuDeviceCreateShaderModuleSpirV")]
		public static extern WGPUShaderModule wgpuDeviceCreateShaderModuleSpirV(WGPUDevice device, WGPUShaderModuleDescriptorSpirV* descriptor);
		[LinkName("wgpuSetLogCallback")]
		public static extern void wgpuSetLogCallback(WGPULogCallback callback, void* userdata);

		[LinkName("wgpuSetLogLevel")]
		public static extern void wgpuSetLogLevel(WGPULogLevel level);
		[LinkName("wgpuGetVersion")]
		public static extern uint32 wgpuGetVersion(void);
		[LinkName("wgpuRenderPassEncoderSetPushConstants")]
		public static extern void wgpuRenderPassEncoderSetPushConstants(WGPURenderPassEncoder encoder, WGPUShaderStage stages, uint32 offset, uint32 sizeBytes, void* data);
		[LinkName("wgpuComputePassEncoderSetPushConstants")]
		public static extern void wgpuComputePassEncoderSetPushConstants(WGPUComputePassEncoder encoder, uint32 offset, uint32 sizeBytes, void* data);
		[LinkName("wgpuRenderBundleEncoderSetPushConstants")]
		public static extern void wgpuRenderBundleEncoderSetPushConstants(WGPURenderBundleEncoder encoder, WGPUShaderStage stages, uint32 offset, uint32 sizeBytes, void* data);
		[LinkName("wgpuRenderPassEncoderMultiDrawIndirect")]
		public static extern void wgpuRenderPassEncoderMultiDrawIndirect(WGPURenderPassEncoder encoder, WGPUBuffer buffer, uint64 offset, uint32 count);
		[LinkName("wgpuRenderPassEncoderMultiDrawIndexedIndirect")]
		public static extern void wgpuRenderPassEncoderMultiDrawIndexedIndirect(WGPURenderPassEncoder encoder, WGPUBuffer buffer, uint64 offset, uint32 count);
		[LinkName("wgpuRenderPassEncoderMultiDrawIndirectCount")]
		public static extern void wgpuRenderPassEncoderMultiDrawIndirectCount(WGPURenderPassEncoder encoder, WGPUBuffer buffer, uint64 offset, WGPUBuffer count_buffer, uint64 count_buffer_offset, uint32 max_count);
		[LinkName("wgpuRenderPassEncoderMultiDrawIndexedIndirectCount")]
		public static extern void wgpuRenderPassEncoderMultiDrawIndexedIndirectCount(WGPURenderPassEncoder encoder, WGPUBuffer buffer, uint64 offset, WGPUBuffer count_buffer, uint64 count_buffer_offset, uint32 max_count);
		[LinkName("wgpuComputePassEncoderBeginPipelineStatisticsQuery")]
		public static extern void wgpuComputePassEncoderBeginPipelineStatisticsQuery(WGPUComputePassEncoder computePassEncoder, WGPUQuerySet querySet, uint32 queryIndex);
		[LinkName("wgpuComputePassEncoderEndPipelineStatisticsQuery")]
		public static extern void wgpuComputePassEncoderEndPipelineStatisticsQuery(WGPUComputePassEncoder computePassEncoder);
		[LinkName("wgpuRenderPassEncoderBeginPipelineStatisticsQuery")]
		public static extern void wgpuRenderPassEncoderBeginPipelineStatisticsQuery(WGPURenderPassEncoder renderPassEncoder, WGPUQuerySet querySet, uint32 queryIndex);
		[LinkName("wgpuRenderPassEncoderEndPipelineStatisticsQuery")]
		public static extern void wgpuRenderPassEncoderEndPipelineStatisticsQuery(WGPURenderPassEncoder renderPassEncoder);
		[LinkName("wgpuComputePassEncoderWriteTimestamp")]
		public static extern void wgpuComputePassEncoderWriteTimestamp(WGPUComputePassEncoder computePassEncoder, WGPUQuerySet querySet, uint32 queryIndex);
		[LinkName("wgpuRenderPassEncoderWriteTimestamp")]
		public static extern void wgpuRenderPassEncoderWriteTimestamp(WGPURenderPassEncoder renderPassEncoder, WGPUQuerySet querySet, uint32 queryIndex);

	}
}