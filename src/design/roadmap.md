# FlipFlops Roadmap

## MVP

### Mojito

* Loads markdown files from a file system into a tree structure.
* Serves content tree.
* Serves compiled static content.

### Daiquiri

* Loads content tree from Mojito.
* Renders article markdown.
* Renders article listings (eg blog home page).

## Plugin Basics

### Mojito

* Discovers and loads plugins.
* Allows plugins to hook to the app router.
* Allows plugins to apply passes to the content tree.

### Daiquiri

* Loads additional modules at run time.
* Additional modules override & wrap directives.

## Basic Plugins

### Mojito

* Indexing passes - Authors, Tags, Categories

### Daiquiri

* Analytics plugin - google analytics
* Navigation Plugin - highly configurable and extensible menu.
* Markdown plugin - pull article rendering to a plugin.
* Jade rendering - allow content to be rendered as jade.
* Code rendering - Render code blocks.

## Advanced Plugins

### Mojito

* SEO Plugin - render the page in PhantomJS.

### Daiquiri

* Sidebar Plugins - stack overflow? Github?
* Ads plugins - google adwords.
* Social plugins - twitter, facebook, g+
