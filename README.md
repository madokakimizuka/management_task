#### Userモデル
|カラム名|データ型|
|:--:|:--:|
|id|integer|
|name|string|
|e-mail|string|
|password_digest|string|

#### Taskモデル
|カラム名|データ型|
|:--:|:--:|
|id|integer|
|user_id(FK)|references|
|title|string|
|content|text|
|deadline|date|
|priority|string|
|status|string|

#### labelingモデル
|カラム名|データ型|
|:--:|:--:|
|id|integer|
|task_id(FK)|references|
|label_id(FK)|references|

#### Labelモデル
|カラム名|データ型|
|:--:|:--:|
|id|integer|
|name|string|

***  
##Herokuへのデプロイ手順
1. コミットする。
1. 'heroku create' でHerokuに新しいアプリケーションを作成する。
1. 'git push heroku master' でHerokuにデプロイ
