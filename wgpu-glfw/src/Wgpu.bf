using System;
using GLFW;

namespace Wgpu {
	extension Wgpu {
		public static WGPUSurface CreateSurfaceFromGlfw(WGPUInstance instance, GlfwWindow* window) {
#if BF_PLATFORM_WINDOWS
			{
				Windows.HWnd* hwnd = Glfw.GetWin32Window(window);
				Windows.HModule module = Windows.GetModuleHandleA(null);
	
				Wgpu.WGPUSurfaceSourceWindowsHWND chained = .() {
					chain = .() {
						sType = .SurfaceSourceWindowsHWND
					},
					hinstance = &module,
					hwnd = hwnd
				};
				Wgpu.WGPUSurfaceDescriptor desc = .() {
					nextInChain = (Wgpu.WGPUChainedStruct*) &chained
				};
				return instance.CreateSurface(&desc);
			}
#elif BF_PLATFORM_LINUX
			{
				Glfw.XDisplay* display = Glfw.GetX11Display();
				Glfw.XWindow win = Glfw.GetX11Window(window);

				Wgpu.WGPUSurfaceSourceXlibWindow chained = .() {
					chain = .() {
						sType = .SurfaceSourceXlibWindow
					},
					display = display,
					window = (uint32)win
				};
				Wgpu.WGPUSurfaceDescriptor desc = .() {
					nextInChain = (Wgpu.WGPUChainedStruct*) &chained
				};
				return instance.CreateSurface(&desc);
			}
#else
#error Unsupported platform
#endif
		}
	}
}