"use strict";const nodeRequire=require;if(globalThis._VSCODE_NODE_MODULES=new Proxy(Object.create(null),{get:(e,r)=>nodeRequire(String(r))}),globalThis._VSCODE_PRODUCT_JSON=require("../product.json"),process.env.VSCODE_DEV)try{const e=require("../product.overrides.json");globalThis._VSCODE_PRODUCT_JSON=Object.assign(globalThis._VSCODE_PRODUCT_JSON,e)}catch{}globalThis._VSCODE_PACKAGE_JSON=require("../package.json");const loader=require("./vs/loader"),bootstrap=require("./bootstrap"),performance=require("./vs/base/common/performance"),nlsConfig=bootstrap.setupNLS();loader.config({baseUrl:bootstrap.fileUriFromPath(__dirname,{isWindows:process.platform==="win32"}),catchError:!0,nodeRequire,"vs/nls":nlsConfig,amdModulesPattern:/^vs\//,recordStats:!0}),(process.env.ELECTRON_RUN_AS_NODE||process.versions.electron)&&loader.define("fs",["original-fs"],function(e){return e}),nlsConfig&&nlsConfig.pseudo&&loader(["vs/nls"],function(e){e.setPseudoTranslation(!!nlsConfig.pseudo)}),exports.load=function(e,r,s){e&&(process.env.VSCODE_CODE_CACHE_PATH&&loader.config({nodeCachedData:{path:process.env.VSCODE_CODE_CACHE_PATH,seed:e}}),r=r||function(){},s=s||function(o){console.error(o)},performance.mark("code/fork/willLoadCode"),loader([e],r,s))};

//# sourceMappingURL=https://ticino.blob.core.windows.net/sourcemaps/89de5a8d4d6205e5b11647eb6a74844ca23d2573/core/bootstrap-amd.js.map