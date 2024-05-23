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
