# How to Sync Your `main` Branch with `master`

## Problem Summary

Your repository has two branches that have diverged:
- **`main`**: Contains 1 commit ("Initial commit" from June 14, 2025)
- **`master`**: Contains 25 commits (all your development work, latest from December 5, 2025)

The `main` branch was created as a new branch instead of renaming `master`, which is why:
- `main` is "24 commits behind" `master` (missing all the development commits)
- `main` is "1 commit ahead" of `master` (has the unique "Initial commit")

## Solution

You have two options to fix this:

### Option 1: Force Update `main` to Match `master` (Recommended)

This will make `main` identical to `master`, discarding the single "Initial commit" on main.

**Using GitHub Web UI:**
1. Go to your repository: https://github.com/iamSaifulhassan/portfolio
2. Go to **Settings** → **Branches**
3. Temporarily change the default branch back to `master`
4. Delete the `main` branch:
   - Go to **Code** → **Branches**
   - Find `main` and click the trash icon to delete it
5. Create a new `main` branch from `master`:
   - Go to **Code** tab
   - Click the branch dropdown (showing `master`)
   - Type `main` in the search box
   - Click "Create branch: main from master"
6. Go back to **Settings** → **Branches** and set `main` as the default branch

**Using Git Command Line:**
```bash
# Clone the repository (or navigate to your local clone)
git clone https://github.com/iamSaifulhassan/portfolio.git
cd portfolio

# Fetch all branches
git fetch --all

# Checkout master branch
git checkout master

# Delete the local main branch if it exists
git branch -D main

# Create a new main branch from master
git checkout -b main

# Force push the new main branch to overwrite the old one
git push origin main --force

# Set main as the default branch on GitHub (via Settings > Branches)
```

### Option 2: Rename `master` to `main` (Alternative)

If you want to preserve all history and simply rename the branch:

**Using Git Command Line:**
```bash
# Clone the repository
git clone https://github.com/iamSaifulhassan/portfolio.git
cd portfolio

# Checkout master
git checkout master

# Rename master to main
git branch -m master main

# Delete the old main branch on remote
git push origin --delete main

# Push the renamed main branch
git push -u origin main

# Delete master branch from remote
git push origin --delete master
```

Then on GitHub:
1. Go to **Settings** → **Branches**
2. Set `main` as the default branch

## After Fixing

Once you've synchronized the branches:
- `main` will contain all 25 commits from your development work
- You can optionally delete the `master` branch if you no longer need it
- Future work should be done against the `main` branch

## Need Help?

If you encounter any issues, you can also:
1. Contact GitHub Support
2. Create a backup of your repository first
3. Consider using GitHub's branch protection rules after setting up `main`
