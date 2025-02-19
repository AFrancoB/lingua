// Generated by purs version 0.15.15
import * as Control_Bind from "../Control.Bind/index.js";
import * as Data_Either from "../Data.Either/index.js";
import * as Data_Foldable from "../Data.Foldable/index.js";
import * as Data_List from "../Data.List/index.js";
import * as Data_Maybe from "../Data.Maybe/index.js";
import * as Effect from "../Effect/index.js";
import * as Effect_Console from "../Effect.Console/index.js";
import * as Effect_Now from "../Effect.Now/index.js";
import * as Effect_Ref from "../Effect.Ref/index.js";
import * as Parser from "../Parser/index.js";
var bind = /* #__PURE__ */ Control_Bind.bind(Effect.bindEffect);
var fromFoldable = /* #__PURE__ */ Data_List.fromFoldable(Data_Foldable.foldableArray);
var main = /* #__PURE__ */ Effect_Console.log("\ud83c\udf5d");
var launch = function __do() {
    Effect_Console.log("lingua: launch")();
    var ast = Effect_Ref["new"](fromFoldable([  ]))();
    var $$eval = bind(Effect_Now.nowDateTime)(Effect_Ref["new"])();
    return {
        ast: ast,
        "eval": $$eval
    };
};
var define$prime = function (li) {
    return function (z) {
        return function (evalFromEstuary) {
            return function (x) {
                return function __do() {
                    var $$eval = Effect_Now.nowDateTime();
                    var x$prime = Parser.parseProgram($$eval)(x);
                    if (x$prime instanceof Data_Either.Left) {
                        return new Data_Maybe.Just(x$prime.value0);
                    };
                    if (x$prime instanceof Data_Either.Right) {
                        Effect_Ref.write($$eval)(li["eval"])();
                        Effect_Ref.write(x$prime.value0)(li.ast)();
                        return Data_Maybe.Nothing.value;
                    };
                    throw new Error("Failed pattern match at Main (line 48, column 3 - line 53, column 19): " + [ x$prime.constructor.name ]);
                };
            };
        };
    };
};
var define = function (li) {
    return function (zone) {
        return function ($$eval) {
            return function (x) {
                return function __do() {
                    var y = define$prime(li)(zone)($$eval)(x)();
                    if (y instanceof Data_Maybe.Just) {
                        return {
                            success: false,
                            error: y.value0
                        };
                    };
                    if (y instanceof Data_Maybe.Nothing) {
                        return {
                            success: true,
                            error: ""
                        };
                    };
                    throw new Error("Failed pattern match at Main (line 40, column 3 - line 42, column 51): " + [ y.constructor.name ]);
                };
            };
        };
    };
};
export {
    main,
    launch,
    define,
    define$prime
};
