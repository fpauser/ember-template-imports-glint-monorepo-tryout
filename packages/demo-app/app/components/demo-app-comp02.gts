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
