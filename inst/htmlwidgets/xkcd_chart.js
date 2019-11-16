HTMLWidgets.widget({
  name: "xkcd_chart",

  type: "output",

  factory: function(el, width, height) {

    var type, config;

    return {
      renderValue: function(x) {

        type = x.type;
        config = x.config;

        new chartXkcd[type](el, config);

      },

      resize: function(width, height) {
        new chartXkcd[type](el, config);
      }
    };
  }
});

