# Hyde

Hyde is a Crystal's answer to gems like Jekyll and Middleman; a static site generator built around pluggability, ease of use, and speed. WIth Hyde everything is based around plugins including the HTML generation, allowing you to pick and choose what pieces you want for *your* site. What a concept, right? Hyde comes in two parts; the core and the CLI.

### Hyde Core

The core does all the behind the scenes work. It is the unsung hero of your Hyde install. You are only really going to worry about the Hyde Core if you're building a Hyde extension. Extension developers will hook into the `Hyde::Extensions` module to register their extension and then extend the `Hyde::Extension` class in order to hook into the build pipeline.

### Hyde CLI

The Hyde CLI is what most people will be interacting with, as it provides an easy way to generate and interact with your site. The CLI comes with these commands, but others may be added by extensions:

- `hyde new` - generates a new Hyde static site using the defaut template located [here](#)
- `hyde build` - build your static site
- `hyde deploy` - use your [deployment config](#) to deploy your Hyde site
- `hyde serve` - use the built in development server to run your Hyde site locally

## Installation

**Note:** To install Hyde you will need to have Crystal installed. See the install instructions [here](https://crystal-lang.org/reference/installation/) for information on how to do that.

To install just clone this repo and run the install script inside.

```
git clone https://github.com/watzon/hyde.git
cd hyde
./install
```

or if you just want to build the project

```
crystal build
```

to run the hyde cli just use the newly available `hyde` command

```
hyde --help
```

## Roadmap

TODO: Put a roadmap here

## Contributing

1. Fork it (<https://github.com/watzon/hyde/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Chris Watson](https://github.com/watzon) - creator and maintainer
