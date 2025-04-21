# Use Node.js 18 as the base image
FROM node:18

# Set the working directory
WORKDIR /usr/src/app

# Install pnpm globally (optional, but recommended for monorepos)
RUN npm install -g pnpm@9.15.2

# Copy package.json and pnpm-lock.yaml
COPY package.json pnpm-lock.yaml ./

# Copy the entire monorepo source code
COPY . .

# Install dependencies using pnpm
RUN pnpm install

# Set the path to the Prisma schema
# ENV PRISMA_SCHEMA_PATH=/usr/src/app/prisma/schema.prisma

# Generate the Prisma client
# RUN npx prisma generate

# Build the monorepo (adjust the command based on your project naming)
RUN pnpm run build

# Start your NestJS app (adjust the command based on your project naming)
CMD ["npm", "run", "start"]
