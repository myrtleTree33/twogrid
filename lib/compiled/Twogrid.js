(function() {
  'use strict';
  var Twogrid;

  module.exports = Twogrid = (function() {
    function Twogrid(width, height, params) {
      var initVal, max, rawData, _i;
      this.width = width != null ? width : 10;
      this.height = height != null ? height : 10;
      this.params = params != null ? params : {};
      rawData = this.params.rawData;
      initVal = this.params.initVal || 0;
      max = this.width * this.height;
      if (this.params.rawData === void 0) {
        this.grid = [];
        for (_i = 0; 0 <= max ? _i <= max : _i >= max; 0 <= max ? _i++ : _i--) {
          this.grid.push(initVal);
        }
      }
      if (this.params.rawData instanceof Array) {
        this.grid = rawData;
      }
      if (this.grid === void 0) {
        this.grid = rawData.replace(/\s/g, '').split(',');
      }
      return this;
    }

    Twogrid.prototype.copy = function(gridToCopy) {
      if (gridToCopy instanceof Twogrid !== true) {
        return this;
      }
      this.grid = gridToCopy.grid.slice();
      this.width = gridToCopy.width;
      this.height = gridToCopy.height;
      return this;
    };

    Twogrid.prototype.get = function(x, y) {
      if (x == null) {
        x = 0;
      }
      if (y == null) {
        y = 0;
      }
      if ((y + 1 > this.height) || (x + 1 > this.width)) {
        return void 0;
      }
      return this.grid[x + y * this.width];
    };

    Twogrid.prototype.set = function(x, y, value) {
      if (x == null) {
        x = 0;
      }
      if (y == null) {
        y = 0;
      }
      if ((y + 1 > this.height) || (x + 1 > this.width)) {
        return this;
      }
      this.grid[x + y * this.width] = value;
      return this;
    };

    Twogrid.prototype.display = function() {
      var outputStr, x, y, _i, _j, _ref, _ref1;
      outputStr = '\n';
      for (y = _i = 0, _ref = this.height; 0 <= _ref ? _i < _ref : _i > _ref; y = 0 <= _ref ? ++_i : --_i) {
        for (x = _j = 0, _ref1 = this.width; 0 <= _ref1 ? _j < _ref1 : _j > _ref1; x = 0 <= _ref1 ? ++_j : --_j) {
          outputStr += this.get(x, y);
        }
        outputStr += '\n';
      }
      console.log(outputStr);
      return this;
    };

    return Twogrid;

  })();

}).call(this);
