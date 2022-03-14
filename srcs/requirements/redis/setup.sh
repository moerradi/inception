# echo "requirepass " ${REDIS_PASSWORD} >> /etc/redis/redis.conf
# echo "maxmemory " ${REDIS_MAXMEMORY} >> /etc/redis/redis.conf
# echo "maxmemory-policy allkeys-lru" >> /etc/redis/redis.conf
# echo "port" ${REDIS_PORT} >> /etc/redis/redis.conf

redis-server