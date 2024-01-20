# merjar

Merge JAR files safely

```
usage: merjar [-h] [--log <level>] [-i <jarfile-list>] [-o <jarfile>] [<jarfile> ...]

Merge JAR files safely. Merges all jars given on the command line and in files into one jar. This is done in memory rather than by extracting into
files. This avoids an issue where filenames like 'com.tony.stark' and 'com.Tony.Stark' collide on case-insensitive filesystems.

positional arguments:
  <jarfile>             Jar file to merge

options:
  -h, --help            show this help message and exit
  --log <level>         Logger level: DEBUG, INFO, WARNING, ERROR, CRITICAL (default: WARNING)
  -i <jarfile-list>, --input <jarfile-list>
                        File that contains a list of jar files, one per line
  -o <jarfile>, --output <jarfile>
                        Merged jar file
```

# Limitations

Does not do any special manifest handling.
