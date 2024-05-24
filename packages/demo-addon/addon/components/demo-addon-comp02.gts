import { type TOC } from '@ember/component/template-only';

interface Signature {
  Element: HTMLSpanElement;
  Args: {
    name: string;
  };
}

export const DemoAddonComp02: TOC<Signature> = <template>
  <div>
    Hello from addon-comp02
    {{@name}}!
  </div>
</template>;

export default DemoAddonComp02;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    DemoAddonComp02: typeof DemoAddonComp02;
  }
}
