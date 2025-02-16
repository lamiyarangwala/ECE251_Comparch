<#
 # File: 	makefile.ps1
 # Author: 	Prof. Rob Marano
 # Build and test file for Verilog on Windows using PowerShell
 # Note: icarus verilog and gtkwave must be installed
 #>

 $COMPONENT = "dff"
 $SRC = "$COMPONENT.sv"
 $TESTBENCH = "tb_$COMPONENT.sv"
 $TBOUTPUT = "tb_$COMPONENT.vcd"
 
 # TOOLS
 $COMPILER = "C:\ProgramData\chocolatey\bin\iverilog.exe"
 $SIMULATOR = "C:\ProgramData\chocolatey\bin\vvp.exe"
 $VIEWER = "C:\ProgramData\chocolatey\bin\gtkwave.exe" # GUI app
 # TOOL OPTIONS
 $COFLAGS = "-g2012"
 $SFLAGS = "-lx2"		#SIMULATOR FLAGS
 $SOUTPUT = "-lxt2"		#SIMULATOR OUTPUT TYPE
 
 # Clean up from last run
 $filesToRemove = @("$COMPONENT", "$COMPONENT.vcd")
 Write-Output "Removing files: $filesToRemove"s
 #Remove-Item -Path $filesToRemove -ErrorAction SilentlyContinue -Confirm
 $filesToRemove | ForEach-Object { Remove-Item -Path $_ -Force -ErrorAction SilentlyContinue -Confirm:$false}
 
 #
 # Compile Verilog file
 #
 # $COMPILER $COFLAGS -o $COMPONENT $TESTBENCH $SRC
 $compileProcessOptions = @{
     FilePath = "$COMPILER"
     ArgumentList = @("$COFLAGS", "-o", "$COMPONENT", "$TESTBENCH", "$SRC")
     UseNewEnvironment = $true
 }
 Start-Process -NoNewWindow -Wait @compileProcessOptions
 
 #
 # Simulate Verilog module with testbench
 # $(SIMULATOR) $(SFLAGS) $(COMPONENT) $(TESTBENCH) $(SOUTPUT)
 $simulateProcessOptions = @{
     FilePath = "$SIMULATOR"
     ArgumentList = @("$SFLAGS", "$COMPONENT", "$SOUTPUT")
     UseNewEnvironment = $true
 }
 Write-Output @simulateProcessOptions
 Start-Process @simulateProcessOptions -NoNewWindow -Wait