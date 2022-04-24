// by nota

//com.sulake.habbo.ui.widget.furniture.placeholder.PlaceholderWidget

package com.sulake.habbo.ui.widget.furniture.placeholder
{
    import com.sulake.habbo.ui.widget.RoomWidgetBase;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.habbo.localization._SafeStr_18;
    import flash.events.IEventDispatcher;
    import com.sulake.habbo.ui.widget.events.RoomWidgetShowPlaceholderEvent;

    public class PlaceholderWidget extends RoomWidgetBase 
    {

        private var _SafeStr_3882:PlaceholderView;

        public function PlaceholderWidget(_arg_1:IRoomWidgetHandler, _arg_2:_SafeStr_1695, _arg_3:_SafeStr_21=null, _arg_4:_SafeStr_18=null)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4);
        }

        override public function dispose():void
        {
            if (_SafeStr_3882 != null)
            {
                _SafeStr_3882.dispose();
                _SafeStr_3882 = null;
            };
            super.dispose();
        }

        override public function registerUpdateEvents(_arg_1:IEventDispatcher):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            _arg_1.addEventListener("RWSPE_SHOW_PLACEHOLDER", onShowEvent);
            super.registerUpdateEvents(_arg_1);
        }

        override public function unregisterUpdateEvents(_arg_1:IEventDispatcher):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            _arg_1.removeEventListener("RWSPE_SHOW_PLACEHOLDER", onShowEvent);
        }

        private function onShowEvent(_arg_1:RoomWidgetShowPlaceholderEvent):void
        {
            showInterface();
        }

        private function showInterface():void
        {
            if (_SafeStr_3882 == null)
            {
                _SafeStr_3882 = new PlaceholderView(assets, windowManager);
            };
            _SafeStr_3882.showWindow();
        }

        private function hideInterface():void
        {
            if (_SafeStr_3882 != null)
            {
                _SafeStr_3882.dispose();
                _SafeStr_3882 = null;
            };
        }


    }
}//package com.sulake.habbo.ui.widget.furniture.placeholder

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)


