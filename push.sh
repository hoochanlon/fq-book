# 确保脚本抛出遇到的错误
set -e

# 如果是发布到自定义域名
# echo 'www.example.com' > CNAME
# 脚本参考 http://wmm66.com/index/article/detail/id/62.html

git add .
git commit -m 'push'
git push

exit 0