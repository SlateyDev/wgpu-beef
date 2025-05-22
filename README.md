# WGPU-Beef
**wgpu-beef** is a Beef wrapper library for **WGPU** (more specifically [wgpu-native](https://github.com/gfx-rs/wgpu-native)).  
You can find an example [here](./example/src/Program.bf).

## Prerequisites (git clone into BeefLibs folder)
- [glfw-beef](https://github.com/MineGame159/glfw-beef) - by MineGame159
- [stb_beef](https://github.com/EinScott/stb_beef) - by EinScott

## Notes
- ~~The [core bindings](./src/Wgpu.bf) are automatically generated from latest release.~~
  - This is currently not functioning correctly and the current bindings were manually generated from the 24.0.3.1 header files.
- Functions are kept as they are but if the function is a method for a struct object handle then a method for that struct is generated too.
  - There have been manually generated and put into [Impl.bf](./src/Impl.bf)
- All structs have a default empty constructor (allowing for `.() {}` syntax) and a constructor with all fields.
- There are a few helper functions ported from wgpu-rs (see [Helper.bf](./src/Helper.bf)). Pull requests for these helper functions are welcome.
- There is a [glfw compatiblity subproject](./wgpu-glfw) which adds `Wgpu.CreateSurfaceFromGlfw(Wgpu.Instance, GlfwWindow*)` function. (Currently only works on Windows and Linux using X11)
- ~~There is an [ImGui rendering backend subproject](https://github.com/MineGame159/wgpu-beef/tree/master/wgpu-imgui) which adds `ImGuiImplWgpu` static class to the `ImGui` namespace.~~
    - This has been removed until ImGui support is restored. I was having errors with the ImGui which were causing crashes and the easiest thing to do was to remove it. Some remnants of ImGui still exist in the project as the plan is to reimplement it.