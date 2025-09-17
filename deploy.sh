#!/bin/bash

# GitHub Pages Deployment Script for Multiple React Projects
# This script builds and deploys three React projects to GitHub Pages

set -e

echo "🚀 Starting deployment process..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Get repository name for GitHub Pages URL
REPO_NAME=$(basename "$(git rev-parse --show-toplevel)")
print_status "Repository: $REPO_NAME"

# Create deployment directory
print_status "Creating deployment directory..."
rm -rf dist
mkdir -p dist

# Array of project directories
PROJECTS=("calculator" "tic-tac-toe" "todo-list-manager")

# Copy each pre-built project
for project in "${PROJECTS[@]}"; do
    if [ -d "$project" ]; then
        print_status "Copying $project..."

        # Copy the entire project directory
        cp -r "$project" "dist/$project"
        print_status "✅ $project copied successfully"
    else
        print_warning "$project directory not found, skipping..."
    fi
done

# Create main index page
print_status "Creating main index page..."
cat > dist/index.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>React Projects</title>
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            max-width: 800px;
            margin: 0 auto;
            padding: 2rem;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
        }
        .container {
            background: white;
            padding: 2rem;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 1rem;
            font-size: 2.5rem;
        }
        .subtitle {
            text-align: center;
            color: #666;
            margin-bottom: 2rem;
            font-size: 1.1rem;
        }
        .projects {
            display: grid;
            gap: 1.5rem;
            margin-top: 2rem;
        }
        .project-card {
            border: 2px solid #e1e5e9;
            border-radius: 8px;
            padding: 2rem;
            text-decoration: none;
            color: inherit;
            transition: all 0.3s ease;
            background: linear-gradient(45deg, #f8f9fa, #ffffff);
        }
        .project-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
            border-color: #007bff;
        }
        .project-title {
            font-size: 1.5rem;
            font-weight: 700;
            margin-bottom: 0.8rem;
            color: #007bff;
        }
        .project-description {
            color: #6c757d;
            line-height: 1.6;
            font-size: 1rem;
        }
        .badge {
            display: inline-block;
            background: #007bff;
            color: white;
            padding: 0.25rem 0.75rem;
            border-radius: 12px;
            font-size: 0.85rem;
            margin-top: 1rem;
        }
        .footer {
            text-align: center;
            margin-top: 3rem;
            color: #6c757d;
            font-size: 0.9rem;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🚀 React Projects</h1>
        <p class="subtitle">Select a project to explore</p>
        <div class="projects">
            <a href="./calculator/" class="project-card">
                <div class="project-title">Calculator</div>
                <div class="project-description">A React-based calculator application</div>
                <span class="badge">View App</span>
            </a>
            <a href="./tic-tac-toe/" class="project-card">
                <div class="project-title">Tic-Tac-Toe</div>
                <div class="project-description">Classic tic-tac-toe game built with React</div>
                <span class="badge">View App</span>
            </a>
            <a href="./todo-list-manager/" class="project-card">
                <div class="project-title">Todo List Manager</div>
                <div class="project-description">A task management app for organizing your todos</div>
                <span class="badge">View App</span>
            </a>
        </div>
        <div class="footer">
            <p>Deployed with GitHub Pages</p>
        </div>
    </div>
</body>
</html>
EOF

print_status "✅ Deployment preparation complete!"
print_status "Files ready in ./dist directory"
print_status ""
print_status "Next steps:"
print_status "1. Commit and push your changes"
print_status "2. The GitHub Action will automatically deploy to GitHub Pages"
print_status "3. Your projects will be available at:"
print_status "   - Main page: https://[username].github.io/$REPO_NAME"
print_status "   - Calculator: https://[username].github.io/$REPO_NAME/calculator"
print_status "   - Tic-Tac-Toe: https://[username].github.io/$REPO_NAME/tic-tac-toe"
print_status "   - Todo List Manager: https://[username].github.io/$REPO_NAME/todo-list-manager"