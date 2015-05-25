#!/bin/bash

# Start varnish and log
varnishd -P /var/run/varnishd.pid -a :80 -T localhost:6082 -f /etc/varnish/default.vcl -S /etc/varnish/secret -s malloc,256m
varnishlog
