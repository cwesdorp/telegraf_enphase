# Extract data from Enphase Envoy with Telegraf

## Introduction

This project contains the configuration to extract basic information from an Enphase Envoy Metered-S. I wanted a quick and simple solution without coding a custom solution. It extracts

* total PV generated kWh
* total PV current watts
* per panel current watts

Then use the Telegraf output plugin of your liking to store the data.

## Implementation 

The Telegraf configuration used the `exec` input plugin and the `json_v2` data format mapper to convert the Envoys JSON into metrics. 

Because one of the endpoints requires HTTP Digest authentication `curl` is used, that is included in the standard Telegraf docker image. For simplicity both queries use `exec`.

The interval is set to 60 seconds. This should be fine grained for most use cases. The panel/micro-inverter values are updated on 3-5 minutes intervals although sometimes it reports per minute. Sending a scan command may help, I'm looking into this.

## Output

The output is defined in the `/etc/telegraf/telegraf.d` folder so that can easily overwite it with your own storage. 

The default configuration writes to `stdout`.

## Running

To run Telegraf set these environment variables:

* `ENVOY_IP`: The IP of the Envoy system
* `ENVOY_PASSWD`: The last six digits of the Envoy serial number

Then execute

```
make run
```

