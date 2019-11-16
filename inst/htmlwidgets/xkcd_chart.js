HTMLWidgets.widget({
  name: "xkcd_chart",

  type: "output",

  factory: function(el, width, height) {
    // TODO: define shared variables for this instance

    return {
      renderValue: function(x) {

        new chartXkcd[x.type](el, x.config);

      },

      resize: function(width, height) {
        // TODO: code to re-render the widget with a new size
      }
    };
  }
});

