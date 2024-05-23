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
