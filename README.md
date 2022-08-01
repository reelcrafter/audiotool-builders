# About

These are Dockerfiles to conveniently build
[ffmpeg](https://github.com/FFmpeg/FFmpeg) and
[audiowaveform](https://github.com/bbc/audiowaveform) so they work in AWS Lambda
functions.

# Instructions

1. Clone this repo, and navigate into the folder for the tool you want to build.
1. The Dockerfiles default to pulling an x86_64 version of Amazon Linux. Feel free to edit the Dockerfile to pull arm64 instead.
1. Run `yarn build`, and go brew some coffee—this will take a while!
1. Run `yarn install`, which will copy the compiled binary into a `bin` folder
in the current directory.
1. Finally, run `yarn clean` to remove the Docker container (this won't remove
the binary file you just built).

# Using with Lambda

We recommend zipping up the binaries and creating a
[Lambda Layer](https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html)
so you can reduce the size of your Lambda code bundle, and update the binaries
independently of your Lambda function(s).
