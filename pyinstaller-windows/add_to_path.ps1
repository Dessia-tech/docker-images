$oldpath = [Environment]::GetEnvironmentVariable("PATH", [EnvironmentVariableTarget]::Machine);
[Environment]::SetEnvironmentVariable("PATH", $oldpath + ";Z:\python-3.10;Z:\python-3.10\Scripts", [EnvironmentVariableTarget]::Machine);
