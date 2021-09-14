# Install system 
1. Install docker 
2. Import images 


# Setup system 
1. Startup gitlab 
#docker-compose up 

docker-compose exec gitlab  grep root /etc/
- Get root password 


2. Install gitlab-runner in macosx or ubuntu 
https://docs.gitlab.com/runner/install/
https://docs.gitlab.com/runner/install/osx.html


3. Register runner 
https://docs.gitlab.com/runner/register/

Note: 
  - Please see  /init/gitlab-runner/config.toml to understand register 


# Config test project 
1. Add gitlab 
 git remote add origin  http://localhost/blockchain/test-cicd.git

2. Add github 
 git remote add github git@github.com:binhnt-teko/test-cicd.git


3. Push to gitlab & github
git branch -M master
git push origin master

git branch -M main
git push github main


#  Other Support 
2. Config gitlab-runner via proxy 
https://docs.gitlab.com/runner/configuration/proxy.html


3. Support proxy dns 
http://mageddo.github.io/dns-proxy-server/latest/en/1-getting-started/running-it/

