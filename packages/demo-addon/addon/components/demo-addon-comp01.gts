import { type TOC } from '@ember/component/template-only';

interface Signature {
  Element: HTMLSpanElement;
  Args: {
    name: string;
  };
}

export const DemoAddonComp01: TOC<Signature> = <template>
  <div>
    Hello from addon-comp01
    {{@name}}!
  </div>
</template>;

export default DemoAddonComp01;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    DemoAddonComp01: typeof DemoAddonComp01;
  }
}
