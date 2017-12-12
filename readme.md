# Brain  

Package **BRAIN** - lisp ([JSCL][jscl]) wrap for [brain.js][brainjs] library.

It is intended for use in the [Moren][moren] environment.

## Status

`Development`

## Compilation

```lisp
   (lores:qload :brain :storejs t)
   (lores:modlink :brain "brain.js")
```

## Use

```lisp

  (setq *nn (brain:make-neural-net
              (brain:nno :hiddensizes #(6 3)
                         :callback (lambda (stats) (print (klib:jso-to-list stats)))
                         :callbackperiod 100)))
   (brain:train *nn
       (brain:train-data
                (brain:tp (mkjso "r" 0.3 "g" 0.7) (mkjso "black" 1))
                (brain:tp (mkjso "r" 0.16 "b" 0.2) (mkjso "white" 1))
                (brain:tp (mkjso "r" 0.5 "g" 0.5 "b" 1.0) (mkjso "white" 1)))
       (brain:nno :iterations 100000 :errorthres 0.005))

 (print (klib:jso-to-list (brain:run *nn (mkjso "r" 0 "g" 0.00 "b" 0.0))))
 =>
   ((black 0.1877265584251551) (white 0.8651886428321726))
```

## Copyright
Copyright © 2017 Vladimir Mezentsev

## License
GNU General Public License v3.0


[jscl]: <https://github.com/jscl-project/jscl>
[moren]: <https://github.com/vlad-km/moren-electron>
[brainjs]: <https://github.com/BrainJS/brain.js>

