type t;
// we target the actual package esri-loader and we establish it as 
// an importable method into other modules, react components etc
type defaultOptions = {
    version: string,
    url: string,
    css: bool,
    insertCssBefore: string
};
@bs.module("esri-loader")@bs.val
external loadModules: (array<string>) => Js.Promise.t<'a> = "loadModules";
@bs.module("esri-loader")@bs.val
external setDefaultOptions: (defaultOptions) => unit = "setDefaultOptions";
@bs.module("esri-loader")@bs.val
external loadCss: (string) => unit = "loadCss";