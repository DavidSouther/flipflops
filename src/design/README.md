# FlipFlops Design

FlipFlops is a static, single-page content server. All content is written as
static files and assets on the file system, revisioned using source control,
and served to a single page web application (SPA). Writing a publishing
platform as a SPA allows for many interactions not commonly seen in today's
blogging platforms. Transitions between pages requiring data and content
preloading become the norm. Offline access is as easy as downloading the content
bundle and media data (or can be progressively enhanced as internet access
is available).

## Philosophy

FlipFlops is a plugin system. It exposes a narrow core of CMS functionality,
ships a suite of plugins for the common content scenarios (Blogs & Books), and
allows downstream developers great flexibility in augmenting the core blocks.

### Others

* **Wordpress** is a massive monolithic thing, requiring a massive LAMP stack to
provide even the most basic functionality. SPA wordpress plugins basically
rewrite the entire rendering engine. To build and style even modestly sized
components requires an understanding of the entire system. I want something
smaller, and something that hits static content.

* **Octopress** builds static HTML pages for each possible page. This makes
serving easy, but advanced interactions and experiences much more difficult. The
layout engine is very similar to Wordpress, which breaks the fundamental rule
of HTML: Every Opened Tag Must Close (in the same file).

* **Ghost** requires a MySQL database and Ghost account to use. It can't be
deployed just anywhere. Multi-user is still on the horizon (in FlipFlops, as
easy as changing the Author metadata). Plugin support is on the horizon. Not a
SPA.

## Components

While designed as a modular, pluggable system, FlipFlops has two kernels for the
server API and the rendering engine.

### Mojito

Mojito is a RESTfull static CMS API server. Mojito starts from a core that
handles loading and analyzing content on a static file system. Plugins allow
continually enhancing this data, adding content editing and creation APIs,
paging content, and managing authors, tags, and categories.

### Daiquiri

Daiquiri is an AngularJS SPA publishing application. From a core module that
handles communication with mojito, various modules can add and override any
piece of the page and experience.
