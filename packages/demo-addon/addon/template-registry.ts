import type DemoAddonComp01 from './components/demo-addon-comp01.gts';
import type DemoAddonComp02 from './components/demo-addon-comp02.gts';

export default interface DemoAddonRegistry {
  DemoAddonComp01: typeof DemoAddonComp01;
  DemoAddonComp02: typeof DemoAddonComp02;
}
