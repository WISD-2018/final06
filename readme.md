![image](https://i.imgur.com/X9nAKHx.png)
> 更多 [網路拍賣系統](https://imgur.com/a/WXNdA2X) 圖片 

# 網路拍賣系統

一套簡易型的網路拍賣系統

## 網站功能

#### 共同功能


#### 使用者端 

- 登入、註冊、找回密碼、信箱驗證
- 購物車管理
- 商品收藏
- 收貨地址
- 歷史列表
- 查看訂單
- 購物：查看商品 -》訂購商品
 
#### 管理者端

- 商品搜尋
- 新增商品、修改庫存、修改商品、商品下架
- 使用者管理


## 網站安裝
#### 1. 還原專案

```sh
$ git clone https://github.com/WISD-2018/final06.git
$ composer install --no-script
$ cp .env.example .env
$ php artisan migrate
$ php artisan key:generate 
$ php artisan config:cache 
$ php artisan route:cache 
$ php artisan cache:clear 
$ php artisan admin:install

```

#### 2.匯入資料

1. 編輯 .env 檔
2. 新增資料庫 
3. 將 final06.sql 匯入至該資料庫

## Default User
#### 使用者端
> 帳號:3A417029@ncut.edu.tw 密碼:123456

#### 管理者端
> 帳號:admin 密碼:admin

### Designer
- [Wei Hao Zhu](https://github.com/3A417029)
- [yu yu Lee](https://github.com/3A417118)