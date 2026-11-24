# ==========================================
# Notes Workspace
# ==========================================

# Speicherort für die Notizen
# Diesen Pfad an die eigene Umgebung anpassen
$script:noteRoot = "C:\Notes"

function note {
    param(
        [Parameter(Mandatory)]
        [string]$Name
    )

    if (-not (Test-Path $script:noteRoot)) {
        New-Item -ItemType Directory -Force -Path $script:noteRoot | Out-Null
    }

    $file = Join-Path $script:noteRoot "$Name.txt"

    if (-not (Test-Path $file)) {
        @(
            "Titel: $Name"
            "Datum: $(Get-Date -Format 'dd.MM.yyyy')"
            "Uhrzeit: $(Get-Date -Format 'HH:mm')"
            ""
        ) | Set-Content -Path $file -Encoding UTF8
    }

    vim $file
}

function notes {
    Get-ChildItem $script:noteRoot -Filter "*.txt" |
    Sort-Object LastWriteTime -Descending |
    Select-Object LastWriteTime, Name
}

function findnote {
    param(
        [Parameter(Mandatory)]
        [string]$Search
    )

    $results = Get-ChildItem $script:noteRoot -Filter "*.txt" |
        Select-String -Pattern $Search

    if (-not $results) {
        Write-Host "Keine Treffer gefunden." -ForegroundColor Yellow
        return
    }

    $results |
        Group-Object Path |
        ForEach-Object {

            Write-Host ""
            Write-Host "=== $([IO.Path]::GetFileName($_.Name)) ===" -ForegroundColor Cyan

            $_.Group | ForEach-Object {
                Write-Host "[$($_.LineNumber)] $($_.Line.Trim())"
            }
        }
}

function rmnote {
    param(
        [Parameter(Mandatory)]
        [string]$Name
    )

    $file = Join-Path $script:noteRoot "$Name.txt"

    if (-not (Test-Path $file)) {
        Write-Host "Datei nicht gefunden: $Name.txt" -ForegroundColor Yellow
        return
    }

    Remove-Item -Path $file -Force

    Write-Host "Geloescht: $Name.txt" -ForegroundColor Green
}

function noteday {
    param(
        [Parameter(Mandatory)]
        [string]$Name
    )

    note "$(Get-Date -Format 'yyyy-MM-dd')_$Name"
}

# ==========================================
# Aliase
# ==========================================

Set-Alias n note

