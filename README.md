# docker-dev-maker
These files along with my `.config_fish` aliases (found below as well) create the docker dev environment.

The idea is that you go into `$LANG/_DOCKER_/`and run `./setup.sh my_project_name`.
This will generate an environment for you to develop with. When you are ready to test your code, you run `$LANG-build` and the shell alias will kick off a Docker container from the `Dockerfile` in `$LANG/_DOCKER_/Dockerfile`, and run the `build.sh` script which is contained in `$LANG/_DOCKER_/setup.sh`.

The reason that I use a shell script rather than docker commands built into the container is that I want the flexability to change the build routine as needed, on a project by project basis.

Each docker image is either based off of alpine linux, or debian7.11-slim so it's small, while still giving you a full shell to test with.

## Shell Aliases
Just run the appropriate language alias. For instance if you're working on a c program, run `c-build`.
If you're using bash instead of `fish` for your shell, change `src=(pwd)` to something like `src=$(pwd)`

### C
```
function c-build
    docker run -i -t --mount src=(pwd),target=/code,type=bind --rm c-container ./build.sh
end
```

### Python
```
function python-build
    docker run -it --mount src=(pwd),target=/code,type=bind --rm python-container sh build.sh
end
```

### Golang
```
function golang-build
    docker run -it --mount src=(pwd),target=/code,type=bind --rm golang-container sh build.sh
end
```


*Also yes the golang Dockerfile is gross, sorrynotsorry*
