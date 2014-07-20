set -x

if [ "${TRAVIS_OS_NAME}" = "osx" ] || [ "${PLATFORM}" = "mac" ]; then
    target=apple-darwin
elif [ "${TRAVIS_OS_NAME}" = "linux" ] || [ "${PLATFORM}" = "linux" ]; then
    target=unknown-linux-gnu
elif [ "${OS}" = "Windows_NT" ] || [ "${PLATFORM}" = "win" ]; then
    target=pc-mingw32
    windows=1
else
    # Not in the travis platform beta
    target=unknown-linux-gnu
fi

if [ "${TRAVIS}" = "true" ] && [ "${target}" = "unknown-linux-gnu" ]; then
    # Install a 32-bit compiler for linux
    sudo apt-get -qq update
    sudo apt-get -qq install -qq gcc-multilib lib32stdc++6
fi

# Install both 64 and 32 bit libraries. Apparently travis barfs if you try to
# just install the right ones? This should enable cross compilation in the
# future anyway.
if [ -z "${windows}" ]; then
    curl -s http://www.rust-lang.org/rustup.sh | sudo sh
else
    rm -rf *.exe rustc
    curl -O http://static.rust-lang.org/dist/rust-nightly-install.exe
    innounp -y -x rust-nightly-install.exe
    mv '{app}' rustc
fi

set +x
