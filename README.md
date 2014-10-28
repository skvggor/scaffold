scaffold
========

A scaffold for websites -- static and PHP based (WordPress).

## Resources

- [x] HTML 5
- [x] Stylus (CSS 3)
- [x] CoffeeScript (JavaScript)
- [x] Gulp
- [x] Grid system: [jeet.gs](http://jeet.gs)
- [x] Compile `.coffee`, `.styl`
- [x] Minify `.js`, `.css`
- [x] Live reload
- [x] Docco to document CoffeeScript
- [ ] Lint `.coffee`, `.styl`
- [ ] Easy deploy with ShellScript
- [ ] WordPress theme scaffold

## Install

```
git clone https://github.com/marcker/scaffold
mv scaffold YourProjectName
cd YourProjectName
rm -rfv .git
git init # optional
```

*You should uncomment the extensions that you want the `.gitignore`*

### Static

```
cd static
npm install && npm install jeet
gulp
```

### Wordpress

* Coming soon
