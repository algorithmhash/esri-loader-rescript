# Current status
This is a WIP, contributions are welcome.

# Esri loader for rescript
Library for using esri loader in rescript. It targets the main methods used to create applications that utilize Esri data.

# To start with
Installing it is as easy as running this script:
```
npm i rescript-esriloader
```

or if npm is as buggy as it has been

```
yarn add rescript-esriloader
```
# Environment updates
You will also definitely need to update your ``bsconfig.json`` to target the package we just added
```
//the dots are omitted code for brevity 
...
"bs-dependencies": [
    ...
    "rescript-esriloader", //comma if you definitely have other dependencies after this one
    ...
  ]
...
```
Then rerunning your build script for your application, usually for me it's ``yarn start`` or ``npm run start`` and then include it within your codebase. There is a usage example for said example.
# Usage example
```
open EsriLoader;
    //This is pretty much a rescript looking implementation
    //that heavily resembles the javascript api one.

    //We include the array of modules we want to import
    //and return a resolved promise of imported modules.

loadModules(["esri/config"])->Js.Promise.then_((deps) => {
// We have a switch for matching the package and what it returns.
// This definitely works when we need to
// target indexes within an array effectively.

    switch deps {
    // in this case we are loading the esriConfig module
    // that then gives us the opportunity to
    // access data within esri through a given api key
        | [esriConfig] => 
            esriConfig["apiKey"] = "key_given"
            Js.log("Module successfully loaded")
            Js.log(esriConfig)
            //this is our bug catcher, even though it may resolve we could potentially run
            // into package errors, module bugs, and so on
        | _=> Js.log("There was an error, make sure you are importing a real package from esri.")
        
    }
    // Here is just a normal resolve. 
    // You can target specifics here but not neccessary as we want
    // to load multiple and it's ten times cleaner and more
    // understandable to just leave a promise resolve like so.

    Js.Promise.resolve()
},_)->ignore // <-- Ignores bugs that will be ironed out in future rescript releases.

loadCss("3.35") // <-- Also can directly target a server url or locally
               //hosted version

// This below targets default options which is pretty self explanatory.
setDefaultOptions({
    version: "",
    url:"http://server/path/to/esri",
    css: true,
    insertCssBefore: ""
})

```

# Rescript thoughts
I love rescript. So I might be a bit biased but it's for a good reason. Too much for me to tell you why so check it out here at their docs 
Rescript docs -> https://rescript-lang.org/docs/manual/latest/introduction

# AMD module import
So I mentioned AMD module import and the esri loader actually uses dojo I believe. The core library does not. Here is a bit more material on it from multiple sites:

AMD js git -> https://github.com/amdjs/amdjs-api/wiki/AMD
Requirejs -> https://requirejs.org/docs/whyamd.html

There is also dynamic importing if that is your thing

JS Info -> https://javascript.info/modules-dynamic-imports
