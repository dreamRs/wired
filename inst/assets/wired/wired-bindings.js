/* Shiny bindings for Wired composants */
/* by vic */

if (typeof window.Shiny !== "undefined") {
  // Wired Single Checkbox
  var wiredCheckboxBinding = new Shiny.InputBinding();
  $.extend(wiredCheckboxBinding, {
    find: function find(scope) {
      return $(scope).find("wired-checkbox");
    },
    getValue: function getValue(el) {
      return el.checked > 0;
    },
    setValue: function setValue(el, value) {
      el.checked = value;
    },
    subscribe: function subscribe(el, callback) {
      $(el).on("change", function(event) {
        callback(true);
      });
    },
    unsubscribe: function unsubscribe(el) {
      $(el).off(".wiredCheckboxBinding");
    },
    receiveMessage: function receiveMessage(el, data) {
      // TODO

      //if (data.hasOwnProperty('value')) el.checked = data.value;

      //if (data.hasOwnProperty('label')) $(el).parent().find('span').text(data.label);

      $(el).trigger("change");
    }
  });
  Shiny.inputBindings.register(wiredCheckboxBinding, "shiny.wired_checkbox");

  // Wired Select

  var wiredSelectBinding = new Shiny.InputBinding();
  $.extend(wiredSelectBinding, {
    find: function find(scope) {
      return $(scope).find("wired-combo");
    },
    getValue: function getValue(el) {
      return $(el).val()["value"];
    },
    setValue: function setValue(el, value) {
      $(el).val(value);
    },
    subscribe: function subscribe(el, callback) {
      $(el).on("selected", function(event) {
        callback(true);
      });
    },
    unsubscribe: function unsubscribe(el) {
      $(el).off(".wiredSelectBinding");
    },
    receiveMessage: function receiveMessage(el, data) {
      // TODO

      this.setValue(el, data.value);

      $(el).trigger("change");
    }
  });
  Shiny.inputBindings.register(wiredSelectBinding, "shiny.wired_select");

  // Wired Slider

  var wiredSliderBinding = new Shiny.InputBinding();
  $.extend(wiredSliderBinding, {
    find: function find(scope) {
      return $(scope).find("wired-slider");
    },
    getValue: function getValue(el) {
      return $(el).val();
    },
    setValue: function setValue(el, value) {
      $(el).val(value);
    },
    subscribe: function subscribe(el, callback) {
      $(el).on("change", function(event) {
        callback(true);
      });
    },
    unsubscribe: function unsubscribe(el) {
      $(el).off(".wiredSliderBinding");
    },
    receiveMessage: function receiveMessage(el, data) {
      // TODO

      this.setValue(el, data.value);

      $(el).trigger("change");
    }
  });
  Shiny.inputBindings.register(wiredSliderBinding, "shiny.wired_slider");

  // Wired Select

  var wiredRadioBinding = new Shiny.InputBinding();
  $.extend(wiredRadioBinding, {
    find: function find(scope) {
      return $(scope).find("wired-radio-group");
    },
    getValue: function getValue(el) {
      return document.getElementById(el.id).selected;
    },
    setValue: function setValue(el, value) {
      $(el).val(value);
    },
    subscribe: function subscribe(el, callback) {
      $(el).on("selected", function(event) {
        callback(true);
      });
    },
    unsubscribe: function unsubscribe(el) {
      $(el).off(".wiredRadioBinding");
    },
    receiveMessage: function receiveMessage(el, data) {
      // TODO

      this.setValue(el, data.value);

      $(el).trigger("change");
    }
  });
  Shiny.inputBindings.register(wiredRadioBinding, "shiny.wired_radio");

  // Wired Single Checkbox

  var wiredToggleBinding = new Shiny.InputBinding();
  $.extend(wiredToggleBinding, {
    find: function find(scope) {
      return $(scope).find("wired-toggle");
    },
    getValue: function getValue(el) {
      return el.checked > 0;
    },
    setValue: function setValue(el, value) {
      el.checked = value;
    },
    subscribe: function subscribe(el, callback) {
      $(el).on("change", function(event) {
        callback(true);
      });
    },
    unsubscribe: function unsubscribe(el) {
      $(el).off(".wiredToggleBinding");
    },
    receiveMessage: function receiveMessage(el, data) {
      // TODO

      //if (data.hasOwnProperty('value')) el.checked = data.value;

      //if (data.hasOwnProperty('label')) $(el).parent().find('span').text(data.label);

      $(el).trigger("change");
    }
  });
  Shiny.inputBindings.register(wiredToggleBinding, "shiny.wired_toggle");

  // Wired Text Input

  var wiredTextBinding = new Shiny.InputBinding();
  $.extend(wiredTextBinding, {
    find: function find(scope) {
      return $(scope).find("wired-input");
    },
    getValue: function getValue(el) {
      return el.value;
    },
    setValue: function setValue(el, value) {
      el.value = value;
    },
    subscribe: function subscribe(el, callback) {
      $(el).on("keyup input", function(event) {
        callback(true);
      });
      $(el).on("change", function(event) {
        callback(true);
      });
    },
    unsubscribe: function unsubscribe(el) {
      $(el).off(".wiredTextBinding");
    },
    receiveMessage: function receiveMessage(el, data) {
      if (data.hasOwnProperty("value")) this.setValue(el, data.value);

      if (data.hasOwnProperty("label"))
        $(el)
          .parent()
          .find('label[for="' + $escape(el.id) + '"]')
          .text(data.label);

      if (data.hasOwnProperty("placeholder")) el.placeholder = data.placeholder;

      $(el).trigger("change");
    },
    getState: function getState(el) {
      return {
        label: $(el)
          .parent()
          .find('label[for="' + $escape(el.id) + '"]')
          .text(),
        value: el.value,
        placeholder: el.placeholder
      };
    },
    getRatePolicy: function getRatePolicy() {
      return {
        policy: "debounce",
        delay: 250
      };
    }
  });
  Shiny.inputBindings.register(wiredTextBinding, "shiny.wired_text");

  // Wired Text Input

  var wiredSearchBinding = new Shiny.InputBinding();
  $.extend(wiredSearchBinding, {
    find: function find(scope) {
      return $(scope).find("wired-search-input");
    },
    getValue: function getValue(el) {
      return el.value;
    },
    setValue: function setValue(el, value) {
      el.value = value;
    },
    subscribe: function subscribe(el, callback) {
      $(el).on("keyup input", function(event) {
        if (event.keyCode == 13) {
          //if enter
          callback();
        }
      });
      $(el)
        .find("button")
        .on("click", function(event) {
          callback();
        });
      $(el).on("change", function(event) {
        //callback(true);
      });
    },
    unsubscribe: function unsubscribe(el) {
      $(el).off(".wiredTextBinding");
    },
    receiveMessage: function receiveMessage(el, data) {
      if (data.hasOwnProperty("value")) this.setValue(el, data.value);

      if (data.hasOwnProperty("label"))
        $(el)
          .parent()
          .find('label[for="' + $escape(el.id) + '"]')
          .text(data.label);

      if (data.hasOwnProperty("placeholder")) el.placeholder = data.placeholder;

      $(el).trigger("change");
    },
    getState: function getState(el) {
      return {
        label: $(el)
          .parent()
          .find('label[for="' + $escape(el.id) + '"]')
          .text(),
        value: el.value,
        placeholder: el.placeholder
      };
    },
    getRatePolicy: function getRatePolicy() {
      return {
        policy: "debounce",
        delay: 250
      };
    }
  });
  Shiny.inputBindings.register(wiredSearchBinding, "shiny.wired_search");

  // Progress bar
  Shiny.addCustomMessageHandler("update-wired-progress", function(data) {
    var prog = document.getElementById(data.id);
    prog.value = data.value;
  });
}

