// by nota

//com.sulake.habbo.navigator.view.search.SearchView

package com.sulake.habbo.navigator.view.search
{
    import com.sulake.habbo.navigator.HabboNewNavigator;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.components._SafeStr_3269;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowKeyboardEvent;
    import com.sulake.core.window.events._SafeStr_3116;

    public class SearchView 
    {

        private static const INPUT_PLACEHOLDER_TEXTCOLOR:uint = 0x9F9F9F;
        private static const INPUT_TEXTCOLOR:uint = 0;

        private static var FILTER_SELECTOR_INDEX_TO_MODE:Array = [5, 2, 1, 3, 4];
        private static var FILTER_MODE_TO_SELECTOR_INDEX:Array = [0, 2, 1, 3, 4, 0];

        private var _navigator:HabboNewNavigator;
        private var _container:_SafeStr_3133;
        private var _SafeStr_6000:ITextFieldWindow;
        private var _SafeStr_6001:_SafeStr_3269;
        private var _SafeStr_6002:String;

        public function SearchView(_arg_1:HabboNewNavigator)
        {
            _navigator = _arg_1;
            _SafeStr_6002 = _navigator.localization.getLocalizationWithParams("navigator.filter.input.placeholder", "filter rooms by...");
        }

        public function set container(_arg_1:_SafeStr_3133):void
        {
            _container = _arg_1;
            _SafeStr_6001 = _SafeStr_3269(_container.findChildByName("filter_type_drop_menu"));
            _SafeStr_6000 = ITextFieldWindow(_container.findChildByName("search_input"));
            _SafeStr_6000.addEventListener("WKE_KEY_UP", keyUpHandler);
            _SafeStr_6000.addEventListener("WE_CHANGE", onInputChanged);
            _SafeStr_6000.addEventListener("WE_FOCUSED", onInputFocused);
            var _local_2:_SafeStr_3109 = _container.findChildByName("clear_search_button");
            if (_local_2)
            {
                _local_2.addEventListener("WME_CLICK", onClearSearch);
            };
            clear();
        }

        private function onClearSearch(_arg_1:WindowMouseEvent=null):void
        {
            _SafeStr_6000.focus();
            _SafeStr_6000.caption = "";
            var _local_2:IStaticBitmapWrapperWindow = (_container.findChildByName("search.clear.icon") as IStaticBitmapWrapperWindow);
            _local_2.assetUri = "common_small_pen";
        }

        public function clear():void
        {
            setInputToFilterPlaceHolder();
            _SafeStr_6001.selection = 0;
            _container.findChildByName("refreshButtonContainer").visible = false;
        }

        public function setTextAndSearchModeFromFilter(_arg_1:String, _arg_2:String=""):void
        {
            var _local_4:* = null;
            var _local_3:int = _SafeStr_3441.filterInInput(_arg_1);
            if (_local_3 != 0)
            {
                _SafeStr_6001.selection = FILTER_MODE_TO_SELECTOR_INDEX[_local_3];
                _SafeStr_6000.caption = _arg_1.substr(_SafeStr_3441.FILTER_PREFIX[_local_3].length, (_arg_1.length - _SafeStr_3441.FILTER_PREFIX[_local_3].length));
            }
            else
            {
                _SafeStr_6000.caption = _arg_1;
                _SafeStr_6001.selection = 0;
            };
            if (((!(_arg_2 == "")) && (!(_arg_2 == _SafeStr_6002))))
            {
                _SafeStr_6000.caption = _arg_2;
                setInputFieldTextFormattingToPlaceholder(true);
            }
            else
            {
                if (_SafeStr_6000.caption == "")
                {
                    setInputToFilterPlaceHolder();
                }
                else
                {
                    setInputFieldTextFormattingToPlaceholder(false);
                };
            };
            if (((!(_SafeStr_6000.caption.length == 0)) && (!(_SafeStr_6000.caption == _SafeStr_6002))))
            {
                _container.findChildByName("refreshButtonContainer").visible = true;
                _local_4 = (_container.findChildByName("search.clear.icon") as IStaticBitmapWrapperWindow);
                _local_4.assetUri = "icons_close";
            }
            else
            {
                _container.findChildByName("refreshButtonContainer").visible = false;
                _local_4 = (_container.findChildByName("search.clear.icon") as IStaticBitmapWrapperWindow);
                _local_4.assetUri = "common_small_pen";
            };
        }

        private function keyUpHandler(_arg_1:WindowKeyboardEvent):void
        {
            if (_arg_1.keyCode == 13)
            {
                _navigator.performSearch(_navigator.currentResults.searchCodeOriginal, getFilterParameter());
            };
        }

        private function getFilterParameter():String
        {
            return (_SafeStr_3441.FILTER_PREFIX[FILTER_SELECTOR_INDEX_TO_MODE[_SafeStr_6001.selection]] + _SafeStr_6000.caption);
        }

        private function setInputToFilterPlaceHolder():void
        {
            setInputFieldTextFormattingToPlaceholder(true);
            _SafeStr_6000.caption = _SafeStr_6002;
        }

        private function onInputFocused(_arg_1:_SafeStr_3116):void
        {
            setInputFieldTextFormattingToPlaceholder(false);
            if (_SafeStr_6000.caption == _SafeStr_6002)
            {
                _SafeStr_6000.caption = "";
            };
        }

        private function setInputFieldTextFormattingToPlaceholder(_arg_1:Boolean):void
        {
            _SafeStr_6000.textColor = ((_arg_1) ? 0x9F9F9F : 0);
            _SafeStr_6000.italic = _arg_1;
        }

        private function onInputChanged(_arg_1:_SafeStr_3116):void
        {
        }

        public function get currentInput():String
        {
            if (_SafeStr_6000 != null)
            {
                return (_SafeStr_6000.caption);
            };
            return (_SafeStr_6002);
        }


    }
}//package com.sulake.habbo.navigator.view.search

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3269 = "_-g14" (String#723, DoABC#4)
// _SafeStr_3441 = "_-J1f" (String#10293, DoABC#4)
// _SafeStr_6000 = "_-R1l" (String#822, DoABC#4)
// _SafeStr_6001 = "_-Lu" (String#11445, DoABC#4)
// _SafeStr_6002 = "_-81b" (String#9625, DoABC#4)


