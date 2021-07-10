FROM node:alpine
WORKDIR /app
COPY package.json package-lock.json ./
# add to path
ENV PATH /app/node_modules/.bin:$PATH


WORKDIR /usr/app
COPY ./ /usr/app
RUN npm install

EXPOSE 3000

CMD ["npm", "start"]