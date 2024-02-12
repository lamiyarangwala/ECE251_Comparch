[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/WcKVdfxS)
[![Open in Visual Studio Code](https://classroom.github.com/assets/open-in-vscode-718a45dd9cf7e7f842a935f5ebbe5719a5e09af4491e668f4dbf3b35d5cca122.svg)](https://classroom.github.com/online_ide?assignment_repo_id=13821209&assignment_repo_type=AssignmentRepo)
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
