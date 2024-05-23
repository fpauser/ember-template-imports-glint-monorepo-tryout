# Setup

* app + addon monorepo
* ember-template-imports + glint typing
* linting / completion working (vscode)
 
## Step 01

* Generate demo-app
  
```
mkdir packages
ember new demo-app -dir packages/demo-app -sg -sn --typescript
```

* Add `pnpm-workspace.yaml` to project root

```
packages:
- packages/demo-app
```