# DB Fleet in Okteto via Compose file

## Usage

We recommend to duplicate this repository so you can keep updated with the
upstream changes. If you have an copy of this repo, we recommend to use Git branches.

### For GitHub users

1. [Go to this page](https://repo.new/import) and paste this GitHub repo URL in the old repository clone URL.
2. In the new repo details section, make sure to set the privacy to `Private`. Then pick the owner and repository name.
3. Hit `Begin import`. When its done, it'll refresh at will.
4. Skip to Post Repository Creation section below to complete the remaining tasks.

### Post Repository Creation

1. [Sign in to Okteto Cloud.](https://cloud.okteto.com) If you rather use Okteto Enterprise, contact your sysadmin for details about your company's setup.
2. On the namespaces tab, click `Deploy` > `From Git`. If your repo is on GitHub, make sure to add the Okteto Cloud (or your instance's app) to your organization. When done, just find and select your repo.
  * For GitLab/Bitbucket users, use the Git URL option in the form of `https://<username of your bot account>:<PAT of your bot account with readonly access>/git.host/namespace/subgroup/repo.git`
3. If you configured Redis through the config file (either with requirepass key or using the external ACL file) and followed the instructions in the `redis/README.md` file, then leave `DBFLEET_REDIS_PASSWORD` (or what the var you set for the `default` Redis user) to blank. Otherwise fill it up.
4. For Postgres, set `DBFLEET_POSTGRES_PASSWORD` to any value. We recommend strong password for this one,and if you're in the terminal, jsut use the output from `openssl rand -hex 32`.
4. Hit Deploy and cross your fingers.
5. For continuous deplyments of changes, run `./scripts/prepare-autodeploys.sh` and follow prompts.

## Why Compose file? You should use f**king Kubernetes instead.

Yeah, we know that, but Okteto supports Docker Compose files, so we can free up our
headaches on managing Kubernetes resource files on our own and instead do Docker
image builds instead.
