#!/usr/bin/env sh

for name in eeny meeny miny moe marjorie
do
  http POST 127.0.0.1:8080 --raw=$name
done
wait
