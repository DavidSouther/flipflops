---
title: Getting Started
---

## Quickstart

```bash
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
structure mirroring the overridden parts of the default theme. See the github for
the current theme structure.

Let's build a new theme called `quickstart`.

```bash
mkdir -p 'themes/quickstart/page/sidebar'
touch 'themes/quickstart/page/sidebar/template.jade'
```

In `config.js`, add the `themes` key with `quickstart`.

```javascript
module.exports = {
    //...
    themes = [ 'quickstart' ]
};
```
The easiest theme to build is replacing a main piece of the page, say the
Sidebar. In fact, that's the best way to choose what sidebar components you want
for your site. Within your theme, create `page/sidebar/template.jade` and fill
it with

```
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


### Configuring the environment

Flipflops can be configured using a variety of environment variables, including
NODE_NEV, NEW_RELIC_LICENSE_KEY, and many others. It is your responsibility to
handle those safely for your environment. Flipflops has a deploy script that
helps out, if you have a private git repo.

Create a private repo, for all secure project settings (this works across all
projects). Create a branch for flipflops (`git branch --orphan flipflops ; git
checkout flipflops`). Create a `.sh` file for each environment you need; I
create `development.sh` and `production.sh` at a minimum. Put any environment
vars in those. Commit and push this branch.

In flipflops, create an environment variable `export DOTREPO=git://PATH_TO_REPO`
that you just created. Run `sh ./src/deploy/env/load.sh ENVIRONMENT`, where
`ENVIRONMENT` is the name of the .sh file (without the .sh) you just created.
Now, when you start flipflops with `npm start`, these settings will be loaded.

### Deploy

Flipflops runs a few different ways.

* **node** For standalone development work, simply running `node app.js` will
    have you up and running most quickly.
* **Docker** For production use, grab the docker container *(coming soon!)*.
* **Passenger** For some development workflows, [Phusion Passenger][passenger]
    is a great tool for managing the lifecycle of the app.
* **Supervisor** To minimize external dependencies, Flipflops is configured to
    use [node-supervisor][supervisor] for lifecycle management.

The `npm start` script will use passenger if it's in the path, or supervisor
otherwise. The docker container uses supervisor, but that's under the hood.

[passenger]:
[supervisor]:
