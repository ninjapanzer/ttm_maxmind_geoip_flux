# ttm_maxmind_geoip_flux

### Expectations
This expects that the following jquery libraries are present and on the page before this script is being loaded
- `jQuery`
- `jQuery.cookie`
- `jQuery.chosen`

Additionally the **MaxMind** `Geoip2` library is expected to be loaded previously
- `geoip2` http://dev.maxmind.com/geoip/

This repo keeps a version of those in the build directory for convienance but its recomended that you resolve these dependencies yourself at script inclusion time.

### Setup
- `npm install`
- `bower install`
- `npm run build`
- `npm run dev`
- view site on `localhost:8080`
