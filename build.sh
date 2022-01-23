#!/usr/bin/env bash
haxe compile.hxml
cp index.html /var/www/vhosts/rahilpatel.com/httpdocs/test.html
cp app.js.map /var/www/vhosts/rahilpatel.com/httpdocs/
cp app.js /var/www/vhosts/rahilpatel.com/httpdocs/


