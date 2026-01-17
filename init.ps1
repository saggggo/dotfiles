# setup-emacs-bash-keys.ps1
# $PROFILE を bash / emacs 互換キーバインドで「完全上書き」する
# 既存ファイルは必ずバックアップする

$ErrorActionPreference = "Stop"

# === 書き込む内容 ===
$profileContent = @'
# ==========================================================
# PowerShell profile
# bash / readline (emacs) compatible keybindings
# ==========================================================

if (Get-Module -ListAvailable -Name PSReadLine) {
    Import-Module PSReadLine -ErrorAction SilentlyContinue

    # Emacs（bash互換）モード
    Set-PSReadLineOption -EditMode Emacs

    # カーソル移動
    Set-PSReadLineKeyHandler -Key Ctrl+a -Function BeginningOfLine
    Set-PSReadLineKeyHandler -Key Ctrl+e -Function EndOfLine
    Set-PSReadLineKeyHandler -Key Alt+b  -Function BackwardWord
    Set-PSReadLineKeyHandler -Key Alt+f  -Function ForwardWord

    # 削除（bash互換）
    Set-PSReadLineKeyHandler -Key Ctrl+u -Function BackwardKillLine
    Set-PSReadLineKeyHandler -Key Ctrl+k -Function KillLine
    Set-PSReadLineKeyHandler -Key Ctrl+w -Function BackwardKillWord
    Set-PSReadLineKeyHandler -Key Alt+d  -Function KillWord

    # yank / 履歴検索
    Set-PSReadLineKeyHandler -Key Ctrl+y -Function Yank
    Set-PSReadLineKeyHandler -Key Ctrl+r -Function ReverseSearchHistory
    Set-PSReadLineKeyHandler -Key Ctrl+s -Function ForwardSearchHistory

    # 画面クリア
    Set-PSReadLineKeyHandler -Key Ctrl+l -Function ClearScreen
}
'@


# === $PROFILE のパス ===
$profilePath = $PROFILE
$profileDir  = Split-Path -Parent $profilePath

# ディレクトリ作成
if (-not (Test-Path $profileDir)) {
    New-Item -ItemType Directory -Path $profileDir | Out-Null
}

# 既存プロファイルをバックアップ
if (Test-Path $profilePath) {
    $timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
    $backupPath = "$profilePath.bak.$timestamp"
    Copy-Item -Path $profilePath -Destination $backupPath -Force
    Write-Host "Backup created:"
    Write-Host "  $backupPath"
}

# 完全上書き
Set-Content -Path $profilePath -Value $profileContent -Encoding UTF8

Write-Host ""
Write-Host "Profile overwritten:"
Write-Host "  $profilePath"
Write-Host ""
Write-Host "Apply now:"
Write-Host "  . `$PROFILE"
Write-Host "or restart PowerShell."

# === Dotfiles setup ===
$DOTPATH = if ($env:DOTPATH) { $env:DOTPATH } else { "$HOME/dotfiles" }

Set-Location $DOTPATH
git submodule init
git submodule update

# Create symbolic links for dotfiles
$dotfiles = @(
    ".gitconfig"
    ".gitignore"
)

foreach ($line in $dotfiles) {
    $target = Join-Path $HOME $line
    $source = Join-Path $DOTPATH $line

    if (Test-Path $target) {
        $answer = Read-Host "$target exists. Do you want to overwrite? [y/n]"
        if ($answer -eq 'y' -or $answer -eq 'Y') {
            $temp = "$target._temporary"
            Move-Item -Path $target -Destination $temp -Force
            try {
                New-Item -ItemType HardLink -Path $target -Target $source -Force | Out-Null
                Remove-Item -Path $temp -Force
            } catch {
                Move-Item -Path $temp -Destination $target -Force
            }
        }
    } else {
        New-Item -ItemType HardLink -Path $target -Target $source -Force | Out-Null
    }
}

# Create symbolic link for bin directory
$binDir = Join-Path $HOME "bin"
if (-not (Test-Path $binDir)) {
    New-Item -ItemType SymbolicLink -Path $binDir -Target "$DOTPATH/bin" -Force | Out-Null
}
