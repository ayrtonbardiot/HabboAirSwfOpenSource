// by nota

//com.sulake.habbo.navigator.mainview.tabpagedecorators.ITabPageDecorator

package com.sulake.habbo.navigator.mainview.tabpagedecorators
{
    import com.sulake.core.window._SafeStr_3133;

    public /*dynamic*/ interface ITabPageDecorator 
    {

        function refreshCustomContent(_arg_1:_SafeStr_3133):void;
        function tabSelected():void;
        function navigatorOpenedWhileInTab():void;
        function refreshFooter(_arg_1:_SafeStr_3133):void;
        function get filterCategory():String;
        function setSubSelection(_arg_1:int):void;
        function processSearchParam(_arg_1:String):String;

    }
}//package com.sulake.habbo.navigator.mainview.tabpagedecorators

// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)


