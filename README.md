# ziptheseroms

A quick bash script to zip specified rom files in a folder individually and move source files to a .bak directory. Files in .bak can be safely deleted once you've confirmed things have gone as planned.

ie.

`ziptheseroms.sh adf`

Result should be:

```
Processing *.adf files...
Zipping: ./TurboRaketti (demo playable) (1992)(Kosola, Heikki)(fi)(SW).adf
Success: ./TurboRaketti (demo playable) (1992)(Kosola, Heikki)(fi)(SW).zip
./TurboRaketti (demo playable) (1992)(Kosola, Heikki)(fi)(SW).adf moved to .bak
```

Multiple extensions can be specified. Script should only process files that have not already been zipped.
