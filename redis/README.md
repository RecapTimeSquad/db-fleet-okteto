# Configuration files for Redis

## Usage

1. We recommend to customize the configuration file `redis.conf` depending on your use case. We configured some for you, including:
  * using both RDB and AOF to match with data integrity Postgres have
  * the maximum memory action is set to `volatile-ttl`, which Redis will remove the keys with the nearest expire time (minor TTL)
  * maximum clients is set to `10000`, among ther stuff
2. If you ever want to set `requirepass`, set it through the  `DBFLEET_REDIS_PASSWORD` (or what the var you set for the `default` Redis user) secret in Okteto.
3. Or, if you want ACL stuff at config file level, uncomment L890 in your config file and L11 in this directory's Dockerfile.
4. Push changes so it'll be applied for next deployment.

## Notes

* We use the example Redis config file based from Redis 6.2.5. Please send us MRs if any changes we should be merged here.
