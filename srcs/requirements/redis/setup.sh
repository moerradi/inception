echo "requirepass " ${REDIS_PASSWORD} >> /etc/redis/custom.conf
echo "maxmemory " ${REDIS_MAXMEMORY} >> /etc/redis/custom.conf
echo "maxmemory-policy allkeys-lru" >> /etc/redis/custom.conf
echo "port" ${REDIS_PORT} >> /etc/redis/custom.conf
echo "bind" 0.0.0.0 >> /etc/redis/custom.conf
echo "daemonize no" >> /etc/redis/custom.conf
echo "protected-mode no" >> /etc/redis/custom.conf
echo "vm.overcommit_memory = 1" >> /etc/sysctl.conf
echo never > /sys/kernel/mm/transparent_hugepage/enabled
redis-server /etc/redis/custom.conf