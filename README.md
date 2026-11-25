# 空島サーバー（Minecraft 1.21.1 NeoForge）

## ダウンロード

| ファイル | 使う人 |
|---|---|
| [sky-server-1.3.0.mrpack](files/sky-server-1.3.0.mrpack) | Modrinth App / Prism Launcher を使う人 |
| [install-sky-server.zip](files/install-sky-server.zip) | 公式ランチャーを使う人（展開して、中の `install-sky-server.bat` を実行） |

ファイルを開いたページの右上にある「Download raw file」ボタンで保存できます。
導入のしかたは、下の「かんたん導入」を読んでください。

---

> 2026-11-25 時点の案内です（Legendary Monsters・Create Big Cannons・シェーダー Ray を追加。ワールドを新しく作り直しました）。

## 1. サーバー情報

- Minecraft: 1.21.1（Java版）
- ローダー: NeoForge 21.1.267（サーバーと同じ版）
- 接続先: `133.18.147.85`
- Java: Java 21（公式ランチャーなら自動で用意されます）
- ワールド: 空に大きな島が浮かぶワールド（Sky Archipelago）。島の下は何もない空間（void）です。落ちると、同じ場所の上空に戻されて落ち続けます（3 回まで。その間にエリトラやエンダーパールで立て直せます）。4 回目は死にます

## かんたん導入（おすすめ）

上の「ダウンロード」のファイルで、NeoForge・mod・接続先の登録までまとめて入ります。どちらか一つを選んでください。

### A. Modrinth App / Prism Launcher を使う人: `sky-server-1.3.0.mrpack`

1. Modrinth App（https://modrinth.com/app ）か Prism Launcher（https://prismlauncher.org ）を入れる。
2. `sky-server-1.3.0.mrpack` を読み込む（古い版を入れた人は、1.3.0 で入れ直してください）（Modrinth App は「インスタンスを作成」→「ファイルから」、Prism Launcher は「インスタンスを追加」→「インポート」）。
3. 任意の mod（Sodium、Iris、シェーダー）を入れるか聞かれたら、好みで選ぶ。Iris とシェーダーを使うときは Sodium も選ぶ。
4. 起動して、マルチプレイの「空島サーバー」に接続する。

### B. 公式ランチャーを使う人: `install-sky-server.bat`（と同じフォルダの `install-sky-server.ps1`）

1. Minecraft 公式ランチャーで、**普通の Minecraft 1.21.1（mod なし）を一度起動してタイトル画面まで進め**、終了してから**ランチャーを閉じる**（このときランチャーが Java 21 を入れます。インストーラーはこの Java 21 を使います）。
2. `install-sky-server.zip` を展開し、中の `install-sky-server.bat` をダブルクリックする（Windows の警告が出たら「詳細情報」→「実行」）。
3. Sodium とシェーダーを入れるか聞かれるので、`y` か `n` で答える。
4. ランチャーを開き、起動構成「空島サーバー」を選んで起動し、マルチプレイの「空島サーバー」に接続する。

スクリプトがすること: NeoForge 21.1.267 の導入、`.minecraft\installations\sky-server` への mod の取得（Modrinth から。ハッシュ確認あり）、サーバー一覧への登録、起動構成「空島サーバー」（メモリ 4GB）の追加。他の起動構成やワールドには触りません。2 回目以降は、足りないものだけ取得します。

うまくいかないときは、下の「手動で入れる」の手順で入れてください。

## 2. 導入する mod 一覧（手動で入れる場合）

### 必須（19 個。サーバーと同じ版を入れる）

| mod | 版 | ダウンロード |
|---|---|---|
| Create | 6.0.10 | https://modrinth.com/mod/create |
| Create: Aeronautics | 1.3.3 | https://modrinth.com/mod/create-aeronautics |
| Sable | 2.0.6 | https://modrinth.com/mod/sable |
| Architectury API | 13.0.12 | https://modrinth.com/mod/architectury-api |
| Sky Archipelago | 1.4 | https://modrinth.com/mod/sky-archipelago |
| Ars Nouveau | 5.13.5 | https://modrinth.com/mod/ars-nouveau |
| Curios API | 9.6.0 | https://modrinth.com/mod/curios |
| GeckoLib | 4.9.3 | https://modrinth.com/mod/geckolib |
| Kaleidoscope Cookery | 1.6.0 | https://modrinth.com/mod/kaleidoscope-cookery |
| Exposure | 1.9.21 | https://modrinth.com/mod/exposure |
| Exposure: Space | 1.4.0 | https://modrinth.com/mod/exposure-space |
| Create Collision Crashfix | 1.0.0 | https://modrinth.com/mod/create-collision-crashfix |
| JEI（Just Enough Items） | 19.64.0.455 | https://modrinth.com/mod/jei |
| MezzConfig | 0.7.1 | https://modrinth.com/mod/mezzconfig （JEI に必要） |
| JourneyMap | 6.0.9 | https://modrinth.com/mod/journeymap |
| Common Network | 1.0.21 | https://modrinth.com/mod/common-network （JourneyMap に必要） |
| Legendary Monsters | 2.2.4 | https://modrinth.com/mod/legendary-monsters |
| Create Big Cannons | 5.11.7 | https://modrinth.com/mod/create-big-cannons |
| Ritchie's Projectile Library | 2.1.2 | https://modrinth.com/mod/rpl （Create Big Cannons に必要） |

### クライアントだけに入れる（5 個）

| mod | 版 | 内容 | ダウンロード |
|---|---|---|---|
| Ok Zoomer | 10.0.0-beta.13+neo | ズーム（キーは操作設定の Ok Zoomer の項目で確認・変更できます） | https://modrinth.com/mod/ok-zoomer |
| Inventory Profiles Next | 2.2.5 | インベントリ・チェストの並べ替え、道具の自動補充 | https://modrinth.com/mod/inventory-profiles-next |
| libIPN | 6.6.3 | Inventory Profiles Next に必要 | https://modrinth.com/mod/libipn |
| Kotlin for Forge | 5.13.0 | Inventory Profiles Next に必要 | https://modrinth.com/mod/kotlin-for-forge |
| Mouse Tweaks | 2.26.1 | ドラッグやホイールでアイテムをまとめて移動 | https://modrinth.com/mod/mouse-tweaks |

各ページの「Versions」で、Minecraft 1.21.1 / NeoForge 向けの、上の表の版を選んでください。

### 任意（入れなくても遊べる）

| mod | 版 | 内容 | ダウンロード |
|---|---|---|---|
| Sodium | 0.8.13 | 描画が軽くなる | https://modrinth.com/mod/sodium |
| Iris | 1.8.14-beta.1 | シェーダーを使える（Sodium 0.8.13 と一緒に入れる） | https://modrinth.com/mod/iris |

シェーダーを使う場合は、シェーダーパックを `shaderpacks` フォルダに入れ、ビデオ設定の「シェーダーパック」から選んでください。かんたん導入でシェーダーを選ぶと、次の 2 つが入ります（公式ランチャー用スクリプトでは Ray が最初から選ばれた状態になります）。

- Ray（`Ray-0.1.0a0-37c865d-nightly.zip`、https://github.com/kuwacom/ray/releases/tag/nightly ）: 試作段階（アルファ版）のシェーダーです。表示が乱れたり重かったりしたら、Complementary Reimagined に切り替えるか、シェーダーをオフにしてください
- Complementary Reimagined r5.10（https://modrinth.com/shader/complementary-reimagined ）

### 注意

- Sodium を入れる場合は 0.8.12-alpha.2 以上にしてください（それより古い版は Sable と一緒に使えません）。
- Distant Horizons は入れないでください。このサーバーの空島と合わず、遠景が地上の地形で描かれます。
- 描画距離は、サーバー側で 20 チャンクまでにしています。クライアントで 20 より大きくしても、それ以上は見えません。

## 3. 導入手順（手動で入れる場合）

1. Minecraft 公式ランチャーで、Minecraft 1.21.1 を一度起動できる状態にする。
2. NeoForge 21.1.267 のインストーラーを公式サイト（https://neoforged.net ）から入手し、「Install client」でインストールする。
3. ランチャーの「起動構成」で、NeoForge 21.1.267 の構成を開き、「ゲームディレクトリ」を、このサーバー専用の新しいフォルダにする（他の mod と混ざらないようにするため）。
4. そのフォルダの中に `mods` フォルダを作り、上の必須 mod（と、使うなら任意 mod）を入れる。
5. 一度起動して、エラーがなく、タイトル画面に NeoForge の表示が出ることを確認する。
6. 「マルチプレイ」から「サーバーを追加」を選び、アドレスに `133.18.147.85` を入力して接続する。

## 4. 困ったとき

- mod を入れた後にクラッシュしたら、ゲームフォルダの `logs/latest.log`（クラッシュ時は `crash-reports` の中のファイル）を管理者に渡してください。
- 「mod が足りない」「版が違う」と出て入れないときは、表示された mod 名と版を管理者に伝えてください。

## 5. 遊ぶときの注意

- 飛行船（Create: Aeronautics）の挙動は、mod 同士の組み合わせによって不安定な場合があります。
- 不具合を見つけたら、管理者に次の情報を伝えてください。
  - いつ、何をしたか
  - `logs/latest.log` の該当部分
  - 使っている mod の版
