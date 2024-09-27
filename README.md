# merjar

Merge JAR files safely

```
usage: merjar [-h] [--log <level>] [-i <jarfile-list>] [-o <jarfile>] [--merge <path-in-jar>] [<jarfile> ...]

Merge JAR files safely. Merges all jars given on the command line and in files into one jar. This is done in memory rather than by extracting into files. This avoids an issue where filenames like 'com.tony.stark' and 'com.Tony.Stark' collide on case-insensitive filesystems. Duplicate entries are ignored, except where --merge is specified. Example: # Merge a.jar and b.jar
into combined.jar merjar -o combined.jar a.jar b.jar echo a.jar >> jarlist.txt echo b.jar >> jarlist.txt # Merge a.jar and b.jar into combined.jar merjar -o combined.jar -i jarlist.txt

positional arguments:
  <jarfile>             Jar file to merge

options:
  -h, --help            show this help message and exit
  --log <level>         Logger level: DEBUG, INFO, WARNING, ERROR, CRITICAL (default: WARNING)
  -i <jarfile-list>, --input <jarfile-list>
                        File that contains a list of jar files, one per line
  -o <jarfile>, --output <jarfile>
                        Merged jar file
  --merge <path-in-jar>
                        Path in output jar to merge from multiple jars
```

# Limitations

Does not do any special manifest handling.
