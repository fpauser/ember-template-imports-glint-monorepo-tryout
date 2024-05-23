# Setup

* app + addon monorepo
* ember-template-imports + glint typing
* linting / completion working (vscode)


## Step 01

* Generate demo-app
  
```bash
mkdir packages
ember new demo-app -dir packages/demo-app -sg -sn --typescript
```

* Add `pnpm-workspace.yaml` to project root

```yaml
packages:
- packages/demo-app
```


## Step 02

* Generate demo-addon
  
```bash
ember addon demo-addon -dir packages/demo-addon -sg -sn --typescript
```

* Update `pnpm-workspace.yaml`

```yaml
packages:
- packages/demo-app
- packages/demo-addon
```


## Step 03

* Install ember-template-imports dependencies in demo-app

```bash
cd packages/demo-app
pnpm add --save-dev ember-template-imports prettier-plugin-ember-template-tag
```

* Update `packages/demo-app/.prettierrc.js`

```js
'use strict';

module.exports = {
  plugins: ['prettier-plugin-ember-template-tag'],
  overrides: [
    {
      files: '*.{js,ts,gjs,gts}',
      options: {
        singleQuote: true,
      },
    },
  ],
};
```


## Step 04

* Update `eslint-plugin-ember` to version `12.1.x` in `packages/demo-app`

* Update `packages/demo-app/.eslintrcjs`

```js
    // glimmer-js
    {
      files: ['**/*.gjs'],
      parser: 'ember-eslint-parser',
      plugins: ['ember'],
      extends: [
        'eslint:recommended',
        'plugin:ember/recommended',
        'plugin:ember/recommended-gjs',
      ],
    },
    // glimmer-ts
    {
      files: ['**/*.gts'],
      parser: 'ember-eslint-parser',
      plugins: ['ember'],
      extends: [
        'eslint:recommended',
        'plugin:ember/recommended',
        'plugin:ember/recommended-gts',
      ],
    },
```

* Install required glint dependencies
 
```bash
cd packages/demo-app
pnpm i -D @glint/core @glint/environment-ember-template-imports
```

* Import `@glint/environment-ember-template-imports` in `packages/demo-app/types/global.d.ts`

```ts
import '@glint/environment-ember-loose';
import '@glint/environment-ember-template-imports';
```

* Add glint envs to `packages/demo-app/tsconfig.json`

```json
{
  "extends": "@tsconfig/ember/tsconfig.json",
  "compilerOptions": {
    // The combination of `baseUrl` with `paths` allows Ember's classic package
    // layout, which is not resolvable with the Node resolution algorithm, to
    // work with TypeScript.
    "baseUrl": ".",
    "paths": {
      "demo-app/tests/*": ["tests/*"],
      "demo-app/*": ["app/*"],
      "*": ["types/*"]
    }
  },
  "glint": {
    "environment": [
      "ember-loose",
      "ember-template-imports"
    ]
  }
}
```

* Add a simple test component in `packages/demo-app/app/components/demo-app-comp01.gts`:

```gts
<template>
  <div>
    Hello {{@name}}!
  </div>
</template>
```

* Add another simple test component in `packages/demo-app/app/components/demo-app-comp02.gts`:

```gts
import { type TOC } from '@ember/component/template-only';

interface Signature {
  Element: HTMLSpanElement;
  Args: {
    name: string;
  };
}

export const DemoAppComp02: TOC<Signature> = <template>
  <div>
    Hello
    {{@name}}!
  </div>
</template>;

export default DemoAppComp02;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    DemoAppComp02: typeof DemoAppComp02;
  }
}
```

* Update the application template at `packages/demo-app/app/templates/application.hbs` & call the test components

```hbs
{{page-title "DemoApp"}}

<DemoAppComp01 @name="Name1" />
<DemoAppComp02 @name="Name2" />

{{outlet}}
```


## Step 05

* Install `ember-route-template`

```bash
cd packages/demo-app
pnpm i -D ember-route-template
```

* Update `packages/demo-app/app/components/demo-app-comp01.gts`

```gts
import { type TOC } from '@ember/component/template-only';

interface Signature {
  Element: HTMLSpanElement;
  Args: {
    name: string;
  };
}

export const DemoAppComp01: TOC<Signature> = <template>
  <div>
    Hello
    {{@name}}!
  </div>
</template>;

export default DemoAppComp01;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    DemoAppComp01: typeof DemoAppComp01;
  }
}
```

* Update `packages/demo-app/app/components/demo-app-comp02.tgs`

```gts
import { type TOC } from '@ember/component/template-only';

interface DemoAppComp02Signature {
  Element: HTMLSpanElement;
  Args: {};
  Blocks: {
    default: [];
  };
}

export const DemoAppComp02: TOC<DemoAppComp02Signature> = <template>
  <div>
    Hello
    {{yield}}!
  </div>
</template>;

export default DemoAppComp02;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    DemoAppComp02: typeof DemoAppComp02;
  }
}
```

* Rename `application.hbs` to `application.gts` and update:

```gts
import { pageTitle } from 'ember-page-title';
import DemoAppComp01 from '../components/demo-app-comp01';
import DemoAppComp02 from '../components/demo-app-comp02';
import RouteTemplate from 'ember-route-template';

export default RouteTemplate(
  <template>
    {{pageTitle 'DemoApp'}}

    <DemoAppComp01 @name='Name1' />
    <DemoAppComp02>Name2</DemoAppComp02>

    {{outlet}}
  </template>,
);
```

* Add a global shared `tsconfig.shared.json` and update `packages/demp-app/tsconfig.json` to extend from it