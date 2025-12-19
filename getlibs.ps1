Set-Location $PSScriptRoot
New-Item -Path "dist" -ItemType Directory -Force

Invoke-WebRequest -Uri https://github.com/gfx-rs/wgpu-native/releases/download/v27.0.2.0/wgpu-windows-x86_64-msvc-debug.zip -OutFile dist/wgpu-windows-x86_64-msvc-debug.zip
Invoke-WebRequest -Uri https://github.com/gfx-rs/wgpu-native/releases/download/v27.0.2.0/wgpu-windows-x86_64-msvc-release.zip -OutFile dist/wgpu-windows-x86_64-msvc-release.zip

Expand-Archive -Path dist/wgpu-windows-x86_64-msvc-debug.zip -DestinationPath dist/wgpu-windows-x86_64-msvc-debug
Expand-Archive -Path dist/wgpu-windows-x86_64-msvc-release.zip -DestinationPath dist/wgpu-windows-x86_64-msvc-release

Remove-Item -Path dist/wgpu-windows-x86_64-msvc-debug.zip
Remove-Item -Path dist/wgpu-windows-x86_64-msvc-release.zip