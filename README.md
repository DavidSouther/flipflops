# Flip Flops

## Quit Blogging. Go to the beach.

Take a little syntax out of your life. It's just a file system and your words.

## Running a static blog

1. Create a folder for your project. Put it in source control, if you want.
1. Copy `[config.js][config.js]` to your project.
1. Change the few settings to your name, blog title, etc.
1. Create a folder, `posts`. This folder has all your blog posts, distinct from
    pages in the site.
1. Inside posts, create folders for YYYY/MM/DD/ for each blog post. Every post
    must be in a folder meeting that structure.
1. To create a post, create a folder and `index.md` as
    `YYY/MM/DD/post-slug/index.md`
1. To configure the post, create a YAML header. Current frontmatter supported is
```
---
title: Post Title
date: 2014-06-25T15:31:00.000-0500
author: Post Author (default's to author in config::site.author)
categories:
  - Category
  - Other
---
```

Once that's in place, you're ready to start flipflops. From the flipflops folder
run `CONFIG_FILE=/Users/username/full/path/to/project/config.js node app.js`

Visit [http://localhost:1024/](http://localhost:1024/)

[config.js]: ./src/site/config.js

## Hacking

If you do happen to like hacking on the beach, check out our
[design docs](./src/design/README.md)!

### Getting Started

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
