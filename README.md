# Playing w/ AI

## Human Foreword

This is the home of some super quick vibe-coded projects used in an experiment in prompting some AI-assisted coding tools using various models.

If you're curious about what the AI made, you can check out the projects [on GitHub Pages](https://angelajfisher.github.io/playing-w-ai).

Now with that context out of the way, say hi to Claude 👋

## 🚀 Multi-Project React Deployment

This repository hosts three React projects deployed to GitHub Pages.

### Live Projects

- **Main Index**: [View All Projects](https://angelajfisher.github.io/playing-w-ai)
- **Calculator**: [View Calculator](https://angelajfisher.github.io/playing-w-ai/calculator)
- **Tic-Tac-Toe**: [View Tic-Tac-Toe](https://angelajfisher.github.io/playing-w-ai/tic-tac-toe)
- **Todo List Manager**: [View Todo List](https://angelajfisher.github.io/playing-w-ai/todo-list-manager)

### Project Structure

```
├── calculator/        # Calculator - React-based calculator application
├── tic-tac-toe/       # Tic-Tac-Toe - Classic tic-tac-toe game
├── todo-list-manager/ # Todo List Manager - Task management app
├── .github/
│   └── workflows/
│       └── deploy.yml # GitHub Actions deployment workflow
└── deploy.sh          # Local deployment script
```

### Deployment

#### Automatic Deployment

1. Push changes to the `main` branch
2. GitHub Actions will automatically copy all projects and deploy to GitHub Pages
3. Projects will be available at the URLs above

#### Manual Deployment

Run the deployment script locally:

```bash
./deploy.sh
```

### Setup Instructions

Since projects are already built, simply:

1. Add your built React projects to `calculator/`, `tic-tac-toe/`, and `todo-list-manager/` directories
2. Enable GitHub Pages in repository settings (source: "GitHub Actions")
3. Push to main branch - deployment happens automatically
