# esri-loader-rescript
Library for using esri loader in rescript.


# Usage example
```
open EsriLoader;

loadModules(["esri/config"])->Js.Promise.then_((deps) => {
    switch deps {
        | [esriConfig] => 
            Js.log("Module successfully loaded")
            Js.log(esriConfig)
        | _=> Js.log("There was an error, make sure you are importing a real package from esri.")
        
    }
    Js.Promise.resolve()
},_)->ignore

loadCss("3.35") //also can directly target a server url or locally
               //hosted version
setDefaultOptions({
    version: "",
    url:"http://server/path/to/esri",
    css: true,
    insertCssBefore: ""
})

```