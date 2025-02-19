"use strict";

export const objectWithWhenSN = when => s => n => () => { return { whenPosix: when, s: s, n: n }; }
