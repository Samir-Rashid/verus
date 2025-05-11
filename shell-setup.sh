# nix-shell -p rustup z3_4_12
# fish
cd source/
source ../tools/activate.fish
set VERUS_Z3_PATH $(which z3)
ln -sf $(which z3) ./z3

#### https://github.com/verus-lang/verus/blob/main/BUILD.md
# Build verus trunk from source
vargo build --release --no-solver-version-check

## Verus binary global path
# /home/mod/Documents/github/verus-tock/verus/source/target-verus/release/verus

set PATH "/home/mod/Documents/github/verus-tock/verus/source/target-verus/release/:$PATH"

cd ..

# open verus-tock
cd ..
code .

# also open 'cargo verus' folder
cd capsules/core
code .

