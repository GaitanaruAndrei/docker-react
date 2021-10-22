FROM node:alpine as builder 
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . . 
RUN npm run build


#/app/buil <--- all the stuff 

FROM nginx
COPY --from=builder /app/build/ /usr/share/nginx/html 


#7f9c0252228283ec2