# 🚀 Deployment Guide

This guide will help you deploy your MERN e-commerce application to various platforms.

## 📋 Prerequisites

1. **MongoDB Database** - Set up a MongoDB database (MongoDB Atlas recommended)
2. **Cloudinary Account** - For image uploads
3. **Environment Variables** - Set up all required environment variables

## 🔧 Environment Setup

### 1. Create Environment Files

#### Client Environment (client/.env)
```env
VITE_APP_BASE_URL=https://your-backend-domain.com/api/v1
```

#### Server Environment (server/.env)
```env
PORT=5000
MONGO_URL=mongodb+srv://username:password@cluster.mongodb.net/ecommerce
JWT_SECRET=your_super_secret_jwt_key_here
JWT_EXPIRE=7d

# Cloudinary Configuration
CLOUD_NAME=your_cloudinary_cloud_name
API_KEY=your_cloudinary_api_key
API_SECRET=your_cloudinary_api_secret

# Optional: Email Configuration
EMAIL_HOST=smtp.gmail.com
EMAIL_PORT=587
EMAIL_USER=your_email@gmail.com
EMAIL_PASS=your_email_password
```

## 🌐 Deployment Options

### Option 1: Vercel (Recommended for Full-Stack)

1. **Install Vercel CLI**
   ```bash
   npm i -g vercel
   ```

2. **Login to Vercel**
   ```bash
   vercel login
   ```

3. **Deploy**
   ```bash
   vercel --prod
   ```

4. **Set Environment Variables in Vercel Dashboard**
   - Go to your project settings
   - Add all environment variables from server/.env

### Option 2: Heroku

1. **Install Heroku CLI**
   ```bash
   # Download from https://devcenter.heroku.com/articles/heroku-cli
   ```

2. **Login to Heroku**
   ```bash
   heroku login
   ```

3. **Create Heroku App**
   ```bash
   heroku create your-app-name
   ```

4. **Add MongoDB Add-on**
   ```bash
   heroku addons:create mongolab
   ```

5. **Set Environment Variables**
   ```bash
   heroku config:set NODE_ENV=production
   heroku config:set JWT_SECRET=your_jwt_secret
   heroku config:set CLOUD_NAME=your_cloudinary_name
   heroku config:set API_KEY=your_cloudinary_key
   heroku config:set API_SECRET=your_cloudinary_secret
   ```

6. **Deploy**
   ```bash
   git add .
   git commit -m "Deploy to Heroku"
   git push heroku main
   ```

### Option 3: Railway

1. **Connect GitHub Repository**
   - Go to railway.app
   - Connect your GitHub account
   - Select your repository

2. **Set Environment Variables**
   - Add all variables from server/.env in Railway dashboard

3. **Deploy**
   - Railway will automatically deploy on push to main branch

### Option 4: Render

1. **Create New Web Service**
   - Go to render.com
   - Connect your GitHub repository
   - Select "Web Service"

2. **Configure Build Settings**
   - **Build Command**: `npm run install-all && npm run build`
   - **Start Command**: `npm start`

3. **Set Environment Variables**
   - Add all variables from server/.env

4. **Deploy**
   - Render will automatically deploy

### Option 5: DigitalOcean App Platform

1. **Create App**
   - Go to DigitalOcean App Platform
   - Connect your GitHub repository

2. **Configure Build Settings**
   - Set build command: `npm run install-all && npm run build`
   - Set run command: `npm start`

3. **Set Environment Variables**
   - Add all required environment variables

4. **Deploy**
   - DigitalOcean will handle the deployment

## 🐳 Docker Deployment

### Build Docker Image
```bash
docker build -t ecommerce-app .
```

### Run Docker Container
```bash
docker run -p 5000:5000 --env-file server/.env ecommerce-app
```

### Docker Compose (Optional)
Create `docker-compose.yml`:
```yaml
version: '3.8'
services:
  app:
    build: .
    ports:
      - "5000:5000"
    environment:
      - NODE_ENV=production
    env_file:
      - server/.env
```

## 🔍 Post-Deployment Checklist

1. **Test API Endpoints**
   - Verify all API routes are working
   - Test authentication
   - Test file uploads

2. **Update Frontend URLs**
   - Update `VITE_APP_BASE_URL` in client/.env
   - Rebuild and redeploy frontend

3. **Database Connection**
   - Ensure MongoDB connection is working
   - Test CRUD operations

4. **File Uploads**
   - Test Cloudinary integration
   - Verify image uploads work

5. **SSL/HTTPS**
   - Ensure your domain has SSL certificate
   - Update CORS settings if needed

## 🛠️ Troubleshooting

### Common Issues:

1. **CORS Errors**
   - Update CORS origin in server/index.js
   - Add your frontend domain to allowed origins

2. **Environment Variables**
   - Double-check all environment variables are set
   - Ensure no typos in variable names

3. **Database Connection**
   - Verify MongoDB connection string
   - Check network access to database

4. **Build Errors**
   - Ensure all dependencies are installed
   - Check Node.js version compatibility

## 📞 Support

If you encounter issues:
1. Check the deployment platform logs
2. Verify environment variables
3. Test locally with production settings
4. Check MongoDB and Cloudinary connections

## 🔄 Continuous Deployment

For automatic deployments:
1. Connect your GitHub repository to your chosen platform
2. Set up environment variables
3. Configure build and start commands
4. Push to main branch to trigger deployment 