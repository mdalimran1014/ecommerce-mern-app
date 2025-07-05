#!/bin/bash

echo "🚀 Starting deployment process..."

# Check if .env files exist
if [ ! -f "server/.env" ]; then
    echo "❌ Error: server/.env file not found!"
    echo "Please create server/.env with your environment variables"
    exit 1
fi

if [ ! -f "client/.env" ]; then
    echo "❌ Error: client/.env file not found!"
    echo "Please create client/.env with your environment variables"
    exit 1
fi

# Install dependencies
echo "📦 Installing dependencies..."
npm run install-all

# Build the application
echo "🔨 Building the application..."
npm run build

# Check if build was successful
if [ $? -eq 0 ]; then
    echo "✅ Build completed successfully!"
else
    echo "❌ Build failed!"
    exit 1
fi

echo "🎉 Deployment preparation completed!"
echo ""
echo "Next steps:"
echo "1. Choose your deployment platform (Vercel, Heroku, Railway, etc.)"
echo "2. Set up environment variables on your platform"
echo "3. Deploy using the platform's CLI or dashboard"
echo ""
echo "For detailed instructions, see DEPLOYMENT.md" 