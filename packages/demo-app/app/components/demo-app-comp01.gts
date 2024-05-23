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
