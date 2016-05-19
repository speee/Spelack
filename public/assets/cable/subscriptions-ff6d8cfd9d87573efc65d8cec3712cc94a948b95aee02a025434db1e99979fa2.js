(function() {
  var slice = [].slice;

  Cable.Subscriptions = (function() {
    function Subscriptions(consumer) {
      this.consumer = consumer;
      this.subscriptions = [];
      this.history = [];
    }

    Subscriptions.prototype.create = function(channelName, mixin) {
      var channel, params;
      channel = channelName;
      params = typeof channel === "object" ? channel : {
        channel: channel
      };
      return new Cable.Subscription(this, params, mixin);
    };

    Subscriptions.prototype.add = function(subscription) {
      this.subscriptions.push(subscription);
      this.notify(subscription, "initialized");
      return this.sendCommand(subscription, "subscribe");
    };

    Subscriptions.prototype.remove = function(subscription) {
      this.forget(subscription);
      if (!this.findAll(subscription.identifier).length) {
        return this.sendCommand(subscription, "unsubscribe");
      }
    };

    Subscriptions.prototype.reject = function(identifier) {
      var i, len, ref, results, subscription;
      ref = this.findAll(identifier);
      results = [];
      for (i = 0, len = ref.length; i < len; i++) {
        subscription = ref[i];
        this.forget(subscription);
        results.push(this.notify(subscription, "rejected"));
      }
      return results;
    };

    Subscriptions.prototype.forget = function(subscription) {
      var s;
      return this.subscriptions = (function() {
        var i, len, ref, results;
        ref = this.subscriptions;
        results = [];
        for (i = 0, len = ref.length; i < len; i++) {
          s = ref[i];
          if (s !== subscription) {
            results.push(s);
          }
        }
        return results;
      }).call(this);
    };

    Subscriptions.prototype.findAll = function(identifier) {
      var i, len, ref, results, s;
      ref = this.subscriptions;
      results = [];
      for (i = 0, len = ref.length; i < len; i++) {
        s = ref[i];
        if (s.identifier === identifier) {
          results.push(s);
        }
      }
      return results;
    };

    Subscriptions.prototype.reload = function() {
      var i, len, ref, results, subscription;
      ref = this.subscriptions;
      results = [];
      for (i = 0, len = ref.length; i < len; i++) {
        subscription = ref[i];
        results.push(this.sendCommand(subscription, "subscribe"));
      }
      return results;
    };

    Subscriptions.prototype.notifyAll = function() {
      var args, callbackName, i, len, ref, results, subscription;
      callbackName = arguments[0], args = 2 <= arguments.length ? slice.call(arguments, 1) : [];
      ref = this.subscriptions;
      results = [];
      for (i = 0, len = ref.length; i < len; i++) {
        subscription = ref[i];
        results.push(this.notify.apply(this, [subscription, callbackName].concat(slice.call(args))));
      }
      return results;
    };

    Subscriptions.prototype.notify = function() {
      var args, callbackName, i, identifier, len, results, subscription, subscriptions;
      subscription = arguments[0], callbackName = arguments[1], args = 3 <= arguments.length ? slice.call(arguments, 2) : [];
      if (typeof subscription === "string") {
        subscriptions = this.findAll(subscription);
      } else {
        subscriptions = [subscription];
      }
      results = [];
      for (i = 0, len = subscriptions.length; i < len; i++) {
        subscription = subscriptions[i];
        if (typeof subscription[callbackName] === "function") {
          subscription[callbackName].apply(subscription, args);
        }
        if (callbackName === "initialized" || callbackName === "connected" || callbackName === "disconnected" || callbackName === "rejected") {
          identifier = subscription.identifier;
          results.push(this.record({
            notification: {
              identifier: identifier,
              callbackName: callbackName,
              args: args
            }
          }));
        } else {
          results.push(void 0);
        }
      }
      return results;
    };

    Subscriptions.prototype.sendCommand = function(subscription, command) {
      var identifier;
      identifier = subscription.identifier;
      if (identifier === Cable.INTERNAL.identifiers.ping) {
        return this.consumer.connection.isOpen();
      } else {
        return this.consumer.send({
          command: command,
          identifier: identifier
        });
      }
    };

    Subscriptions.prototype.record = function(data) {
      data.time = new Date();
      this.history = this.history.slice(-19);
      return this.history.push(data);
    };

    Subscriptions.prototype.toJSON = function() {
      var subscription;
      return {
        history: this.history,
        identifiers: (function() {
          var i, len, ref, results;
          ref = this.subscriptions;
          results = [];
          for (i = 0, len = ref.length; i < len; i++) {
            subscription = ref[i];
            results.push(subscription.identifier);
          }
          return results;
        }).call(this)
      };
    };

    return Subscriptions;

  })();

}).call(this);
