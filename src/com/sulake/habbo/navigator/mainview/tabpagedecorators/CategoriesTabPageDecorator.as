﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.navigator.mainview.tabpagedecorators.CategoriesTabPageDecorator

package com.sulake.habbo.navigator.mainview.tabpagedecorators
{
    import com.sulake.habbo.navigator.HabboNavigator;
    import com.sulake.core.window._SafeStr_3133;

    public class CategoriesTabPageDecorator implements ITabPageDecorator 
    {

        private var _navigator:HabboNavigator;

        public function CategoriesTabPageDecorator(_arg_1:HabboNavigator)
        {
            _navigator = _arg_1;
        }

        public function refreshCustomContent(_arg_1:_SafeStr_3133):void
        {
        }

        public function tabSelected():void
        {
        }

        public function navigatorOpenedWhileInTab():void
        {
            _navigator.mainViewCtrl.startSearch(6, 21);
        }

        public function refreshFooter(_arg_1:_SafeStr_3133):void
        {
        }

        public function setSubSelection(_arg_1:int):void
        {
        }

        public function get filterCategory():String
        {
            return (null);
        }

        public function processSearchParam(_arg_1:String):String
        {
            return ("");
        }


    }
}//package com.sulake.habbo.navigator.mainview.tabpagedecorators

// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)


