(()=>{"use strict";var e={398:e=>{e.exports=require("vscode")},317:e=>{e.exports=require("child_process")},896:e=>{e.exports=require("fs")},928:e=>{e.exports=require("path")}},t={};function s(r){var o=t[r];if(void 0!==o)return o.exports;var i=t[r]={exports:{}};return e[r](i,i.exports,s),i.exports}var r={};(()=>{var e=r;Object.defineProperty(e,"__esModule",{value:!0}),e.activate=function(e){h=new m,h.start()},e.deactivate=function(){h.dispose()};const t=s(928),o=s(896),i=s(317),n=s(398);async function a(e){try{if((await o.promises.stat(e)).isFile())return!0}catch(e){return!1}return!1}const c=["build","compile","watch"];function d(e){for(const t of c)if(-1!==e.indexOf(t))return!0;return!1}const u=["test"];function p(e){for(const t of u)if(-1!==e.indexOf(t))return!0;return!1}let l,h;function f(){return l||(l=n.window.createOutputChannel("Gulp Auto Detection")),l}function k(){n.window.showWarningMessage(n.l10n.t("Problem finding gulp tasks. See the output for more information."),n.l10n.t("Go to output")).then((e=>{void 0!==e&&l.show(!0)}))}async function g(e){const s=process.platform;if("win32"===s&&await a(t.join(e,"node_modules",".bin","gulp.cmd"))){const e=t.join(process.env.APPDATA?process.env.APPDATA:"","npm","gulp.cmd");return await a(e)?`"${e}"`:t.join(".","node_modules",".bin","gulp.cmd")}return"linux"!==s&&"darwin"!==s||!await a(t.join(e,"node_modules",".bin","gulp"))?"gulp":t.join(".","node_modules",".bin","gulp")}class w{constructor(e,t){this._workspaceFolder=e,this._gulpCommand=t}get workspaceFolder(){return this._workspaceFolder}isEnabled(){return"on"===n.workspace.getConfiguration("gulp",this._workspaceFolder.uri).get("autoDetect")}start(){const e=t.join(this._workspaceFolder.uri.fsPath,"{node_modules,gulpfile{.babel.js,.esm.js,.js,.mjs,.cjs,.ts}}");this.fileWatcher=n.workspace.createFileSystemWatcher(e),this.fileWatcher.onDidChange((()=>this.promise=void 0)),this.fileWatcher.onDidCreate((()=>this.promise=void 0)),this.fileWatcher.onDidDelete((()=>this.promise=void 0))}async getTasks(){return this.isEnabled()?(this.promise||(this.promise=this.computeTasks()),this.promise):[]}async getTask(e){const t=e.definition.task;if(t){const s=e.definition,r={cwd:this.workspaceFolder.uri.fsPath};return new n.Task(s,this.workspaceFolder,t,"gulp",new n.ShellExecution(await this._gulpCommand,[t],r))}}async hasGulpfile(e){for(const s of await o.promises.readdir(e)){const e=t.extname(s);if(".js"!==e&&".mjs"!==e&&".cjs"!==e&&".ts"!==e)continue;if(!a(s))continue;const r=t.basename(s,e).toLowerCase();if("gulpfile"===r)return!0;if("gulpfile.esm"===r)return!0;if("gulpfile.babel"===r)return!0}return!1}async computeTasks(){const e="file"===this._workspaceFolder.uri.scheme?this._workspaceFolder.uri.fsPath:void 0,t=[];if(!e)return t;if(!await this.hasGulpfile(e))return t;const s=`${await this._gulpCommand} --tasks-simple --no-color`;try{const{stdout:t,stderr:a}=await(r=s,o={cwd:e},new Promise(((e,t)=>{i.exec(r,o,((s,r,o)=>{s&&t({error:s,stdout:r,stderr:o}),e({stdout:r,stderr:o})}))})));if(a&&a.length>0){const e=a.split("\n");e.pop(),e.every((e=>e.indexOf("No license field")>=0))||(f().appendLine(a),k())}const c=[];if(t){const e=t.split(/\r{0,1}\n/);for(const t of e){if(0===t.length)continue;const e={type:"gulp",task:t},s={cwd:this.workspaceFolder.uri.fsPath},r=new n.Task(e,this.workspaceFolder,t,"gulp",new n.ShellExecution(await this._gulpCommand,[t],s));c.push(r);const o=t.toLowerCase();d(o)?r.group=n.TaskGroup.Build:p(o)&&(r.group=n.TaskGroup.Test)}}return c}catch(e){const s=f();return e.stderr&&s.appendLine(e.stderr),e.stdout&&s.appendLine(e.stdout),s.appendLine(n.l10n.t("Auto detecting gulp for folder {0} failed with error: {1}', this.workspaceFolder.name, err.error ? err.error.toString() : 'unknown")),k(),t}var r,o}dispose(){this.promise=void 0,this.fileWatcher&&this.fileWatcher.dispose()}}class m{constructor(){this.detectors=new Map}start(){const e=n.workspace.workspaceFolders;e&&this.updateWorkspaceFolders(e,[]),n.workspace.onDidChangeWorkspaceFolders((e=>this.updateWorkspaceFolders(e.added,e.removed))),n.workspace.onDidChangeConfiguration(this.updateConfiguration,this)}dispose(){this.taskProvider&&(this.taskProvider.dispose(),this.taskProvider=void 0),this.detectors.clear()}updateWorkspaceFolders(e,t){for(const e of t){const t=this.detectors.get(e.uri.toString());t&&(t.dispose(),this.detectors.delete(e.uri.toString()))}for(const t of e){const e=new w(t,g(t.uri.fsPath));this.detectors.set(t.uri.toString(),e),e.isEnabled()&&e.start()}this.updateProvider()}updateConfiguration(){for(const e of this.detectors.values())e.dispose(),this.detectors.delete(e.workspaceFolder.uri.toString());const e=n.workspace.workspaceFolders;if(e)for(const t of e)if(!this.detectors.has(t.uri.toString())){const e=new w(t,g(t.uri.fsPath));this.detectors.set(t.uri.toString(),e),e.isEnabled()&&e.start()}this.updateProvider()}updateProvider(){if(!this.taskProvider&&this.detectors.size>0){const e=this;this.taskProvider=n.tasks.registerTaskProvider("gulp",{provideTasks:()=>e.getTasks(),resolveTask:t=>e.getTask(t)})}else this.taskProvider&&0===this.detectors.size&&(this.taskProvider.dispose(),this.taskProvider=void 0)}getTasks(){return this.computeTasks()}computeTasks(){if(0===this.detectors.size)return Promise.resolve([]);if(1===this.detectors.size)return this.detectors.values().next().value.getTasks();{const e=[];for(const t of this.detectors.values())e.push(t.getTasks().then((e=>e),(()=>[])));return Promise.all(e).then((e=>{const t=[];for(const s of e)s&&s.length>0&&t.push(...s);return t}))}}async getTask(e){if(0!==this.detectors.size){if(1===this.detectors.size)return this.detectors.values().next().value.getTask(e);if(e.scope!==n.TaskScope.Workspace&&e.scope!==n.TaskScope.Global&&e.scope){const t=this.detectors.get(e.scope.uri.toString());if(t)return t.getTask(e)}}}}})();var o=exports;for(var i in r)o[i]=r[i];r.__esModule&&Object.defineProperty(o,"__esModule",{value:!0})})();
//# sourceMappingURL=https://ticino.blob.core.windows.net/sourcemaps/5437499feb04f7a586f677b155b039bc2b3669eb/extensions/gulp/dist/main.js.map