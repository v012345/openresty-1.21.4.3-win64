ngx.say(ngx.var.uri, "<br>")
-- 获取GET请求参数
local args = ngx.req.get_uri_args()

-- 输出参数到Nginx的错误日志
ngx.log(ngx.ERR, "GET参数: ", ngx.encode_args(args))

-- 在响应中输出GET参数
ngx.say("GET参数: ", ngx.encode_args(args))

-- 获取POST请求参数
ngx.req.read_body()
local post_args, err = ngx.req.get_post_args()

if not post_args then
    ngx.log(ngx.ERR, "无法获取POST参数: ", err)
    return ngx.exit(ngx.HTTP_BAD_REQUEST)
end

-- 输出参数到Nginx的错误日志
ngx.log(ngx.ERR, "POST参数: ", ngx.encode_args(post_args))

-- 在响应中输出POST参数
ngx.say("POST参数: ", ngx.encode_args(post_args))
