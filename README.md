scaffold
========

A scaffold for Static and Wordpress web projects.

## Resources

* HTML 5
* Sass (CSS 3)
* CoffeeScript (JavaScript)
* Grunt tasks:
  * Compile CoffeeScript
  * Compile Sass
  * Coffelint
  * JShint
  * YUI Compressor: minify JavaScript and CSS
  * `grunt-shell` runs after everything to execute `rsync` to send files as specified in the `config`, with `deployit.sh` script
  * Docco for documentation of CoffeeScript

## Install

```
git clone https://github.com/marcker/scaffold
mv scaffold YourProjectName
cd YourProjectName

```

*Uncomment the extensions that you wish in the `.gitignore`*

### Static

```
cd static
npm install
grunt all

```

### Wordpress

* Coming soon
