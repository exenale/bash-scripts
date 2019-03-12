#!/usr/bin/env bash

while true; do
curl https://link-here.com | grep -Po '"code":.*?[^\\]",' | tee -a save_to.csv
sleep 1
done