package caddyhttp

import (
	_ "github.com/captncraig/caddy-realip"                  // realip
	_ "github.com/captncraig/cors/caddy"                    // cors
	_ "github.com/epicagency/caddy-expires"                 // expires
	_ "github.com/lucaslorentz/caddy-supervisor/httpplugin" // supervisor
	_ "github.com/miekg/caddy-prometheus"                   // http.prometheus
	_ "github.com/nicolasazrak/caddy-cache"                 // cache
)
