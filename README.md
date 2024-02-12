# Verilog Catalog Template

This is your catalog of Verilog-modeled logical circuits used to implement the computer architecture for your von Neumann-classified computer design (CPU, memory, data path, input, output).

Each catalog component will be stored in its own respective folder. To compile, simulate, and verify simulation using GTKWave, you will issue the following commands in each of the catalog component folders.

## Compilation and Simulation
To compile then simulate:
### Linux, MacOS
```bash
make clean compile simulate
```

### Windows
```powershell
.\makefile.ps1
```

# Display of Timing Diagrams
To display simulation using GTKWAVE:

### Linux, MacOS
```bash
make display
```

### Windows
```powershell
.\display.ps1
```

Then choose your module's test bench module (`uut`), as your SST. Highlight "uut" and choose all signals, dragging them to Signal area to right. Once done, got to menu Time -> Zoom -> Zoom Bet Fit.

# Clean up the compiled and simulated files
To clean up:

### Linux, MacOS
```bash
make clean
```

### Windows
```powershell
.\clean.ps1
```
