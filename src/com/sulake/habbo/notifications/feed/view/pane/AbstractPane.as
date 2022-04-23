// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.notifications.feed.view.pane.AbstractPane

package com.sulake.habbo.notifications.feed.view.pane
{
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.notifications.feed.NotificationView;
    import com.sulake.core.runtime.exceptions.Exception;

    public class AbstractPane implements _SafeStr_3395 
    {

        public static const PANE_VIEW_LEVEL_BASE:int = 0;
        public static const PANE_VIEW_LEVEL_FEED:int = 1;
        public static const PANE_VIEW_LEVEL_MODAL:int = 2;

        protected var _SafeStr_4036:Boolean;
        protected var _SafeStr_5770:Boolean;
        private var _SafeStr_6529:int;
        protected var _window:_SafeStr_3133;
        protected var _SafeStr_3761:NotificationView;
        protected var _name:String;

        public function AbstractPane(_arg_1:String, _arg_2:NotificationView, _arg_3:_SafeStr_3133, _arg_4:int)
        {
            if (_arg_3 == null)
            {
                throw (new Exception(("Window was null for feed pane: " + _arg_1)));
            };
            _name = _arg_1;
            _SafeStr_3761 = _arg_2;
            _SafeStr_6529 = _arg_4;
            _window = _arg_3;
        }

        public function dispose():void
        {
            _SafeStr_4036 = true;
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4036);
        }

        public function get name():String
        {
            return (_name);
        }

        public function get paneLevel():int
        {
            return (_SafeStr_6529);
        }

        public function set isVisible(_arg_1:Boolean):void
        {
            _SafeStr_5770 = _arg_1;
            _window.visible = _SafeStr_5770;
        }

        public function get isVisible():Boolean
        {
            return (_SafeStr_5770);
        }


    }
}//package com.sulake.habbo.notifications.feed.view.pane

// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3395 = "_-22Y" (String#8631, DoABC#4)
// _SafeStr_3761 = "_-11L" (String#982, DoABC#4)
// _SafeStr_4036 = "_-Mr" (String#290, DoABC#4)
// _SafeStr_5770 = "_-D1D" (String#3284, DoABC#4)
// _SafeStr_6529 = "_-iK" (String#18110, DoABC#4)


