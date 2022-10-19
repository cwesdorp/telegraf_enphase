run:
	docker run --rm \
		-v $(CURDIR)/telegraf/:/etc/telegraf/:ro \
		-e ENVOY_PASSWD=${ENVOY_PASSWD} \
		-e ENVOY_IP=${ENVOY_IP} \
		telegraf:1.22.4 \
		telegraf --config /etc/telegraf/telegraf.conf --config-directory /etc/telegraf/telegraf.d 

