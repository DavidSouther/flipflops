angular.module('flipflops.site.mock', [])
.value 'SiteMock', '/site.json': JSON.stringify "site":
    "title": "FlipFlops",
    "subtitle": "Quit blogging. Go to the beach.",
    "author": "David Souther (DEVELOPMENT)"
