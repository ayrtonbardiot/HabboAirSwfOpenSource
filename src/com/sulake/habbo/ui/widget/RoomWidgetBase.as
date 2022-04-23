// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.RoomWidgetBase

package com.sulake.habbo.ui.widget
{
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import flash.events.IEventDispatcher;
    import com.sulake.core.window._SafeStr_3109;

    public class RoomWidgetBase implements IRoomWidget 
    {

        private var _disposed:Boolean = false;
        private var _SafeStr_3983:EventDispatcherWrapper;
        private var _SafeStr_3733:IRoomWidgetMessageListener;
        private var _windowManager:_SafeStr_1695;
        protected var _assets:_SafeStr_21;
        protected var _SafeStr_4020:_SafeStr_18;
        protected var _SafeStr_3914:IRoomWidgetHandler;

        public function RoomWidgetBase(_arg_1:IRoomWidgetHandler, _arg_2:_SafeStr_1695, _arg_3:_SafeStr_21=null, _arg_4:_SafeStr_18=null)
        {
            _SafeStr_3914 = _arg_1;
            _windowManager = _arg_2;
            _assets = _arg_3;
            _SafeStr_4020 = _arg_4;
        }

        public function get state():int
        {
            return (0);
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function initialize(_arg_1:int=0):void
        {
        }

        public function dispose():void
        {
            if (disposed)
            {
                return;
            };
            _SafeStr_3733 = null;
            _windowManager = null;
            if (((!(_SafeStr_3983 == null)) && (!(_SafeStr_3983.disposed))))
            {
                unregisterUpdateEvents(_SafeStr_3983);
            };
            if (_SafeStr_3914)
            {
                _SafeStr_3914.dispose();
                _SafeStr_3914 = null;
            };
            _SafeStr_3983 = null;
            _assets = null;
            _SafeStr_4020 = null;
            _disposed = true;
        }

        public function set messageListener(_arg_1:IRoomWidgetMessageListener):void
        {
            _SafeStr_3733 = _arg_1;
        }

        public function get messageListener():IRoomWidgetMessageListener
        {
            return (_SafeStr_3733);
        }

        public function get windowManager():_SafeStr_1695
        {
            return (_windowManager);
        }

        public function get assets():_SafeStr_21
        {
            return (_assets);
        }

        public function get localizations():_SafeStr_18
        {
            return (_SafeStr_4020);
        }

        public function registerUpdateEvents(_arg_1:IEventDispatcher):void
        {
            if ((_arg_1 is EventDispatcherWrapper))
            {
                _SafeStr_3983 = (_arg_1 as EventDispatcherWrapper);
            };
        }

        public function unregisterUpdateEvents(_arg_1:IEventDispatcher):void
        {
        }

        public function get mainWindow():_SafeStr_3109
        {
            return (null);
        }


    }
}//package com.sulake.habbo.ui.widget

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3733 = "_-a1J" (String#2230, DoABC#4)
// _SafeStr_3914 = "_-w1m" (String#1204, DoABC#4)
// _SafeStr_3983 = "_-OX" (String#641, DoABC#4)
// _SafeStr_4020 = "_-el" (String#1659, DoABC#4)


