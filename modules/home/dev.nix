{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    mold              # Multi-threaded linker, replaces GNU ld (~10x faster link)
    ccache            # Compiler cache — skip unchanged translation units on rebuild
    ninja             # Fast build system — use: cmake -G Ninja

    lldb              # Low-level debugger (used by nvim-dap via lldb-dap binary)
    rr                # Time-travel / record-replay debugger (requires perf_event_paranoid=1)
    valgrind          # Memory error checker: use-after-free, leaks, uninit reads
    heaptrack         # C++ heap profiler — no thread serialization, tracks alloc frequency

    tracy             # Nanosecond-resolution C++ frame profiler with Vulkan/OpenGL GPU timeline
    hyperfine         # Statistical CLI benchmarking: mean, stddev, warmup runs
    sysstat           # sar, iostat, mpstat — system metrics sampled over time
    flamegraph        # Brendan Gregg perf-script → SVG flamegraph generator

    renderdoc         # Frame capture debugger for OpenGL/Vulkan — inspect every draw call
    nvtopPackages.full # GPU monitor: real-time VRAM, utilization, clocks (any vendor)

    spirv-tools       # spirv-dis, spirv-val, spirv-opt — read/validate shader bytecode
    spirv-cross       # Cross-compile SPIR-V → GLSL/HLSL/MSL, inspect resource bindings

    strace            # Trace every syscall a program makes (strace -c for frequency table)
    ltrace            # Trace dynamic library calls
    bpftrace          # eBPF kernel tracing one-liners — zero overhead, no recompile
    bloaty            # Binary size profiler — find template bloat, diff binary sizes
    pciutils          # lspci: inspect GPU/PCIe devices, link speeds, kernel drivers
    hwloc             # lstopo: visualize CPU cache/NUMA topology for memory optimization
    lshw              # Full hardware inventory: RAM slots/speeds, disk interfaces

    rustup            # Rust toolchain manager (read source of ripgrep, eza, fd, etc.)
    include-what-you-use  # Audit C++ #include deps — reduces compile times

    lazygit           # TUI git client — hunk staging, interactive rebase, stash
    gh                # GitHub CLI — create PRs, clone, manage issues from terminal

    man-pages-posix   # POSIX C stdlib + syscall API man pages (separate from man-pages)
  ];
}
