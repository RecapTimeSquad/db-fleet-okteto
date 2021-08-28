FROM bitnami/redis:6.2-debian-10

# Copy our example config
COPY ./redis.conf /etc/redis.conf

# Uncomment this line to include your external ACL file. You may need to rename
# ./redis_users.example.acl to ./redis_users.acl before pushing into your private
# repository. Don't forget to uncomment line 890 in your Redis config file to
# use your external ACL file. See https://redis.io/topics/acl for learn more about
# everything ACL in Redis.
#COPY ./redis_users.acl /bitnami/redis/users.acl