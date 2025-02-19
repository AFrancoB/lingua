import * as Li from './output/Main/index.js';

export function exoLang(args) {
  return new Lingua(args);
}

export function Lingua(args) {
  if (args==null) args = {};
  this.lingua = Li.launch(args)();
}

Lingua.prototype.define = function(args) {
  return Li.define(this.lingua)(args)();
}

// Lingua.prototype.clear = function(args) {
//   return Li.clear(this.lingua)(args)();
// }

// Punctual.prototype.preRender = function(args) {
//   return Li.preRender(this.lingua)(args)();
// }

Lingua.prototype.render = function(args) {
  return Li.render(this.lingua)(args)();
}

// Lingua.prototype.postRender = function(args) {
//   return Li.postRender(this.lingua)(args)();
// }

// Lingua.prototype.setTempo = function(foreignTempo) {
//   return Li.setTempo(this.lingua)(foreignTempo)();
// }
