# Local PowerShell module `My.PersonalModule`

## A Place to Put Your Own Functions

You may use the `My.PersonalModule` template module to save your own code snippets as functions.
Simply put one function per file into the `Functions` subfolder.

Please note that the file name **must** match the function name inside the file.
Also, function names **must** follow the naming pattern `Verb-My_Noun.ps1`, e.g. 'Get-My_User'.

The important part here is that we are using a `My_` prefix to clearly indicate that this is a personal function not belonging to any public PowerShell module.

## Using `My.PersonalModule`

When this Codespace is started, the `$env:PSModulePath` environment variable is automatically updated with the `My.PersonalModule` module path.
This will allow automatic import of the module and will make your personal functions available to your terminal sessions out of the box.

## Advanced structuring of your module

The `My.PersonalModule\My.PersonalModule.psm1` file is prepared to distinguish between public and private functions that are only available internally.
To start with this, you may rename the `Functions` folder to `Public` and create a new folder `Private` right next to it.
