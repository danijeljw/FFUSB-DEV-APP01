#Requires -Version 2.0

# Create assets directory
New-Item -Path $($pwd.Path + '\') -ItemType Directory -Name 'assets' -Confirm:$false -Force

# Create capture directory
New-Item -Path $($pwd.Path + '\assets\') -ItemType Directory -Name 'captureDir' -Confirm:$false -Force

# Create client directory
New-Item -Path $($pwd.Path + '\assets\') -ItemType Directory -Name 'client' -Confirm:$false -Force

# Create windows directory
New-Item -Path $($pwd.Path + '\assets\') -ItemType Directory -Name 'Windows' -Confirm:$false -Force

# Create 5x 10MB files
$i = 0
while ($i -lt 5)
{
    [string]$fileName = ([guid]::newGuid()).Guid
    [string]$path = $pwd.Path + '\assets\captureDir\' + $fileName
    Start-Process -FilePath 'fsutil' -ArgumentList "file createNew ${path} 10485760" -Wait
    $i++
}
