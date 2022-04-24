// by nota

//com.sulake.habbo.navigator.view.QuickLinksView

package com.sulake.habbo.navigator.view
{
    import com.sulake.habbo.navigator.HabboNewNavigator;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.navigator.context.SearchContext;
    import __AS3__.vec.Vector;
    import _-21f._SafeStr_1598;
    import com.sulake.core.window.components._SafeStr_3240;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;

    public class QuickLinksView 
    {

        private var _navigator:HabboNewNavigator;
        private var _SafeStr_5686:IRegionWindow;
        private var _itemList:IItemListWindow;
        private var _SafeStr_6410:Array = [];
        private var _SafeStr_6411:Array = [];

        public function QuickLinksView(_arg_1:HabboNewNavigator)
        {
            _navigator = _arg_1;
        }

        public function set itemList(_arg_1:IItemListWindow):void
        {
            _itemList = _arg_1;
        }

        public function set template(_arg_1:IRegionWindow):void
        {
            _SafeStr_5686 = _arg_1;
        }

        public function setQuickLinks(_arg_1:Vector.<_SafeStr_1598>):void
        {
            var _local_2:int;
            var _local_4:* = null;
            var _local_3:* = null;
            _itemList.removeListItems();
            _SafeStr_6410 = [];
            _SafeStr_6411 = [];
            _local_2 = 0;
            while (_local_2 < _arg_1.length)
            {
                _local_4 = IRegionWindow(_SafeStr_5686.clone());
                _local_4.id = _local_2;
                _local_3 = ITextWindow(_local_4.findChildByName("quick_link_text"));
                _local_3.caption = (_navigator.localization.getLocalization(("navigator.searchcode.title." + _arg_1[_local_2].searchCode), _arg_1[_local_2].searchCode) + ((_arg_1[_local_2].filter != "") ? (" - " + _arg_1[_local_2].filter) : ""));
                if (_arg_1[_local_2].searchCode.indexOf("category__") == 0)
                {
                    _local_3.caption = (_arg_1[_local_2].searchCode.substr("category__".length) + ((_arg_1[_local_2].filter != "") ? (" - " + _arg_1[_local_2].filter) : ""));
                };
                _local_4.procedure = listItemProcedure;
                _SafeStr_6410.push(new SearchContext(_arg_1[_local_2].searchCode, _arg_1[_local_2].filter));
                _SafeStr_6411.push(_arg_1[_local_2].id);
                _itemList.addListItem(_local_4);
                _local_2++;
            };
        }

        private function listItemProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                if ((_arg_2 is IRegionWindow))
                {
                    if (_SafeStr_6410.length > _arg_2.id)
                    {
                        _navigator.performSearchByContext(_SafeStr_6410[_arg_2.id]);
                        _navigator.trackEventLog("savedsearch.execute", "SavedSearch", HabboNewNavigator.getEventLogExtraStringFromSearch(_SafeStr_6410[_arg_2.id].searchCode, _SafeStr_6410[_arg_2.id].filtering));
                    };
                }
                else
                {
                    if ((_arg_2 is _SafeStr_3240))
                    {
                        _navigator.deleteSavedSearch(_SafeStr_6411[_arg_2.parent.id]);
                    };
                };
            }
            else
            {
                if (_arg_1.type == "WME_OVER")
                {
                    if ((_arg_2 is IRegionWindow))
                    {
                        _SafeStr_3240(IRegionWindow(_arg_2).getChildAt(1)).visible = true;
                    }
                    else
                    {
                        if ((_arg_2 is _SafeStr_3240))
                        {
                            _arg_2.visible = true;
                        };
                    };
                }
                else
                {
                    if (((_arg_1.type == "WME_OUT") && (_arg_2 is IRegionWindow)))
                    {
                        _SafeStr_3240(IRegionWindow(_arg_2).getChildAt(1)).visible = false;
                    };
                };
            };
        }


    }
}//package com.sulake.habbo.navigator.view

// _SafeStr_1598 = "_-UP" (String#10470, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3240 = "_-O8" (String#1647, DoABC#4)
// _SafeStr_5686 = "_-SO" (String#4122, DoABC#4)
// _SafeStr_6410 = "_-wN" (String#7367, DoABC#4)
// _SafeStr_6411 = "_-N1s" (String#10323, DoABC#4)


