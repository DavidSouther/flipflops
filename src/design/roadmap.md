# FlipFlops Roadmap

## MVP

### Mojito

* [X] Loads markdown files from a file system into a tree structure.
* [X] Serves content tree.
* [X] Serves compiled static content.

### Daiquiri

* [X] Loads content tree from Mojito.
* [X] Renders nav and routes paths.
* [X] Renders article markdown.
* [X] Renders article listings (blog posts page).
* [X] Renders and navigates static pages.
* [X] Renders readme.md for a home page.

## Helpers

* [X] `flipflops serve [configpath]`
* [X] `flipflops render [configpath] <outdir>`
* [ ] `flipflops create post <title> [configpath]`
* [X] `flipflops init [configpath]`
* [X] `npm install --global flipflops`

## Plugin Basics

### Mojito

* [ ] Discovers and loads plugins.
* [ ] Allows plugins to hook to the app router.
* [ ] Allows plugins to apply passes to the content tree.

### Daiquiri

* [ ] Loads additional modules at run time.
* [ ] Modules wrap factories (`angular.decorator()`).
* [ ] Modules replace templates.
* [ ] Modules override CSS.

## Basic Plugins

### Mojito

* [ ] Indexing passes - Authors, Tags, Categories

### Daiquiri

* [ ] Analytics plugin - google analytics
* [ ] Navigation Plugin - highly configurable and extensible menu.
* [ ] Markdown plugin - pull article rendering to a plugin.
* [ ] Code rendering - Render code blocks.
* [ ] Jade rendering - allow content to be rendered as jade.
* [ ] Gist Embedding

## Advanced Plugins

### Mojito

* [ ] SEO Plugin - render the page in PhantomJS.

### Daiquiri

* [ ] Sidebar Plugins - stack overflow, Github
* [ ] Ads plugins - google adwords.
* [ ] Social plugins - twitter, facebook, g+

## Content Management

* [ ] Secure Login
* [ ] CRUD Pages
* [ ] CRUD Posts
* [ ] Manage Assets
* [ ] Wordpress Import

## Marketing

* [ ] Hackathon
* [ ] Site
* [ ] Documentation
* [ ] Success Stories
