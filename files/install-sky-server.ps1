# 空島サーバー 参加者用インストーラー（公式 Minecraft ランチャー向け）
# やること:
#   1. NeoForge 21.1.267 をインストールする（公式インストーラーを公式サイトから取得）
#   2. サーバー専用のゲームフォルダに、必要な mod を Modrinth から取得する（ハッシュ確認あり）
#   3. マルチプレイのサーバー一覧に接続先を登録する
#   4. ランチャーに「空島サーバー」の起動構成を追加する
# 既存のワールドや、他の起動構成の mod には触りません。
param(
  [string]$MinecraftDir = (Join-Path $env:APPDATA ".minecraft"),
  [string]$GameDirName = "sky-server",
  [string]$JavaPath,
  [switch]$NoJavaSearch,
  [switch]$Yes
)
$ErrorActionPreference = "Stop"
trap {
  Write-Host ""
  Write-Host "エラーで止まりました: $($_.Exception.Message)" -ForegroundColor Red
  Write-Host "この画面の写真を管理者に送ってください。"
  exit 1
}
$ProgressPreference = "SilentlyContinue"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$Manifest = @'
{
    "name":  "空島サーバー",
    "neoforge":  "21.1.267",
    "serverName":  "空島サーバー",
    "serverAddress":  "133.18.147.85",
    "serversDatBase64":  "CgAACQAHc2VydmVycwoAAAABCAAEbmFtZQAS56m65bO244K144O844OQ44O8CAACaXAADTEzMy4xOC4xNDcuODUAAA==",
    "files":  [
                  {
                      "dir":  "mods",
                      "filename":  "create-1.21.1-6.0.10.jar",
                      "url":  "https://cdn.modrinth.com/data/LNytGWDc/versions/UjX6dr61/create-1.21.1-6.0.10.jar",
                      "sha1":  "0e97e49837bed766e6f28a4c95b04885d6acc353",
                      "client":  "required",
                      "group":  null
                  },
                  {
                      "dir":  "mods",
                      "filename":  "create-aeronautics-bundled-1.21.1-1.3.3.jar",
                      "url":  "https://cdn.modrinth.com/data/oWaK0Q19/versions/demX2roU/create-aeronautics-bundled-1.21.1-1.3.3.jar",
                      "sha1":  "fc2757dad6ac888fc7624865d8ad2d2e02fad8f3",
                      "client":  "required",
                      "group":  null
                  },
                  {
                      "dir":  "mods",
                      "filename":  "sable-neoforge-1.21.1-2.0.6.jar",
                      "url":  "https://cdn.modrinth.com/data/T9PomCSv/versions/fg9dTRz9/sable-neoforge-1.21.1-2.0.6.jar",
                      "sha1":  "cf46f7e8c1511f170abcdbee739944f0540549bf",
                      "client":  "required",
                      "group":  null
                  },
                  {
                      "dir":  "mods",
                      "filename":  "architectury-13.0.12-neoforge.jar",
                      "url":  "https://cdn.modrinth.com/data/lhGA9TYQ/versions/xGfBrBzj/architectury-13.0.12-neoforge.jar",
                      "sha1":  "646dace27624ac08ad8d229fe15f6601a8b7fbb2",
                      "client":  "required",
                      "group":  null
                  },
                  {
                      "dir":  "mods",
                      "filename":  "sky_archipelago-1.4.jar",
                      "url":  "https://cdn.modrinth.com/data/sHFNUlBU/versions/XPc17YJD/sky_archipelago-1.4.jar",
                      "sha1":  "ac462047df2c3887dc7b38b47af247c12293a11e",
                      "client":  "required",
                      "group":  null
                  },
                  {
                      "dir":  "mods",
                      "filename":  "ars_nouveau-1.21.1-5.13.5.jar",
                      "url":  "https://cdn.modrinth.com/data/TKB6INcv/versions/ALmdjtiq/ars_nouveau-1.21.1-5.13.5.jar",
                      "sha1":  "cdc946c63e1eb676f0e29e4640335c0ce68d7de3",
                      "client":  "required",
                      "group":  null
                  },
                  {
                      "dir":  "mods",
                      "filename":  "curios-neoforge-9.6.0+1.21.1.jar",
                      "url":  "https://cdn.modrinth.com/data/vvuO3ImH/versions/KJsZIQrT/curios-neoforge-9.6.0%2B1.21.1.jar",
                      "sha1":  "110fa48c45be8d8421bf2e0bd706f11ec47cc7f8",
                      "client":  "required",
                      "group":  null
                  },
                  {
                      "dir":  "mods",
                      "filename":  "geckolib-neoforge-1.21.1-4.9.3.jar",
                      "url":  "https://cdn.modrinth.com/data/8BmcQJ2H/versions/Grwn5rUB/geckolib-neoforge-1.21.1-4.9.3.jar",
                      "sha1":  "5cfe835472a5c5457ae9ac192d9d7b317454d5ac",
                      "client":  "required",
                      "group":  null
                  },
                  {
                      "dir":  "mods",
                      "filename":  "kaleidoscopecookery-1.6.0-neoforge+mc1.21.1.jar",
                      "url":  "https://cdn.modrinth.com/data/v17FatAc/versions/g8w0b2ly/kaleidoscopecookery-1.6.0-neoforge%2Bmc1.21.1.jar",
                      "sha1":  "9093e830c91a8f2e19eca7dda78713f0bbc21327",
                      "client":  "required",
                      "group":  null
                  },
                  {
                      "dir":  "mods",
                      "filename":  "exposure-neoforge-1.21.1-1.9.21.jar",
                      "url":  "https://cdn.modrinth.com/data/hB899VmG/versions/tjX0GpFW/exposure-neoforge-1.21.1-1.9.21.jar",
                      "sha1":  "6964c32c57f27297d2d773b2ff6d43b3807fa32a",
                      "client":  "required",
                      "group":  null
                  },
                  {
                      "dir":  "mods",
                      "filename":  "exposure-space-neoforge-1.4.0.jar",
                      "url":  "https://cdn.modrinth.com/data/CXqSHlx2/versions/lJjz54hX/exposure-space-neoforge-1.4.0.jar",
                      "sha1":  "cfd05dfd4da678660e293ea693ffdbe1bdc17539",
                      "client":  "required",
                      "group":  null
                  },
                  {
                      "dir":  "mods",
                      "filename":  "create-collision-fix-1.0.0.jar",
                      "url":  "https://cdn.modrinth.com/data/j20TJ3QZ/versions/oIRUjqoI/create-collision-fix-1.0.0.jar",
                      "sha1":  "417f323e03a48b4e4e9f94cc0bb563c01a020b80",
                      "client":  "required",
                      "group":  null
                  },
                  {
                      "dir":  "mods",
                      "filename":  "jei-1.21.1-neoforge-19.64.0.455.jar",
                      "url":  "https://cdn.modrinth.com/data/u6dRKJwZ/versions/iv3KiVkE/jei-1.21.1-neoforge-19.64.0.455.jar",
                      "sha1":  "f6d6fc08d54c40752926b570a2220471e8c45c1a",
                      "client":  "required",
                      "group":  null
                  },
                  {
                      "dir":  "mods",
                      "filename":  "mezz_config-1.21.1-neoforge-0.7.1-standalone.jar",
                      "url":  "https://cdn.modrinth.com/data/7tEfOcA7/versions/V6oWFnxW/mezz_config-1.21.1-neoforge-0.7.1-standalone.jar",
                      "sha1":  "2382e29c9a0f44d4f4b9baa4cb3f6a356e048e60",
                      "client":  "required",
                      "group":  null
                  },
                  {
                      "dir":  "mods",
                      "filename":  "journeymap-neoforge-1.21.1-6.0.9.jar",
                      "url":  "https://cdn.modrinth.com/data/lfHFW1mp/versions/CtFE7hwT/journeymap-neoforge-1.21.1-6.0.9.jar",
                      "sha1":  "3a5c86e620a7d5aa53b6e42ca4a1577bbba1d332",
                      "client":  "required",
                      "group":  null
                  },
                  {
                      "dir":  "mods",
                      "filename":  "common-networking-neoforge-1.0.21-1.21.1.jar",
                      "url":  "https://cdn.modrinth.com/data/HIuqnQpi/versions/pR7AeZk3/common-networking-neoforge-1.0.21-1.21.1.jar",
                      "sha1":  "f55722a4278997e7ef278f4390a31e848f7beea7",
                      "client":  "required",
                      "group":  null
                  },
                  {
                      "dir":  "mods",
                      "filename":  "legendary_monsters-2.2.4 MC 1.21.1.jar",
                      "url":  "https://cdn.modrinth.com/data/9d9Bkqva/versions/zkH9rSlF/legendary_monsters-2.2.4%20MC%201.21.1.jar",
                      "sha1":  "85778d7f4b7c1546279be9374be3b71b47e2c47d",
                      "client":  "required",
                      "group":  null
                  },
                  {
                      "dir":  "mods",
                      "filename":  "createbigcannons-5.11.7+mc.1.21.1.jar",
                      "url":  "https://cdn.modrinth.com/data/GWp4jCJj/versions/bOiDu0LS/createbigcannons-5.11.7%2Bmc.1.21.1.jar",
                      "sha1":  "c90ee0b2142e2c58d233e150cb3a24c7cb07eb2d",
                      "client":  "required",
                      "group":  null
                  },
                  {
                      "dir":  "mods",
                      "filename":  "ritchiesprojectilelib-2.1.2+mc.1.21.1-neoforge.jar",
                      "url":  "https://cdn.modrinth.com/data/B3pb093D/versions/hZ6B2Z0x/ritchiesprojectilelib-2.1.2%2Bmc.1.21.1-neoforge.jar",
                      "sha1":  "ec2e4996f8bee8714173e603e379fef8a6901765",
                      "client":  "required",
                      "group":  null
                  },
                  {
                      "dir":  "mods",
                      "filename":  "exposure_polaroid-neoforge-1.21.1-1.1.6.jar",
                      "url":  "https://cdn.modrinth.com/data/WEWiqYkW/versions/WfVyzdJL/exposure_polaroid-neoforge-1.21.1-1.1.6.jar",
                      "sha1":  "141ea133aff47e1655bd4a4937688bede22ebe58",
                      "client":  "required",
                      "group":  null
                  },
                  {
                      "dir":  "mods",
                      "filename":  "ok_zoomer-neo-10.0.0-beta.13.jar",
                      "url":  "https://cdn.modrinth.com/data/aXf2OSFU/versions/AkPuuAgJ/ok_zoomer-neo-10.0.0-beta.13.jar",
                      "sha1":  "bf38fe686628eca79cc1b33c6e60a1eb765c6b39",
                      "client":  "required",
                      "group":  null
                  },
                  {
                      "dir":  "mods",
                      "filename":  "InventoryProfilesNext-neoforge-1.21.1-2.2.5.jar",
                      "url":  "https://cdn.modrinth.com/data/O7RBXm3n/versions/vjuNnHLv/InventoryProfilesNext-neoforge-1.21.1-2.2.5.jar",
                      "sha1":  "b09d7c0820c233ea34af54d0a3ab7ed510b32dcc",
                      "client":  "required",
                      "group":  null
                  },
                  {
                      "dir":  "mods",
                      "filename":  "libIPN-neoforge-1.21.1-6.6.3.jar",
                      "url":  "https://cdn.modrinth.com/data/onSQdWhM/versions/BGe4KMlE/libIPN-neoforge-1.21.1-6.6.3.jar",
                      "sha1":  "baab9e8cae3d2b77b5e172b5694e465ee9f30d4a",
                      "client":  "required",
                      "group":  null
                  },
                  {
                      "dir":  "mods",
                      "filename":  "kotlinforforge-5.13.0-all.jar",
                      "url":  "https://cdn.modrinth.com/data/ordsPcFz/versions/9ZlVvei8/kotlinforforge-5.13.0-all.jar",
                      "sha1":  "b1d5563f4e3db9ec4a4a2b371560aa171d6de237",
                      "client":  "required",
                      "group":  null
                  },
                  {
                      "dir":  "mods",
                      "filename":  "MouseTweaks-neoforge-mc1.21-2.26.1.jar",
                      "url":  "https://cdn.modrinth.com/data/aC3cM3Vq/versions/9I21YYxf/MouseTweaks-neoforge-mc1.21-2.26.1.jar",
                      "sha1":  "6dae57f4f50f7808d2ed9a18f6cd1c0d4640c6bc",
                      "client":  "required",
                      "group":  null
                  },
                  {
                      "dir":  "mods",
                      "filename":  "sodium-neoforge-0.8.13+mc1.21.1.jar",
                      "url":  "https://cdn.modrinth.com/data/AANobbMI/versions/uMOpc5uV/sodium-neoforge-0.8.13%2Bmc1.21.1.jar",
                      "sha1":  "1757289be21ed18db5b0d90703fa3db1b2de5693",
                      "client":  "optional",
                      "group":  "sodium"
                  },
                  {
                      "dir":  "mods",
                      "filename":  "iris-neoforge-1.8.14-beta.1+mc1.21.1.jar",
                      "url":  "https://cdn.modrinth.com/data/YL57xq9U/versions/KduFYu4t/iris-neoforge-1.8.14-beta.1%2Bmc1.21.1.jar",
                      "sha1":  "1bd129cf7bce65d6b1c0543045f0620c98a0f885",
                      "client":  "optional",
                      "group":  "shaders"
                  },
                  {
                      "dir":  "shaderpacks",
                      "filename":  "Ray-0.1.0a0-37c865d-nightly.zip",
                      "url":  "https://github.com/kuwacom/ray/releases/download/nightly/Ray-0.1.0a0-37c865d-nightly.zip",
                      "sha1":  "c16f1a155dc6a3e7112445310631296bda8fd90a",
                      "client":  "optional",
                      "group":  "shaders"
                  },
                  {
                      "dir":  "shaderpacks",
                      "filename":  "ComplementaryReimagined_r5.10.zip",
                      "url":  "https://cdn.modrinth.com/data/HVnmMxH1/versions/RKfUB9VC/ComplementaryReimagined_r5.10.zip",
                      "sha1":  "ce5f303920c12f858c6b4c27a521fe7a1ba70aea",
                      "client":  "optional",
                      "group":  "shaders"
                  }
              ]
}
'@ | ConvertFrom-Json

function Ask([string]$q) {
  if ($Yes) { return $true }
  $a = Read-Host "$q [y/N]"
  return ($a -match '^(y|yes|はい)$')
}
function Sha1([string]$p) { (Get-FileHash $p -Algorithm SHA1).Hash.ToLower() }
function Fetch([string]$url, [string]$out, [string]$sha1) {
  if ((Test-Path $out) -and $sha1 -and ((Sha1 $out) -eq $sha1)) { return "skip" }
  $tmp = "$out.part"
  Invoke-WebRequest -UseBasicParsing -Uri $url -OutFile $tmp -Headers @{ "User-Agent" = "sky-server-installer/1.0" }
  if ($sha1 -and ((Sha1 $tmp) -ne $sha1)) { Remove-Item $tmp -Force; throw "ハッシュが一致しません: $url" }
  Move-Item $tmp $out -Force
  return "ok"
}

Write-Host "=== $($Manifest.name) インストーラー ===" -ForegroundColor Cyan
Write-Host "Minecraft フォルダ: $MinecraftDir"
if (-not (Test-Path (Join-Path $MinecraftDir "launcher_profiles.json"))) {
  throw "launcher_profiles.json が見つかりません。先に公式ランチャーで Minecraft を一度起動してください。"
}
if (Get-Process -ErrorAction SilentlyContinue | Where-Object { $_.ProcessName -match '^(MinecraftLauncher|Minecraft)$' }) {
  Write-Host "Minecraft ランチャーが起動しています。閉じてから続けてください。" -ForegroundColor Yellow
  if (-not (Ask "ランチャーを閉じましたか？")) { exit 1 }
}

# --- Java 21 以上を探す（ランチャー同梱のものを優先） ---
# java -version は結果をエラー出力に出すので、cmd 経由で受け取る（PowerShell のエラー扱いを避ける）
function JavaMajor([string]$exe) {
  try {
    $out = (& cmd.exe /c "`"$exe`" -version 2>&1") | Out-String
    if ($out -match 'version "(\d+)(?:\.(\d+))?') {
      $m = [int]$Matches[1]
      if ($m -eq 1 -and $Matches[2]) { $m = [int]$Matches[2] }   # 1.8 -> 8
      return $m
    }
  } catch { }
  return 0
}
$candidates = New-Object System.Collections.Generic.List[string]
if ($JavaPath) { $candidates.Add($JavaPath) }
$roots = @(
  (Join-Path $env:LOCALAPPDATA "Packages\Microsoft.4297127D64EC6_8wekyb3d8bbwe\LocalCache\Local\runtime"),
  (Join-Path $MinecraftDir "runtime"),
  "C:\Program Files (x86)\Minecraft Launcher\runtime",
  "C:\Program Files\Minecraft Launcher\runtime",
  "C:\XboxGames\Minecraft Launcher\Content\runtime",
  (Join-Path $env:USERPROFILE "curseforge\minecraft\Install\java"),
  "C:\Program Files\Java",
  "C:\Program Files\Eclipse Adoptium",
  "C:\Program Files\Microsoft",
  "C:\Program Files\Zulu"
)
foreach ($r in $roots) {
  if ($NoJavaSearch) { break }   # 試験用: PATH の java だけで判定する
  if (Test-Path $r) {
    Get-ChildItem $r -Recurse -Filter java.exe -ErrorAction SilentlyContinue | ForEach-Object { $candidates.Add($_.FullName) }
  }
}
$onPath = Get-Command java -ErrorAction SilentlyContinue
if ($onPath) { $candidates.Add($onPath.Source) }

$java = $null; $seen = @{}
foreach ($c in $candidates) {
  if ($seen.ContainsKey($c.ToLower())) { continue }; $seen[$c.ToLower()] = $true
  $m = JavaMajor $c
  if ($m -ge 21) { $java = $c; break }
}
if (-not $java) {
  Write-Host ""
  Write-Host "Java 21 以上が見つかりませんでした。" -ForegroundColor Red
  Write-Host "対処: 公式ランチャーで、普通の Minecraft 1.21.1（mod なし）を一度起動してタイトル画面まで進め、終了してから、このインストーラーをもう一度実行してください。"
  Write-Host "      （ランチャーが Java 21 を自動で入れます）"
  exit 1
}
Write-Host "Java: $java (Java $(JavaMajor $java))"

$work = Join-Path $env:TEMP "sky-server-installer"
New-Item -ItemType Directory -Force $work | Out-Null

# --- 1. NeoForge ---
$nf = $Manifest.neoforge
$versionId = "neoforge-$nf"
if (Test-Path (Join-Path $MinecraftDir "versions\$versionId\$versionId.json")) {
  Write-Host "[1/4] NeoForge $nf は導入済みです。"
} else {
  Write-Host "[1/4] NeoForge $nf をインストールします..."
  $base = "https://maven.neoforged.net/releases/net/neoforged/neoforge/$nf/neoforge-$nf-installer.jar"
  $c = (Invoke-WebRequest -UseBasicParsing "$base.sha1").Content
  if ($c -is [byte[]]) { $c = [Text.Encoding]::ASCII.GetString($c) }
  $sha = ([string]$c).Trim().ToLower()
  $inst = Join-Path $work "neoforge-$nf-installer.jar"
  Fetch $base $inst $sha | Out-Null
  Push-Location $work
  try { & $java -jar $inst --installClient $MinecraftDir | Out-Null } finally { Pop-Location }
  if (-not (Test-Path (Join-Path $MinecraftDir "versions\$versionId\$versionId.json"))) { throw "NeoForge のインストールに失敗しました。" }
  Write-Host "      完了"
}

# --- 2. mod ---
$gameDir = Join-Path $MinecraftDir "installations\$GameDirName"
$wantSodium = Ask "[任意] Sodium（描画が軽くなる）も入れますか？"
$wantShaders = $false
if ($wantSodium) { $wantShaders = Ask "[任意] シェーダー（Iris と、シェーダー Ray・Complementary Reimagined）も入れますか？" }
Write-Host "[2/4] mod を取得します（保存先: $gameDir）..."
$keep = @{}
foreach ($f in $Manifest.files) {
  if ($f.client -eq "unsupported") { continue }
  if ($f.client -eq "optional") {
    if ($f.group -eq "sodium" -and -not $wantSodium) { continue }
    if ($f.group -eq "shaders" -and -not $wantShaders) { continue }
  }
  $dir = Join-Path $gameDir $f.dir
  New-Item -ItemType Directory -Force $dir | Out-Null
  $out = Join-Path $dir $f.filename
  $r = Fetch $f.url $out $f.sha1
  $keep[$out.ToLower()] = $true
  Write-Host ("      {0,-4} {1}" -f $r, $f.filename)
}
# 一覧にない古い jar は mods-old に移す（消さない）
$modsDir = Join-Path $gameDir "mods"
$old = Get-ChildItem $modsDir -Filter *.jar -ErrorAction SilentlyContinue | Where-Object { -not $keep.ContainsKey($_.FullName.ToLower()) }
if ($old) {
  $oldDir = Join-Path $gameDir "mods-old"
  New-Item -ItemType Directory -Force $oldDir | Out-Null
  $old | ForEach-Object { Move-Item $_.FullName $oldDir -Force; Write-Host "      移動 $($_.Name) -> mods-old" }
}

# --- 3. サーバー一覧 ---
$serversDat = Join-Path $gameDir "servers.dat"
if (Test-Path $serversDat) {
  Write-Host "[3/4] servers.dat は既にあるので変更しません（接続先: $($Manifest.serverAddress)）。"
} else {
  [IO.File]::WriteAllBytes($serversDat, [Convert]::FromBase64String($Manifest.serversDatBase64))
  Write-Host "[3/4] サーバー一覧に「$($Manifest.serverName)」を登録しました。"
}
if ($wantShaders) {
  $cfg = Join-Path $gameDir "config"; New-Item -ItemType Directory -Force $cfg | Out-Null
  $ip = Join-Path $cfg "iris.properties"
  $sp = ($Manifest.files | Where-Object { $_.dir -eq "shaderpacks" } | Select-Object -First 1).filename
  if (-not (Test-Path $ip) -and $sp) { [IO.File]::WriteAllText($ip, "enableShaders=true`nshaderPack=$sp`n") }
}

# --- 4. ランチャーの起動構成 ---
$lp = Join-Path $MinecraftDir "launcher_profiles.json"
Copy-Item $lp "$lp.bak-sky-server" -Force
$json = [IO.File]::ReadAllText($lp, [Text.Encoding]::UTF8) | ConvertFrom-Json
$now = (Get-Date).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ss.fffZ")
$prof = [pscustomobject]@{
  name          = $Manifest.name
  type          = "custom"
  icon          = "Grass"
  lastVersionId = $versionId
  gameDir       = $gameDir
  javaArgs      = "-Xmx4G -XX:+UseG1GC"
  created       = $now
  lastUsed      = $now
}
$json.profiles | Add-Member -Force NoteProperty "sky-server" $prof
[IO.File]::WriteAllText($lp, ($json | ConvertTo-Json -Depth 20), (New-Object Text.UTF8Encoding($false)))
Write-Host "[4/4] ランチャーに起動構成「$($Manifest.name)」を追加しました（メモリ 4GB。変更前の設定は launcher_profiles.json.bak-sky-server）。"

Write-Host ""
Write-Host "完了しました。ランチャーで「$($Manifest.name)」を選んで起動し、マルチプレイから「$($Manifest.serverName)」に接続してください。" -ForegroundColor Green
