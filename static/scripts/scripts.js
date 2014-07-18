var Site;

Site = {};

Site.apps = {
  myFn: function() {
    return console.log('Running...');
  }
};

(function() {
  Site.apps.myFn();
})();
