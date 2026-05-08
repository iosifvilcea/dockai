### Building and running your application

#### Build the image
/build.bash

#### First run — will prompt for login
docker run -it --rm \
  -v claude_config:/home/aiuser/.claude \
  dockai

#### Subsequent runs — already authenticated
/run.bash .

