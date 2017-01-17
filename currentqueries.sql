SELECT procpid,client_addr, query_start, current_query FROM pg_stat_activity WHERE current_query != '<IDLE>'
