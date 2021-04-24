# Branching and merging

- `cat todo.txt`{{execute}}
- `pijul record -a -m "Main todo"`{{execute}}
- `pijul fork bob`{{execute}}
- `pijul channel`{{execute}}
- `pijul channel switch bob`{{execute}}
- `vim todo.txt`{{execute}}
- `pijul record -a -m "Bob todo"`{{execute}}
- `pijul fork alice --channel main`{{execute}}
- `pijul channel switch alice`{{execute}}
- `vim todo.txt`{{execute}}
- `pijul record -a -m "Alice todo"`{{execute}}
- `pijul pull . --from-channel bob`{{execute}}
- `cat todo.txt`{{execute}}
- `vim todo.txt`{{execute}}
- merge manualy
- `pijul record -a -m "Merge todo"`{{execute}}
- `pijul channel switch main`{{execute}}
- `pijul pull . --from-channel alice`{{execute}}
- `cat todo.txt`{{execute}}






