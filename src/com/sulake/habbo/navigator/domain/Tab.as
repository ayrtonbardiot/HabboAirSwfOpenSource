// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.navigator.domain.Tab

package com.sulake.habbo.navigator.domain
{
    import com.sulake.habbo.navigator.HabboNavigator;
    import com.sulake.core.window.components.ITabButtonWindow;
    import com.sulake.habbo.navigator.mainview.tabpagedecorators.ITabPageDecorator;

    public class Tab 
    {

        private var _navigator:HabboNavigator;
        private var _SafeStr_3820:int;
        private var _SafeStr_6184:int;
        private var _button:ITabButtonWindow;
        private var _SafeStr_6185:ITabPageDecorator;
        private var _selected:Boolean;
        private var _searchMsg:int;

        public function Tab(_arg_1:HabboNavigator, _arg_2:int, _arg_3:int, _arg_4:ITabPageDecorator, _arg_5:int=1)
        {
            _navigator = _arg_1;
            _SafeStr_3820 = _arg_2;
            _SafeStr_6184 = _arg_3;
            _SafeStr_6185 = _arg_4;
            _searchMsg = _arg_5;
        }

        public function sendSearchRequest():void
        {
            var _local_1:Boolean = _navigator.context.configuration.getBoolean("navigator.2014.personalized.navigator");
            if (((_local_1) && (id == 2)))
            {
                _SafeStr_6184 = 22;
            };
            _navigator.mainViewCtrl.startSearch(_SafeStr_3820, _SafeStr_6184, "-1", _searchMsg);
        }

        public function set selected(_arg_1:Boolean):void
        {
            this._selected = _arg_1;
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get defaultSearchType():int
        {
            return (_SafeStr_6184);
        }

        public function get selected():Boolean
        {
            return (_selected);
        }

        public function get tabPageDecorator():ITabPageDecorator
        {
            return (_SafeStr_6185);
        }

        public function get searchMsg():int
        {
            return (_searchMsg);
        }

        public function get button():ITabButtonWindow
        {
            return (_button);
        }

        public function set button(_arg_1:ITabButtonWindow):void
        {
            _button = _arg_1;
        }


    }
}//package com.sulake.habbo.navigator.domain

// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_6184 = "_-e1U" (String#10631, DoABC#4)
// _SafeStr_6185 = "_-41Y" (String#20471, DoABC#4)


