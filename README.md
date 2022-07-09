# BBN6
 
Build environment for researching and implementing improvements and fixes to the pvp mode in Battle Network 6  
This is designed to be used with the Tango netplay solution over at <https://github.com/tangobattle/tango>  

Compatible with BN6 and EXE6  
Supported md5 hashes:  
BN6 Falzar: `1e8c774ba210d1c55113531c7360c737`, BN6 Gregar: `5acc75848bb1ffd3d6d8705554ee333d`  
EXE6 Falzar: `0e3ed3a6cc2f201897c58cb31d43a35f`, EXE6 Gregar: `053cf73404dcc39be7cbd77c8e833150`  

## Features
Fixed a bug in which every hitbox that collides with a target on the same frame is made to completely overwrite the decross flag, which causes only the last hitbox that's processed on a frame to decide whether a player gets decrossed.  

When Windrack is used point-blank against someone who is protected by a barrier, the gusts from the windrack will always have a chance to move the player. This is accomplished by having the wind gust linger at its original position for 2 frames when it's first spawned.  

When Thunder or BugDeathThunder is on the same panel as the character that it's targeting, it will no longer move in a hardcoded direction irrespective of which side spawned it. Instead it will now move in the direction regarded as "forward" by the player who spawned the thunder.  

### Clarification
The extra B in BBN6 stands for Bingus  

# BBN6パッチ内容の解説 
ssbmars氏が作成したBBN6パッチにつき解説をします  
翻訳者の技術力は０なのでそこはご了承お願いいたします  
以上パッチVer1.0.0の変更点の記録となります。  

### 序文
エグゼ・Battle Networkシリーズの通信ケーブル対戦及びワイアレス・アダプター対戦にてホスト（親）側が通信時間を誤魔化すために最終的にゲームの状態を決める仕組みになってますよって、クライアント（子）側から送られてくる入力には１iほどの遅延が発生し、それにより特定の条件で効果が微妙に変わるチップがあります。  

ネット上の通信対戦にて、特にホスト・クライアント（親、子）の決定がランダムであることを考え、チップ使用の齟齬が不公平と感じたこと処を修正するためにBBN6パッチが作成されました。

### 本文
お互い最前列にいる状態、片方がバリア系チップを使用済み、片方がラケット系（テングCS、チップ）発動時に：  
親がバリアを貼ってる場合はバリアが剥がされ、カゼの押し寄せ効果（スイコミ、トップウ系）で後列におされ、子がバリアを貼ってる場合はバリアが剥がされ、カゼの恩恵を受けません。  

子側のラケットの吹き飛ばし効果が1i遅れて発生するため、ラケットのカゼダメージがバリアを剥がす＞吹き飛ばしが相手を押すという結果になります。  

ラケットが空振りする場合は上下移動などで吹き飛ばしの押し効果を止める事はできますが基本的にバリアは剥がれます通信対戦にて上記の条件はエリアの取り合いの重要性も考え珍しくもなく、非平等であることを修正するため両側を子側の仕組みで統一する（つまり親、子関係なく条件を満たせば必ず吹き飛ばしにより押される仕組み）変更を行ってます。  


バグデス使用時に、相手が最後列でインビジ状態でサンダーボールが同パネルに動いた場合：  
バグデスを放ったのが子側である場合、サンダーボールが次に動くパネルが画面内（放ったプレイヤーの方向）に、バグデスを放ったのが親側である場合、サンダーボールが次に動くパネルが画面外になります。

こちらも親、子で動き、対応、戦法などが変わってしまうことを避けるため、サンダーボールの動きを親側の仕様で統一する変更を行ってます。
特定な条件上、バグデスへの下方調整となります。


どちら側が親、子であるかとは関係なく、同フレームで複数のオブジェクトに当たり判定が重なる場合、最後に当たったオブジェクトによりクロス解除の有無が決められるバグを修正してます。  

スイコミ、トップウ チップ使用上でフウジンラケットなどをキラビに当てると稀にクロスが解除されないような現象を防ぐ修正です。
