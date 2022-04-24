// by nota

//com.sulake.habbo.navigator.mainview.CategoryListCtrl

package com.sulake.habbo.navigator.mainview
{
    import com.sulake.habbo.navigator.IViewCtrl;
    import com.sulake.habbo.navigator.UserCountRenderer;
    import com.sulake.habbo.navigator.HabboNavigator;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.IScrollbarWindow;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.habbo.navigator.Util;
    import _-Ja._SafeStr_1629;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;

    public class CategoryListCtrl implements IViewCtrl 
    {

        private static const CATEGORY_SPACING:int = 5;

        private var _SafeStr_5195:UserCountRenderer;
        private var _navigator:HabboNavigator;
        private var _content:_SafeStr_3133;
        private var _SafeStr_4162:IItemListWindow;
        private var _SafeStr_4452:IScrollbarWindow;

        public function CategoryListCtrl(_arg_1:HabboNavigator)
        {
            _navigator = _arg_1;
            _SafeStr_5195 = new UserCountRenderer(_navigator);
        }

        public function dispose():void
        {
            if (_SafeStr_5195)
            {
                _SafeStr_5195.dispose();
                _SafeStr_5195 = null;
            };
        }

        public function refresh():void
        {
            var _local_4:int;
            var _local_1:* = null;
            var _local_10:* = null;
            var _local_2:int;
            var _local_5:int;
            var _local_3:int;
            var _local_6:Array = _navigator.data.allCategories;
            var _local_7:_SafeStr_24 = _navigator.data.categoriesWithVisitorData.categoryToCurrentUserCountMap;
            var _local_8:_SafeStr_24 = _navigator.data.categoriesWithVisitorData.categoryToMaxUserCountMap;
            var _local_9:_SafeStr_3133 = _SafeStr_3133(_SafeStr_4162.getListItemAt(0));
            _local_4 = 0;
            while (_local_4 < _local_6.length)
            {
                _local_1 = _local_6[_local_4];
                if (_local_1.visible)
                {
                    _local_10 = getCategoryContainer(_local_9, _local_4);
                    if (_local_10 == null)
                    {
                        _local_10 = createEntry(_local_4);
                        _local_10.id = _local_4;
                        _local_9.addChild(_local_10);
                    };
                    _local_2 = _local_7.getValue(_local_1.nodeId);
                    _local_5 = _local_8.getValue(_local_1.nodeId);
                    refreshEntry(_local_10, _local_1, _local_2, _local_5);
                    _local_10.y = _local_3;
                    _local_3 = (_local_3 + (_local_10.height + 5));
                    _local_10.visible = true;
                    _local_9.height = ((Util.getLowestPoint(_local_9) > 0) ? (Util.getLowestPoint(_local_9) + 5) : 0);
                };
                _local_4++;
            };
            if (_SafeStr_4452 != null)
            {
                _SafeStr_4452.scrollV = 0;
                _SafeStr_4452.visible = true;
            };
        }

        public function refreshEntry(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1629, _arg_3:int, _arg_4:int):void
        {
            _arg_1.findChildByName("category_name_txt").caption = _arg_2.visibleName;
            _arg_1.findChildByName("arrow_right_icon").visible = true;
            _SafeStr_5195.refreshUserCount(_arg_4, _SafeStr_3133(_arg_1.findChildByName("enter_category_button")), _arg_3, "${navigator.usercounttooltip.users}", 297, 35);
        }

        public function createEntry(_arg_1:int):_SafeStr_3133
        {
            var _local_2:_SafeStr_3133 = _SafeStr_3133(_navigator.getXmlWindow("grs_category_selector"));
            setProcedureAndId(_local_2, _arg_1, "enter_category_button", onSelectCategory);
            _navigator.refreshButton(_local_2, "navi_room_icon", true, null, 0);
            return (_local_2);
        }

        private function onSelectCategory(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_3:* = null;
            if (_arg_1.type == "WME_CLICK")
            {
                _local_3 = _navigator.data.allCategories[_arg_2.id];
                _navigator.mainViewCtrl.startSearch(2, 1, ("" + _local_3.nodeId));
            };
        }

        private function getCategoryContainer(_arg_1:_SafeStr_3133, _arg_2:int):_SafeStr_3133
        {
            return (_SafeStr_3133(_arg_1.getChildByID(_arg_2)));
        }

        private function setProcedureAndId(_arg_1:_SafeStr_3133, _arg_2:int, _arg_3:String, _arg_4:Function):void
        {
            _arg_1.findChildByName(_arg_3).procedure = _arg_4;
            _arg_1.findChildByName(_arg_3).id = _arg_2;
        }

        public function set content(_arg_1:_SafeStr_3133):void
        {
            _content = _arg_1;
            _SafeStr_4162 = ((_content) ? IItemListWindow(_content.findChildByName("item_list_category")) : null);
            _SafeStr_4452 = ((_content) ? IScrollbarWindow(_content.findChildByName("scroller")) : null);
        }

        public function get content():_SafeStr_3133
        {
            return (_content);
        }


    }
}//package com.sulake.habbo.navigator.mainview

// _SafeStr_1629 = "_-K0" (String#4251, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_4162 = "_-CL" (String#282, DoABC#4)
// _SafeStr_4452 = "_-91k" (String#2815, DoABC#4)
// _SafeStr_5195 = "_-uW" (String#2551, DoABC#4)


