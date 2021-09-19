# Install system 
1. Install docker 
2. Import images 


# Setup system 
1. Startup gitlab 
#docker-compose up 

- Get root password 

docker-compose exec gitlab cat  /etc/gitlab/initial_root_password 
or
cat  data/gitlab/config/initial_root_password

- Register gitlab-runner 
docker-compose exec  gitlab-runner gitlab-runner register

++ Input data for runner  ***
+ Enter the GitLab instance URL (for example, https://gitlab.com/):
http://gitlab
+ Enter the registration token:
 Enter token from http://103.161.39.153/admin/runners 
+ Enter tags for the runner (comma-separated): 
docker 
+ docker
+ golang


- Config gitlab-runner only pull image if not exist 
vi data/gitlab-runner/config/config.toml 

Add to line in runner config 
  volumes = ["/var/run/docker.sock:/var/run/docker.sock", "/cache", "/var/cicd/share/:/share:rw"]
  pull_policy = ["if-not-present"]


docker-compose exec gitlab-runner gitlab-runner  restart

docker-compose up gitlab-runner
docker-compose logs -f  gitlab-runner

Note: 
 - build ansibel docker from docker file for ansible 
    docker build -t    vnpay-ansible init/docker-ansible/

2. Install gitlab-runner in macosx or ubuntu  & Register runner 
 - Install 
      https://docs.gitlab.com/runner/install/
      https://docs.gitlab.com/runner/install/osx.html

      https://docs.gitlab.com/runner/install/linux-manually.html

  - Linux: X64 
  sudo curl -L --output /usr/local/bin/gitlab-runner "https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64"

  sudo chmod +x /usr/local/bin/gitlab-runner
  sudo useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash
  
  sudo gitlab-runner install --user=gitlab-runner --working-directory=/home/gitlab-runner 

- Register runner to gitlab 
  gitlab-runner register 

  ++ Input data for runner  ***
+ Enter the GitLab instance URL (for example, https://gitlab.com/):
http://localhost
+ Enter the registration token:
 Enter token from http://103.161.39.153/admin/runners 
+ Enter tags for the runner (comma-separated): 
docker 
+ docker
+ golang

- Start gitlab runner
  sudo gitlab-runner start



  - Register 
https://docs.gitlab.com/runner/register/

Note: 
  - Please see  /init/gitlab-runner/config.toml to understand register 

3. Configuring the external URL for GitLab

- Change in file 
vi data/gitlab/config/gitlab.rb 
or 
docker-compose exec  gitlab  vi /etc/gitlab/gitlab.rb

- trigger reconfig 
docker-compose exec  gitlab   gitlab-ctl reconfigure


# Config test project 
1. Create project in new gitlab: test-cicd 
http://103.161.39.153/test/test-cicd.git

2. Add gitlab 
cd test 
git remote add test  http://103.161.39.153/test/test-cicd.git
git pull test main 

3. Push to gitlab & github
git add .
git commit -m "run-build-job"

git branch -M master
git push origin master

git pull test main --allow-unrelated-histories 
git config --system --unset credential.helper
git branch -M main
git push test main


#  Other Support 
2. Config gitlab-runner via proxy 
https://docs.gitlab.com/runner/configuration/proxy.html


3. Support proxy dns 
http://mageddo.github.io/dns-proxy-server/latest/en/1-getting-started/running-it/


Note: 
   Change password:  
   docker-compose exec gitlab  gitlab-rake "gitlab:password:reset[root]"
