言語: 　[English](./README.md)　|　**日本語**

# ごあんない
![シロの頭](./README_images/head_shiro.png)
ここは、**シロ**のブランチです。

![仙狐さんの頭](./README_images/head_senko.png)
**仙狐さん**のブランチは[こちら](https://github.com/Gakuto1112/SenkoSan/tree/Senko)

![鈴の頭](./README_images/head_suzu.png)
**鈴**のブランチは[こちら](https://github.com/Gakuto1112/SenkoSan/tree/Suzu)

![夜空の頭](./README_images/head_sora.png)
**夜空**のブランチは[こちら](https://github.com/Gakuto1112/SenkoSan/tree/Sora)

***
# Shiro（シロ）
TVアニメ「世話やきキツネの仙狐さん」とその原作に登場するキャラクターを再現した、[Minecraft](https://www.minecraft.net/ja-jp)のスキンMod「[Figura](https://modrinth.com/mod/figura)」向けスキン「Shiro（シロ）」です。

ターゲットFiguraバージョン：[0.1.4](https://modrinth.com/mod/figura/version/0.1.4+1.20.4)

![メイン](./README_images/main.jpg)

## 特徴
- 耳と尻尾のモデルが生えています。
  - 尻尾はプレイヤーの動きに合わせて揺れます。

    ![尻尾が揺れる](./README_images/swaying_tail.gif)

  - 耳は**Xキー**、尻尾は**Zキー**で動かすことができます。

    ![耳を動かす](./README_images/jerk_ears.gif)

    ![尻尾を動かす](./README_images/wag_tail.gif)

- 現在のHPや満腹度に応じてキャラクターの耳が垂れさがったり、表情が変わったりします。

  ![HPとアバター](./README_images/hp_avatar.jpg)

- 時々瞬きします。
- [アクションホイール](#アクションホイール)で様々なアニメーションを実行できます。

  ![箒掃除](./README_images/action_bloom_cleaning.gif)

- [アクションホイール](#アクション2-1-おすわり)で座ることができます。
  - 座らないと実行できないアニメーションがあります。

  ![おすわり](./README_images/action_sit_down.jpg)

- カーソルキー（↑→↓←）を押すと、表情が変わります。

  ![キーエモート](./README_images/key_emotes.jpg)

- 剣が薙刀になります（原作漫画第七十七尾）。
  - メインハンドで持つと薙刀を構えます（オフハンドでは構えません）。
  - 薙刀を構えながら盾で防御をすると、薙刀で防御する構えをとります。

  ![薙刀](./README_images/naginata.jpg)

- 就寝時は狐のような寝姿になります（第2話）。
  - 暗闇デバフを受けている時はまた別の寝姿（？）になります。

  ![寝姿](./README_images/sleeping_pose.jpg)

- 有効なダブルべッドで寝る場合は、仙狐さんが添い寝してくれます（第2話）。
  - 有効なダブルべッドとは、2つ（以上）のベッドが同じ向きで横に隣接しているかつ、そのべッドのどちらも使用中ではないこといいます。
  - ダミーのプレイヤーのスキンは、あなたのスキンになります。
  - ダミーのプレイヤーが寝ているベッドは実際には誰も寝ていないため、他のプレイヤーや村人がそのベッドで寝ることがあります（その場合は通常の睡眠アニメーションに変化します）。
  - 一人称視点で添い寝してもらうと...？

  ![添い寝](./README_images/sleeping_togheter.jpg)

- 複数の衣装チェンジができます。どのような衣装があるかは[衣装カタログ](./costume_catalog_jp.md)をご覧ください。

  ![衣装](./README_images/costume_outgoing.jpg)

- 写真撮影向けにいくつかポーズをとることができます。

  ![撮影ポーズ](./README_images/photo_pose.jpg)

- 一定時間放置すると尻尾を手入れしたり、こたつでくつろいだりします。

  ![尻尾の手入れ](./README_images/action_tail_grooming.gif)

  ![こたつでくつろぐ](./README_images/kotatsu.jpg)

- あなたの表示名をキャラクターの名前に変更できます。
  - 他のプレイヤーがこの名前を見えるようにするには、**他のプレイヤーもFiguraを導入し、他のプレイヤー側であなたに対する信頼設定を十分上げる必要があります**。

  ![名前変更](./README_images/name_change.jpg)

- プレイヤーの頭ブロックが仙狐さんのフィギュアになります（[設定](#アクション4-3-プレイヤーの頭のタイプの変更)で変更できます）。
  - [画像右上のフィギュア](https://www.goodsmile.info/ja/product/9273/仙狐.html)
  - [画像上中央のフィギュア](https://www.geestore.com/detail/id/00000093048)
  - [画像右上のフィギュア](https://www.amazon.co.jp/gp/product/B07XZ6754D)
  - 画像左下のフィギュアは、漫画10巻裏のイラストを基に作成しました。
  - [画像右下のフィギュア](https://twitter.com/Kanda_omiyage/status/1627141001197531136?t=pWBnib7WuzlAD-uUdDcqIg&s=19)

  ![プレイヤーの頭](./README_images/player_heads.jpg)

- 水に触れると濡れてしまいます。
  - 水から上がると身震いして体に付いた水滴を飛ばします（[設定](#アクション4-4-自動ぶるぶるの切り替え)でオフにできます）。

    ![ぶるぶる](./README_images/action_body_shaking.gif)

  - 尻尾は水にぬれるとしなびてしまいます（第5話）。

    ![しなびた尻尾](./README_images/shriveled_tail.jpg)

- 雨が降っていると傘をさします。
  - 傘をさしている場合は雨で濡れることはありません。
  - オフハンドにアイテムを持っている時やアニメーションを再生した時は雨でも傘をしまいます（この場合はもちろん濡れます）。
  - 傘を開閉する音は[設定](#アクション4-7-傘の開閉音の切り替え)でオフにできます。

  ![傘](./README_images/umbrella.jpg)

- 暗視が付与されていると周囲に狐火が出現します。
  - キャラクターによって出現する狐火の数は異なります。
  - 濡れている場合は消えてしまいます。
  - シェーダーパックを適用するとブルーム効果により、より狐火らしくなります。

  ![狐火](./README_images/foxfires.gif)

- ウォーデンが付近いる（≒暗闇デバフを受けている）と、怯えて震えます。

  ![ウォーデンに怯える](./README_images/scared_of_warden.jpg)

  - 怯えている時は、エモートを拒否拒否するようになります。

    ![エモート拒否](./README_images/refusing_animations.gif)

## アクションホイール
Figuraには、アクションホイールキー（デフォルトは「B」キー）を押すことで、エモートなどを実行できるリングメニューが実装されています。このアバターにもいくつかのアクションが用意されています。

### ページ1（立ちアクション）

![アクションホイール1](./README_images/action_wheel_1.jpg)

#### アクション1-1. にっこり（うやん♪）
他のアクションの最後で行うにっこりを単体で行います。左クリックでにっこりするだけ、右クリックで効果音とパーティクルも再生されます。

![にっこり](./README_images/action_smile.jpg)

#### アクション1-2. ぶるぶる
水から上がった際のぶるぶるを手動で実行できます。

![ぶるぶる](./README_images/action_body_shaking.gif)

#### アクション1-3. お掃除
左クリックで箒掃除、右クリックで拭き掃除を行います。箒掃除にはレアパターンが存在します（レアパターンのアニメーションは第4話）。

![箒掃除](./README_images/action_bloom_cleaning.gif)

![拭き掃除](./README_images/action_wipe_cleaning.gif)

#### アクション1-4. 散髪
プレイヤーの髪を整えてくれます（第9話、スキンはプレイヤーのスキンになります）。少し切り過ぎますが...

![散髪](./README_images/action_hair_cutting.gif)

#### アクション1-5. きつねじゃんぷ
キツネのように雪に飛び込みます（第10話）。雪が十分に積もっており、十分なスペースが必要です。

![きつねジャンプ](./README_images/action_fox_jump.gif)

#### アクション1-6. 尻尾の手入れ
尻尾にブラッシングをかけ、尻尾のモフリティを上げます（原作漫画第十六.五尾）。このアクションは立っていても座っていても実行できます。

![尻尾の手入れ](./README_images/action_tail_grooming.gif)

#### アクション1-7. こたつ
こたつに入ってだらーんとします（第10話）。このアクションは、プレイヤーが移動する等の要因によってアクションがキャンセルされるまで実行され続けます（時間経過により止まることはありません）。

![こたつ](./README_images/kotatsu.jpg)

### ページ2（座りアクション）

![アクションホイール2](./README_images/action_wheel_2.jpg)

#### アクション2-1. おすわり
その場に座ります。もう一度アクション実行で立ち上がります。座っている時に動いたり、ジャンプしたり、スニークしたりすると自動で立ち上がります。

![おすわり](./README_images/action_sit_down.jpg)

#### アクション2-2. 尻尾もふもふ
プレイヤーが仙狐さんの尻尾をモフモフします（第1話、スキンはプレイヤーのスキンになります）。このアクションを実行するには先に座って下さい。ただし、お出かけ服や防具表示状態でチェストプレートを着用している場合は実行できません。

![尻尾モフモフ](./README_images/action_tail_cuddling.gif)

#### アクション2-3. お耳もふもふ
プレイヤーが仙狐さんの耳をモフモフします（第2話、スキンはプレイヤーのスキンになります）。このアクションを実行するには先に座って下さい。ただし、耳が覆われるような衣装を着用している場合は実行できません。

![お耳モフモフ](./README_images/action_ears_cuddling.gif)

#### アクション2-4. 耳かき
膝枕でプレイヤーの耳を掃除してくれます（第2話、スキンはプレイヤーのスキンになります）。このアクションを実行するには先に座って下さい。

![耳かき](./README_images/action_ear_pick.gif)

#### アクション2-5. お茶
ほうじ茶を飲んで一息つきます（第6話）。このアクションを実行するには先に座って下さい。

![お茶](./README_images/tea_time.gif)

#### アクション2-6. まっさーじ
プレイヤーの肩をほぐしてくれます（第7話、スキンはプレイヤーのスキンになります）。このアクションを実行するには先に座って下さい。

![マッサージ](./README_images/massage.gif)

### ページ3（撮影ポーズ）

![アクションホイール3](./README_images/action_wheel_3.jpg)

7種類のポーズをとることができます。写真撮影にどうぞ。尚、撮影ポーズ7は、小道具として傘を使用します。

![撮影ポーズ](./README_images/photo_pose.jpg)

### ページ4（アバター設定1）

![アクションホイール4](./README_images/action_wheel_4.jpg)

#### アクション4-1. 衣装変更
仙狐さんの[衣装](./costume_catalog_jp.md)を変更します。スクロールで衣装を変更し、アクションホイールを閉じると確定します。選択中に左クリックをすると現在の設定値に、右クリックすると初期値にリセットされます。

#### アクション4-2. 名前変更
プレイヤーの表示名を変更します。スクロールで表示名を選択し、アクションホイールを閉じると確定します。選択中に左クリックをすると現在の設定値に、右クリックすると初期値にリセットされます。ただし、他のプレイヤーが変更された名前を見るには、**そのプレイヤーもFiguraを導入し、他のプレイヤー側であなたに対する信頼設定を十分上げる必要があります**。

![名前変更](./README_images/name_change.jpg)

設定できる名前の選択肢は以下の通りです。

- <プレイヤー名>
- Shiro
- シロ

#### アクション4-3. プレイヤーの頭のタイプの変更
アバターの「プレイヤーの頭」のモデルタイプを変更します。選択中に左クリックをすると現在の設定値に、右クリックすると初期値にリセットされます。

![プレイヤーの頭](./README_images/player_heads.jpg)

設定できるモデル選択肢は以下の通りです。

- デフォルト（アバターの頭のみのモデル）
- フィギュア（[参考](https://www.goodsmile.info/ja/product/9273/仙狐.html)）
- メイドのフィギュア（[参考](https://www.geestore.com/detail/id/00000093048)）
- チアリーダーのフィギュア（[参考](https://www.amazon.co.jp/gp/product/B07XZ6754D)）
- きつねパーカーのフィギュアは、漫画10巻裏のイラストを基に作成しました。
- 着物のフィギュア（[参考](https://twitter.com/Kanda_omiyage/status/1627141001197531136?t=pWBnib7WuzlAD-uUdDcqIg&s=19)）

Mobが被っているプレイヤーの頭は設定に関わらず、デフォルトの頭になります。

プレイヤーの頭はチートモードで以下のコマンドを入力すると入手できます：
```
/give @p minecraft:player_head{SkullOwner: "<プレイヤー名>"} 1
```

#### アクション4-4. 自動ぶるぶるの切り替え
濡れている際に自動的に[ぶるぶる](#アクション1-2-ぶるぶる)を実行するかどうかを設定できます。

#### アクション4-5. 防具の表示の切り替え
防具を表示するかどうかを設定できます。一部の[衣装](./costume_catalog_jp.md)は防具と干渉しないように、防具装備中は非表示になります。この設定はバニラの防具にのみ対応しています。

#### アクション4-6. 一人称視点での狐火の表示の切り替え
一人称視点で狐火のパーティクルを表示するかどうかを設定できます。上を向いた際に、頭上の狐火が煩わしいと感じる場合はオフにして下さい。

![狐火](./README_images/foxfires.gif)

#### アクション4-7. 傘の開閉音の切り替え
傘の開閉音を再生するかどうかを設定できます。傘の開閉音が煩わしいと感じる場合はオフにして下さい。

### ページ5（アバター設定2）

![アクションホイール5](./README_images/action_wheel_5.jpg)

#### アクション5-1. 常に傘をさす
傘を差せる状況下において、雨が降っていなくても常に傘をさします。撮影用途などにどうぞ。

![傘](./README_images/umbrella.jpg)

#### アクション5-2. メッセージの表示
アクションホイールでのメッセージ以外の、良く表示されるであろう一部メッセージを表示するかどうかを設定できます。メッセージが煩わしいと感じる場合はオフにして下さい。

## 使用方法
Figuraは[Forge](https://files.minecraftforge.net/net/minecraftforge/forge/)、[Fabric](https://fabricmc.net/)、[NeoForge](https://neoforged.net/)に対応しています。

1. 使用したいModローダーをインストールし、Modを使用できる状態にします。
2. [Figura](https://modrinth.com/mod/figura)を追加します。Modの依存関係にご注意ください。
3. [リリースページ](https://github.com/Gakuto1112/SenkoSan/releases)に移動します。
   - [レポジトリのトップページ](https://github.com/Gakuto1112/SenkoSan)の右側からも移動できます。
4. リリースノート内の「Assets」の項目にアバターのzipファイルが添付されているので、お好みのアバターをダウンロードします。
5. 圧縮ファイルを展開し、中にあるアバターデータを取り出します。
6. `<マインクラフトのゲームフォルダ>/figura/avatars/`にアバターのデータを配置します。
   - Figuraを導入した状態で一度ゲームを起動すると自動的に作成されます。存在しない場合は手動での作成も可能です。
7. ゲームメニューからFiguraメニュー（Δマーク）を開きます。
8. 画面左のアバターリストからアバターを選択します。
9. 必要に応じて権限設定をして下さい。
10. アバターをサーバーにアップロードすると、他のFiguraプレイヤーもあなたのアバターを見ることができます。
    - **海賊版（割れ、非正規版、無料版）のマインクラフトでは、アバターをアップロードすることはできません。**
    これはFiguraの仕様であり、これに関しては対応できません。

#### 追記事項
ここに書かれてあるアバターのダウンロード方法の他に、レポジトリのトップページの右側にある「Releases」からでもアバターファイルをダウンロードできるようにしました。各リリースノートの「Assets」の項目に各アバターのzipファイルが添付されています。

## 注意事項
- このアバターを使用して発生した、いかなる損害の責任も負いかねます。
- このアバターは、デフォルトのリソースパックでの動作を想定しています。また、他MODの使用は想定していません。想定動作環境外ではテクスチャの不整合、防具が表示されない/非表示にならない、といった不具合が想定されます。この場合の不具合は対応しない場合がありますのでご了承下さい。
- 私（[Gakuto1112](https://github.com/Gakuto1112)）のマルチプレイで動作検証を行う環境が不十分である為、マルチプレイにおいて発生する不具合がある可能性があります。
- 不具合がありましたら、[Issues](https://github.com/Gakuto1112/SenkoSan/issues)までご連絡下さい。
- アバター関係で私に連絡したい方は[Discussions](https://github.com/Gakuto1112/SenkoSan/discussions)または、[Discord](https://discord.com/)でご連絡下さい。私のDiscordのアカウント名は「vinny_san」で表示名は「ばにーさん」です。[FiguraのDiscordサーバー](https://discord.gg/figuramc)での表示名は「BunnySan/ばにーさん」です。

## リンク集
- [Figura（Modrinth）](https://modrinth.com/mod/figura)
- [Figura（GitHub）](https://github.com/Moonlight-MC-Temp/Figura)
- [TVアニメ「世話やきキツネの仙狐さん」オフィシャルサイト](http://senkosan.com/)
- [Amazon.co.jp_ 世話やきキツネの仙狐さんを観る _ Prime Video](https://www.amazon.co.jp/gp/video/detail/B07QJG9NP7)
- [世話やきキツネの仙狐さん - Webで漫画が無料で読める！コミックNewtype](https://comic.webnewtype.com/contents/sewayaki/)

***

![仙狐とシロ1](./README_images/senko_and_shiro_1.jpg)

![仙狐とシロ2](./README_images/senko_and_shiro_2.jpg)

![仙狐とシロ3](./README_images/senko_and_shiro_3.jpg)

![仙狐とシロ4](./README_images/senko_and_shiro_4.jpg)

![仙狐とシロ5](./README_images/senko_and_shiro_5.jpg)
