function Show-Tree ($Path = '.', $Indent = '') {
    $item = Get-Item $Path
    
    # Print the root directory header on the first call
    if ($Indent -eq '') {
        Write-Host "$($item.Name)/"
    }

    $children = Get-ChildItem $Path | Where-Object { $_.Name -notmatch '^\.(git|vs)' }
    for ($i = 0; $i -lt $children.Count; $i++) {
        $isLast = ($i -eq $children.Count - 1)
        $prefix = if ($isLast) { '└── ' } else { '├── ' }
        Write-Host "$Indent$prefix$($children[$i].Name)"
        
        if ($children[$i].PSIsContainer) {
            $branchIndent = if ($isLast) { '    ' } else { '│   ' }
            $nextIndent = $Indent + $branchIndent
            Show-Tree -Path $children[$i].FullName -Indent $nextIndent
        }
    }
}

Show-Tree