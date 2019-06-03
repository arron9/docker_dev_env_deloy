# Content Service Endpoint Table

## 分类(Catrogry)

`/api/category`

### 新建
path: /new

verb: post

headers:

| key | description |
|-----|-------------|
| user_agent |   |
| authed_account |  account name |
| access_token | access token returned by login action |

body:

| key | description |
|-----|-------------|
| name | name |
| desc | description |
| img | image url |

return:

http code(0)


