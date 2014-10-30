scaffold
========

A scaffold for websites -- static and PHP based (WordPress).

## Resources

- [x] HTML 5
- [x] Stylus (CSS 3)
- [x] CoffeeScript (JavaScript)
- [x] Gulp
- [x] Grid: [jeet](http://jeet.gs)
- [x] [Axis CSS](http://roots.cx/axis/)
- [x] Media queries: [rupture](http://jenius.github.io/rupture/)
- [x] Compile `.coffee`, `.styl`
- [x] Minify `.js`, `.css`, `.html` (html: `[pagename]-dev.html` to `[pagename].html`)
- [x] Live reload
- [x] Docco to document CoffeeScript
- [x] Lint `.coffee`
- [x] **Optional** deploy with ShellScript (you should to configure your `ssh` access to not having to enter the password every deploy -- *this does not provide here*)
- [ ] WordPress theme scaffold

## Install

```
git clone https://github.com/marcker/scaffold
mv scaffold YourProjectName
cd YourProjectName
rm -rfv .git
git init # optional
```

*You should to uncomment the extensions that you want in the `.gitignore`*

### Static

For static websites.

```
cd static
npm install && npm install jeet
gulp
```

#### Deploy

Add to file **config**: `../FOLDER_OR_FILE`, `USER@IP`, `DESTINATION` (whitespace and comma separated). After:

```
cd deploy
chmod +x deployit.sh
./deployit.sh
```

### Wordpress

* Coming soon
