// by nota

//com.sulake.habbo.navigator.TextSearchInputs

package com.sulake.habbo.navigator
{
    import com.sulake.core.window.components._SafeStr_3269;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;

    public class TextSearchInputs 
    {

        private var _navigator:HabboNavigator;
        private var _SafeStr_5219:TextFieldManager;
        private var _SafeStr_6109:_SafeStr_3269;

        public function TextSearchInputs(_arg_1:HabboNavigator, _arg_2:_SafeStr_3133)
        {
            var _local_4:* = null;
            super();
            _navigator = _arg_1;
            var _local_3:ITextFieldWindow = ITextFieldWindow(_arg_2.findChildByName("search_str"));
            _SafeStr_5219 = new TextFieldManager(_navigator, _local_3, 35, searchRooms, _navigator.getText("navigator.search.info"));
            Util.setProc(_arg_2, "search_but", onSearchButtonClick);
            var _local_5:Boolean = true;
            if (_local_5)
            {
                _SafeStr_6109 = (_arg_2.findChildByName("search_type") as _SafeStr_3269);
                _local_4 = [];
                _local_4.push(_navigator.getText("${navigator.navisel.bydefault}"));
                _local_4.push(_navigator.getText("${navigator.navisel.byowner}"));
                _local_4.push(_navigator.getText("${navigator.navisel.byroomname}"));
                _local_4.push(_navigator.getText("${navigator.navisel.bytag}"));
                _local_4.push(_navigator.getText("${navigator.navisel.bygroupname}"));
                _SafeStr_6109.populate(_local_4);
                _SafeStr_6109.selection = 0;
            };
        }

        public function dispose():void
        {
            if (_SafeStr_5219)
            {
                _SafeStr_5219.dispose();
                _SafeStr_5219 = null;
            };
            _navigator = null;
        }

        public function setText(_arg_1:String, _arg_2:int):void
        {
            _SafeStr_5219.setText(_arg_1);
            if (_SafeStr_6109 != null)
            {
                switch (_arg_2)
                {
                    case 8:
                        _SafeStr_6109.selection = 0;
                        return;
                    case 20:
                        _SafeStr_6109.selection = 1;
                        return;
                    case 10:
                        _SafeStr_6109.selection = 2;
                        return;
                    case 9:
                        _SafeStr_6109.selection = 3;
                        return;
                    case 13:
                        _SafeStr_6109.selection = 4;
                    default:
                };
            };
        }

        private function onSearchButtonClick(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            searchRooms();
        }

        private function searchRooms():void
        {
            var _local_1:String = _SafeStr_5219.getText();
            if (_local_1 == "")
            {
                return;
            };
            if (_SafeStr_6109 != null)
            {
                switch (_SafeStr_6109.selection)
                {
                    case 0:
                        _navigator.mainViewCtrl.startSearch(5, 8, _local_1);
                        break;
                    case 1:
                        _navigator.mainViewCtrl.startSearch(5, 20, _local_1);
                        break;
                    case 2:
                        _navigator.mainViewCtrl.startSearch(5, 10, _local_1);
                        break;
                    case 3:
                        _navigator.mainViewCtrl.startSearch(5, 9, _local_1);
                        break;
                    case 4:
                        _navigator.mainViewCtrl.startSearch(5, 13, _local_1);
                    default:
                };
            }
            else
            {
                _navigator.mainViewCtrl.startSearch(5, 8, _local_1);
            };
            _navigator.trackNavigationDataPoint("Search", "search", _local_1);
        }

        public function get searchStr():TextFieldManager
        {
            return (_SafeStr_5219);
        }


    }
}//package com.sulake.habbo.navigator

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3269 = "_-g14" (String#723, DoABC#4)
// _SafeStr_5219 = "_-x6" (String#3779, DoABC#4)
// _SafeStr_6109 = "_-VG" (String#5633, DoABC#4)


