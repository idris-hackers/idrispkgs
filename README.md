# idrispkgs

Nix expressions for building Idris projects, with dependencies.

## Examples

To build the example project:

```sh
$ nix-build example.nix
/nix/store/ijih1bxcaqzi8fi0kmj0rd1dk637aa6y-idris-nix-example
```

You can run the example with:

```sh
$ /nix/store/ijih1bxcaqzi8fi0kmj0rd1dk637aa6y-idris-nix-example/bin/idris-nix-example
[1, 2, 3, {}]
```

Or you can enter the example shell which will put libraries in the right place:

```sh
$ nix-shell example-shell.nix
$$ idris -p config example.idr 
     ____    __     _                                          
    /  _/___/ /____(_)____                                     
    / // __  / ___/ / ___/     Version 0.9.16-git:PRE
  _/ // /_/ / /  / (__  )      http://www.idris-lang.org/      
 /___/\__,_/_/  /_/____/       Type :? for help               

Idris is free software with ABSOLUTELY NO WARRANTY.            
For details type :warranty.
Type checking ./example.idr
*example> 
```
