---
title: "基于docker搭建gitlab"
date: 2014-10-19 01:13
---

# docker-gitlab
详细说明: [https://github.com/sameersbn/docker-gitlab](https://github.com/sameersbn/docker-gitlab)

# 方案
- link with docker redis
- link with docker PostgreSQL
- gitlab port 10080
- 数据文件关联到host的文件系统下 /opt/gitlab/data
- smtp使用google，注册gmail邮箱sf.github@gmail.com
- 可以login with github帐号

# Step

```bash
# pull gitlab image from docker hub
sudo docker pull sameersbn/gitlab:latest

# pull postgresql image
docker pull sameersbn/postgresql:latest

# run postgresql container
docker run --name=postgresql -d \
  -e 'DB_NAME=gitlabhq_production' -e 'DB_USER=gitlab' -e 'DB_PASS=password' \
  -v /opt/postgresql/data:/var/lib/postgresql \
  sameersbn/postgresql:latest

# pull redis image
docker pull sameersbn/redis:latest

# run redis container
docker run --name=redis -d sameersbn/redis:latest

# run gitlab container link with postgresql and redis contianers
docker run --name=gitlab -d -h gitlab.s-feng.com \
  --link redis:redisio \
  --link postgresql:postgresql \
  -v /opt/gitlab/data:/home/git/data \
  -e 'GITLAB_PORT=10080' -e 'GITLAB_SSH_PORT=10022' \
  -p 10022:22 -p 10080:80 \
  -e 'GITLAB_HOST=gitlab.s-feng.com' -e 'GITLAB_EMAL=gitlab@gitlab.s-feng.com' \
  -e 'SMTP_USER=sf.gitlab@gmail.com' -e 'SMTP_PASS=$gmail_pass' \
  -e 'OAUTH_GITHUB_API_KEY=6db7c6c996783f30bef0' \
  -e 'OAUTH_GITHUB_APP_SECRET=8d51cefefb9e545edbe06b0af3b8238ff8abe255' \
sameersbn/gitlab:latest

```
