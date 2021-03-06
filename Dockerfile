FROM google/dart:2.0.0 as build

# Build Environment Vars
ARG BUILD_ID
ARG BUILD_NUMBER
ARG BUILD_URL
ARG GIT_COMMIT
ARG GIT_BRANCH
ARG GIT_TAG
ARG GIT_COMMIT_RANGE
ARG GIT_HEAD_URL
ARG GIT_MERGE_HEAD
ARG GIT_MERGE_BRANCH
WORKDIR /build/
ADD . /build/
RUN pub get && pub run dependency_validator -i build_runner,build_test,build_web_compilers
ARG BUILD_ARTIFACTS_BUILD=/build/pubspec.lock
FROM scratch
