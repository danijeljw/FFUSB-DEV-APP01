#Requires -Version 2.0

# Create a new WIM file
[string]$fileWIM = $pwd.Path + '\assets\client\captureWim.wim'
[string]$captureDir = $pwd.Path + '\assets\captureDir'
New-WindowsImage -ImagePath $fileWIM -CapturePath $captureDir -Name 'captureDir'

# Mount the development WIM file
Mount-WindowsImage -ImagePath $fileWIM -Index 1 -Path $($pwd.Path + '\assets\Windows\') -ReadOnly

# Count 5 files to validate
If((Get-ChildItem -Path $($pwd.Path + '\assets\Windows\') | Measure-Object | Select-Object -ExpandProperty Count) -like 5)
{
    Dismount-WindowsImage -Path $($pwd.Path + '\assets\Windows\') -Discard
    Remove-Item -Path $($pwd.Path + '\assets\Windows') -Confirm:$false -Force -Recurse
}

# Clean up files
#Remove-Item -Path $($pwd.Path + '\assets\captureDir')