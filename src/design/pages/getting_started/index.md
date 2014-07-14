---
title: Getting Started
---

## Quickstart

```
npm install --global flipflops
mkdir myproject
cd myproject
flipflops init
flipflops serve
```

### Installing flipflops

The flipflops command line is the quickest way to get started with flipflops. To
install, use NPM's global options.

### Create a project folder

This is where your site will live; containing pages, posts, themes, assets,
config, etc. Feel free to commit it to source control!

### Create the config file

`flipflops init` will ask a few boilerplate questions, then generate a
`config.js` file that flipflops will use to manage your site.

### Start the Server

`flipflops serve` in the local directory will get you running. It should start
on `http://127.0.0.1:1024`, unless 1024 is unavailable. Wherever it starts, it
will print out the root URL.

## Creating Content

### Posts

Posts live in the `posts` folder, and should be arranged in a `YYYY/MM/DD/post`
folder structure, with the body and meta of a post in an `index.md` file; any
post assets can then live next to the post.

### Pages

Pages of a site, which appear in the navigation, live in the `pages` folder. Any
piece of content must be in its own folder, in a file called `index.md`. This
then allows the `index.md` content to reference assetsin the same folder.

### Themes

FlipFlops uses a Cascading File System to allow users to overwrite certain
portions of the FlipFlops system. To use themes, create a folder `themes` next
to the config file. Create a folder within `themes` with each theme name. Add
a configuration key named 'themes' to the config file; it's value is an array,
with themes listed in order of least priority. Within the theme, create a folder
structure mirroring the overriden parts of the default theme. See the github for
the current theme structure.

The easiest theme to build is replacing a main piece of the page, say the
Sidebar. In fact, that's the best way to choose what sidebar components you want
for your site. Within your theme, create `page/sidebar/template.jade' and fill
it with

```jade
.Sidebar
    section
        h3 Custom Sidebar
        | This sidebar has a header and some text.
    section
        h3 Raw More Aside
        | Another sidebar section, with different text!

```

Save this, and start the flipflops server. See the new sidebar content!

See the themes documentation for more on how each component is expected to work
together.
