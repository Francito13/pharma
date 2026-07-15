param(
    [string]$ContainerName = $(throw "Container name is required. Usage: backup_db.ps1 -ContainerName <postgres_container>"),
    [string]$DbName = "pharmab2b",
    [string]$DbUser = "pharma",
    [string]$BackupDir = ".\backups"
)

$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
$backupFile = Join-Path -Path $BackupDir -ChildPath "${DbName}_${timestamp}.sql"

if (-not (Test-Path -Path $BackupDir)) {
    New-Item -ItemType Directory -Path $BackupDir -Force | Out-Null
    Write-Host "Created backup directory: $BackupDir"
}

Write-Host "Starting backup of database '$DbName' from container '$ContainerName'..."
Write-Host "Backup file: $backupFile"

docker exec $ContainerName pg_dump -U $DbUser $DbName > $backupFile 2>$null

if ($LASTEXITCODE -eq 0) {
    Write-Host "Backup completed successfully: $backupFile"

    $fileInfo = Get-Item $backupFile
    Write-Host "Size: $([math]::Round($fileInfo.Length / 1KB, 2)) KB"

    $compressFile = "${backupFile}.gz"
    Compress-Archive -Path $backupFile -DestinationPath $compressFile -Force
    Remove-Item $backupFile
    Write-Host "Compressed backup: $compressFile"
} else {
    Write-Host "Backup failed with exit code $LASTEXITCODE" -ForegroundColor Red
    if (Test-Path $backupFile) {
        Remove-Item $backupFile
    }
}
