package main

import (
	"github.com/mholt/caddy/caddy/caddymain"

	_ "github.com/captncraig/caddy-realip"                  // realip
	_ "github.com/captncraig/cors/caddy"                    // cors
	_ "github.com/epicagency/caddy-expires"                 // expires
	_ "github.com/lucaslorentz/caddy-supervisor/httpplugin" // supervisor
	_ "github.com/lucaslorentz/caddy-supervisor/servertype" // supervisor server type
	_ "github.com/miekg/caddy-prometheus"                   // http.prometheus
	_ "github.com/nicolasazrak/caddy-cache"                 // cache
)

func main() {
	caddymain.EnableTelemetry = false

	caddymain.Run()
}
