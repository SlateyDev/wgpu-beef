using System;
using System.IO;
using System.Collections;

using GLFW;
using Wgpu;
//using ImGui;
using stb_image;

namespace Example {
	[CRepr]
	struct Vertex : this(float[3] position, float[2] texCoords) {}

	class Program {
		public static int Main(String[] args) {
			// Create window
			Glfw.Init();

			Glfw.WindowHint(.ClientApi, Glfw.ClientApi.NoApi);
			GlfwWindow* window = Glfw.CreateWindow(1280, 720, "WGPU", null, null);

			// Wgpu log
			Wgpu.wgpuSetLogLevel(.Info);
			Wgpu.wgpuSetLogCallback((level, msg, userdata) => Console.WriteLine($"{level}: {scope String(msg.data, (int)msg.length)}"), null);

			// Create instance
			//Wgpu.WGPUInstanceDescriptor instanceDesc = .() {};
			Wgpu.WGPUInstance instance = Wgpu.wgpuCreateInstance(null);

			// Create surface
			Wgpu.WGPUSurface surface = Wgpu.CreateSurfaceFromGlfw(instance, window);

			// Request adapter
			Wgpu.WGPURequestAdapterOptions options = .() {
				compatibleSurface = surface,
				//powerPreference = .HighPerformance,
				//forceFallbackAdapter = Wgpu.WGPUBool_False
			};
			Wgpu.WGPUAdapter adapter = .Null;

			Wgpu.WGPURequestAdapterCallbackInfo requestAdapterCallbackInfo = .() {
				callback = (status, adapter, message, userdata1, userdata2) => *(Wgpu.WGPUAdapter*) userdata1 = adapter,
				userdata1 = &adapter
			};
			instance.RequestAdapter(&options, requestAdapterCallbackInfo);

			// Request device
			Wgpu.WGPUDevice device = .Null;
			Wgpu.WGPURequestDeviceCallbackInfo requestDeviceCallbackInfo = .() {
				callback = (status, device, message, userdata1, userdata2) => *(Wgpu.WGPUDevice*) userdata1 = device,
				userdata1 = &device
			};
			adapter.RequestDevice(null, requestDeviceCallbackInfo);

			//// Set error callbacks
			//device.SetUncapturedErrorCallback((type, message, userdata) => Console.WriteLine("{}: {}", type, StringView(message)), null);

			// Get queue
			Wgpu.WGPUQueue queue = device.GetQueue();

			Console.WriteLine("Retrieved Queue");

			Wgpu.WGPUSurfaceConfiguration surfaceConfig = .() {
				device = device,
				usage = .RenderAttachment,
				format = .BGRA8Unorm,
				width = 1280,
				height = 720,
				presentMode = .Fifo,
				alphaMode = .Opaque
			};
			Wgpu.wgpuSurfaceConfigure(surface, &surfaceConfig);

			Console.WriteLine("Surface configured");

			// Texture
			List<uint8> rawData = scope .();
			File.ReadAll("assets/beef.png", rawData);
			int32 w = 0, h = 0, c;
			uint8* data = stbi.stbi_load_from_memory(rawData.Ptr, (.) rawData.Count, &w, &h, &c, 4);

			Wgpu.WGPUTextureDescriptor textureDesc = .() {
				usage = .TextureBinding,
				dimension = ._2D,
				size = .((.) w, (.) h, 1),
				format = .RGBA8Unorm,
				mipLevelCount = 1,
				sampleCount = 1
			};
			Wgpu.WGPUTexture texture = device.CreateTextureWithData(queue, &textureDesc, data);
			stbi.stbi_image_free(data);

			Wgpu.WGPUTextureViewDescriptor textureViewDesc = .() {
				format = .RGBA8Unorm,
				dimension = ._2D,
				baseMipLevel = 0,
				mipLevelCount = 1,
				baseArrayLayer = 0,
				arrayLayerCount = 1,
				aspect = .All
			};
			Wgpu.WGPUTextureView textureView = texture.CreateView(&textureViewDesc);

			// Sampler
			Wgpu.WGPUSamplerDescriptor samplerDesc = .() {
				maxAnisotropy = 1,
				addressModeU = .ClampToEdge,
				addressModeV = .ClampToEdge,
				addressModeW = .ClampToEdge,
				magFilter = .Linear,
				minFilter = .Linear,
				lodMinClamp = 0,
				lodMaxClamp = 32,
				mipmapFilter = .Nearest
			};
			Wgpu.WGPUSampler sampler = device.CreateSampler(&samplerDesc);

			// Bind group layout
			Wgpu.WGPUBindGroupLayoutEntry[?] bindGroupLayoutEntries = .(
				.() {
					binding = 0,
					visibility = .Fragment,
					texture = .() {
						sampleType = .Float,
						viewDimension = ._2D
					}
				},
				.() {
					binding = 1,
					visibility = .Fragment,
					sampler = .() {
						type = .Filtering
					}
				}
			);
			Wgpu.WGPUBindGroupLayoutDescriptor bindGroupLayoutDesc = .() {
				entryCount = bindGroupLayoutEntries.Count,
				entries = &bindGroupLayoutEntries
			};
			Wgpu.WGPUBindGroupLayout bindGroupLayout = device.CreateBindGroupLayout(&bindGroupLayoutDesc);

			// Bind group
			Wgpu.WGPUBindGroupEntry[?] bindGroupEntries = .(
				.() {
					binding = 0,
					textureView = textureView
				},
				.() {
					binding = 1,
					sampler = sampler
				}
			);
			Wgpu.WGPUBindGroupDescriptor bindGroupDesc = .() {
				layout = bindGroupLayout,
				entryCount = bindGroupEntries.Count,
				entries = &bindGroupEntries
			};
			Wgpu.WGPUBindGroup bindGroup = device.CreateBindGroup(&bindGroupDesc);

			// Pipeline
			String shaderBuffer = scope .();
			File.ReadAllText("assets/shader.wgsl", shaderBuffer);
			Wgpu.WGPUShaderSourceWGSL shaderWgslDesc = .() {
				chain = .() {
					sType = .ShaderSourceWGSL
				},
				code = Wgpu.WGPUStringView(shaderBuffer)
			};
			Wgpu.WGPUShaderModuleDescriptor shaderDesc = .() {
				nextInChain = (Wgpu.WGPUChainedStruct*) &shaderWgslDesc,
			};
			Wgpu.WGPUShaderModule shader = device.CreateShaderModule(&shaderDesc);

			// Vertex buffer
			Vertex[?] vertices = .(
				.(.(-0.5f, -0.5f, 0), .(0, 1)),
				.(.(-0.5f, 0.5f, 0.0f), .(0, 0)),
				.(.(0.5f, 0.5f, 0.0f), .(1, 0)),
				.(.(0.5f, -0.5f, 0.0f), .(1, 1))
			);

			Wgpu.BufferInitDescriptor vertexBufferDesc = .() {
				contents = .((uint8*) &vertices, vertices.Count * sizeof(Vertex)),
				usage = .Vertex
			};
			Wgpu.WGPUBuffer vertexBuffer = device.CreateBufferInit(&vertexBufferDesc);

			// Index buffer
			uint16[?] indices = .(
			    0, 1, 2,
				2, 3, 0
			);

			Wgpu.BufferInitDescriptor indexBufferDesc = .() {
				contents = .((uint8*) &indices, indices.Count * sizeof(uint16)),
				usage = .Index
			};
			Wgpu.WGPUBuffer indexBuffer = device.CreateBufferInit(&indexBufferDesc);

			// Pipeline layout
			Wgpu.WGPUPipelineLayoutDescriptor layoutDesc = .() {
				bindGroupLayoutCount = 1,
				bindGroupLayouts = &bindGroupLayout
			};
			Wgpu.WGPUPipelineLayout layout = device.CreatePipelineLayout(&layoutDesc);

			// Pipeline
			Wgpu.WGPUVertexAttribute[?] attributes = .(
				.() {
					format = .Float32x3,
					offset = 0,
					shaderLocation = 0
				},
				.() {
					format = .Float32x2,
					offset = sizeof(float[3]),
					shaderLocation = 1
				}
			);
			Wgpu.WGPUVertexBufferLayout vertexBufferLayout = .() {
				arrayStride = sizeof(Vertex),
				stepMode = .Vertex,
				attributeCount = attributes.Count,
				attributes = &attributes
			};

			Wgpu.WGPUBlendState blend = .() {
				color = .(.Add, .SrcAlpha, .OneMinusSrcAlpha),
				alpha = .(.Add, .One, .OneMinusSrcAlpha)
			};
			Wgpu.WGPUColorTargetState colorTarget = .() {
				format = .BGRA8Unorm,
				blend = &blend,
				writeMask = .All
			};
			Wgpu.WGPUFragmentState fragment = .() {
				module = shader,
				entryPoint = Wgpu.WGPUStringView("fs_main"),
				targetCount = 1,
				targets = &colorTarget
			};

			Wgpu.WGPURenderPipelineDescriptor pipelineDesc = .() {
				layout = layout,
				vertex = .() {
					module = shader,
					entryPoint = Wgpu.WGPUStringView("vs_main"),
					bufferCount = 1,
					buffers = &vertexBufferLayout
				},
				fragment = &fragment,
				primitive = .() {
					topology = .TriangleList,
					stripIndexFormat = .Undefined,
					frontFace = .CW,
					cullMode = .Back,
				},
				depthStencil = null,
				multisample = .() {
					count = 1,
					mask = ~0,
					alphaToCoverageEnabled = Wgpu.WGPUBool_False
				}
			};
			Wgpu.WGPURenderPipeline pipeline = device.CreateRenderPipeline(&pipelineDesc);

			// ImGui
			//ImGui.CHECKVERSION();
			//ImGui.Context* context = ImGui.CreateContext();
			//ImGui.StyleColorsDark();
			//ImGuiImplGlfw.InitForOther(window, true);
			//ImGuiImplWgpu.Init(device, 3, .BGRA8Unorm);

			// Loop
			while (!Glfw.WindowShouldClose(window)) {
				Glfw.PollEvents();

				Wgpu.WGPUSurfaceTexture surfaceTexture = .();
				Wgpu.wgpuSurfaceGetCurrentTexture(surface, &surfaceTexture);
				switch (surfaceTexture.status) {
					case .SuccessOptimal, .SuccessSuboptimal:
						break;
					case .Timeout, .Outdated, .Lost:
						// Console.WriteLine("Surface timeout, outdated, or lost");
						int width = 0, height = 0;
						Glfw.GetWindowSize(window, ref width, ref height);
						surfaceConfig.width = (uint32)width;
						surfaceConfig.height = (uint32)height;
						Wgpu.wgpuSurfaceConfigure(surface, &surfaceConfig);
						continue;
					case .OutOfMemory, .DeviceLost, .Error:
						Console.WriteLine("Surface out of memory, device lost, or error");
						break;
					default:
						Console.WriteLine("Surface unknown error");
						break;
				}

				Wgpu.WGPUTextureViewDescriptor viewDesc = .() {
					format = .BGRA8Unorm,
					dimension = ._2D,
					baseMipLevel = 0,
					mipLevelCount = 1,
					baseArrayLayer = 0,
					arrayLayerCount = 1,
					aspect = .All
				};
				var view = surfaceTexture.texture.CreateView(&viewDesc);
				
				Wgpu.WGPUCommandEncoder encoder = device.CreateCommandEncoder(null);

				{
					Wgpu.WGPURenderPassColorAttachment colorDesc = .() {
						view = view,
						loadOp = .Clear,
						storeOp = .Store,
						depthSlice = 0xffffffff,
						clearValue = .(1, 1, 1, 1)
					};
					Wgpu.WGPURenderPassDescriptor passDesc = .() {
						colorAttachmentCount = 1,
						colorAttachments = &colorDesc,
						depthStencilAttachment = null
					};
					Wgpu.WGPURenderPassEncoder pass = encoder.BeginRenderPass(&passDesc);

					pass.SetPipeline(pipeline);
					pass.SetBindGroup(0, bindGroup, 0, null);
					pass.SetVertexBuffer(0, vertexBuffer, 0, vertices.Count * sizeof(Vertex));
					pass.SetIndexBuffer(indexBuffer, .Uint16, 0, indices.Count * sizeof(uint16));
					pass.DrawIndexed(indices.Count, 1, 0, 0, 0);

					// ImGui
					//ImGuiImplWgpu.NewFrame();
					//ImGuiImplGlfw.NewFrame();
					//ImGui.NewFrame();

					//ImGui.ShowDemoWindow();

					//ImGui.Render();
					//ImGuiImplWgpu.RenderDrawData(ImGui.GetDrawData(), pass);

					// End render pass
					pass.End();
					pass.Release();
				}

				// Submit
				Wgpu.WGPUCommandBuffer cb = encoder.Finish(null);
				queue.Submit(1, &cb);

				Wgpu.wgpuSurfacePresent(surface);
				
				view.Release();
				surfaceTexture.texture.Release();
				encoder.Release();
			}

			// Destroy
			//ImGuiImplWgpu.Shutdown();
			//ImGuiImplGlfw.Shutdown();
			//ImGui.Shutdown(context);

			Glfw.DestroyWindow(window);
			Glfw.Terminate();
			return 0;
		}
	}
}