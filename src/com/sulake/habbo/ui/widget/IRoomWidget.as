// by nota

//com.sulake.habbo.ui.widget.IRoomWidget

package com.sulake.habbo.ui.widget
{
    import flash.events.IEventDispatcher;
    import com.sulake.core.window._SafeStr_3109;

    public /*dynamic*/ interface IRoomWidget 
    {

        function get state():int;
        function initialize(_arg_1:int=0):void;
        function dispose():void;
        function set messageListener(_arg_1:IRoomWidgetMessageListener):void;
        function registerUpdateEvents(_arg_1:IEventDispatcher):void;
        function unregisterUpdateEvents(_arg_1:IEventDispatcher):void;
        function get mainWindow():_SafeStr_3109;

    }
}//package com.sulake.habbo.ui.widget

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)


