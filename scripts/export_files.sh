#!/bin/bash
docker export --output="../packages/gitlab-runner.tar" test-cicd_gitlab-runner_1
docker export --output="../packages/gitlab.tar" test-cicd_gitlab_1