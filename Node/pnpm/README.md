```pnpm config set store-dir ~/.pnpm-store

mkdir -p ~/.pnpm-glob

mkdir -p ~/.pnpm-bin

pnpm config set global-dir ~/.pnpm-glob

pnpm config set global-bin-dir ~/.pnpm-bin

export PATH="~/.pnpm-bin:$PATH"```