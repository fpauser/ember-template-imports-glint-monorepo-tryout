import { pageTitle } from 'ember-page-title';

import DemoAppComp01 from 'demo-app/components/demo-app-comp01';
import DemoAppComp02 from 'demo-app/components/demo-app-comp02';

import DemoAddonComp01 from 'demo-addon/components/demo-addon-comp01';
import DemoAddonComp02 from 'demo-addon/components/demo-addon-comp02';

import RouteTemplate from 'ember-route-template';

export default RouteTemplate(
  <template>
    {{pageTitle 'DemoApp'}}

    <DemoAppComp01 @name='Name1' />
    <DemoAppComp02>Name2</DemoAppComp02>

    <DemoAddonComp01 @name='name1' />
    <DemoAddonComp02 @name='name2' />

    {{outlet}}
  </template>,
);
