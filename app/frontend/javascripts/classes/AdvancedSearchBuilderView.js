import StoreManager from './StoreManager.js';
import ConditionGroup from './ConditionGroup.js';
import AdvancedSearchToolbar from './AdvancedSearchToolbar.js';

export default class AdvancedSearchBuilderView {

  constructor(elm) {
    console.log(elm)

    const inner = elm.querySelector(':scope > .inner');
    this._rootGroup = new ConditionGroup(inner, 'and', [], true);

    // toolbar
    new AdvancedSearchToolbar(this._rootGroup.maketToolbar(), this);

    // events
    StoreManager.bind('advancedSearchConditions', this);
  }

  _addCondition(condition) {
    console.log(condition)
  }

  _group() {
    console.log('_group')
  }

  _ungroup() {
    console.log('_ungroup')
  }

  _copy() {
    console.log('_copy')
  }

  _edit() {
    console.log('_edit')
  }

  _delete() {
    console.log('_delete')
  }

}