// by nota

//com.sulake.habbo.ui.widget.roomtools.RoomToolsCtrlBase

package com.sulake.habbo.ui.widget.roomtools
{
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets._SafeStr_21;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import com.sulake.habbo.ui.handler.RoomToolsWidgetHandler;

    public class RoomToolsCtrlBase 
    {

        protected static const DISTANCE_FROM_BOTTOM:int = 55;
        protected static const TOOLBAR_X:int = -5;
        protected static const _SafeStr_9081:int = 100;

        protected var _window:_SafeStr_3133;
        protected var _SafeStr_4981:RoomToolsWidget;
        protected var _windowManager:_SafeStr_1695;
        protected var _assets:_SafeStr_21;
        protected var _SafeStr_6103:Boolean = true;
        protected var _SafeStr_6100:Timer;
        protected var _SafeStr_6102:Boolean;
        protected var _SafeStr_6101:int;

        public function RoomToolsCtrlBase(_arg_1:RoomToolsWidget, _arg_2:_SafeStr_1695, _arg_3:_SafeStr_21)
        {
            _SafeStr_4981 = _arg_1;
            _windowManager = _arg_2;
            _assets = _arg_3;
            _SafeStr_6101 = handler.container.config.getInteger("room.enter.info.collapse.delay", 5000);
        }

        public function dispose():void
        {
            if (_window)
            {
                _window.procedure = null;
                _window.dispose();
                _window = null;
            };
            if (_SafeStr_6100)
            {
                _SafeStr_6100.reset();
                _SafeStr_6100 = null;
                _SafeStr_6102 = false;
            };
            _SafeStr_4981 = null;
        }

        public function setElementVisible(_arg_1:String, _arg_2:Boolean):void
        {
            if (((!(_window)) || (!(_window.findChildByName(_arg_1)))))
            {
                return;
            };
            _window.findChildByName(_arg_1).visible = _arg_2;
        }

        protected function collapseAfterDelay():void
        {
            clearCollapseTimer();
            _SafeStr_6100 = new Timer(_SafeStr_6101, 1);
            _SafeStr_6100.addEventListener("timer", collapseTimerEventHandler);
            _SafeStr_6100.start();
        }

        protected function collapseIfPending():void
        {
            if (_SafeStr_6102)
            {
                collapseAfterDelay();
            };
        }

        protected function clearCollapseTimer():void
        {
            if (_SafeStr_6100 != null)
            {
                _SafeStr_6100.reset();
                _SafeStr_6100 = null;
            };
            _SafeStr_6102 = false;
        }

        private function collapseTimerEventHandler(_arg_1:TimerEvent):void
        {
            clearCollapseTimer();
            setCollapsed(true);
        }

        protected function cancelWindowCollapse():void
        {
            if (_SafeStr_6100 != null)
            {
                clearCollapseTimer();
                _SafeStr_6102 = true;
            };
        }

        public function setCollapsed(_arg_1:Boolean):void
        {
        }

        public function get isCollapsed():Boolean
        {
            return (_SafeStr_6103);
        }

        public function get window():_SafeStr_3133
        {
            return (_window);
        }

        public function get handler():RoomToolsWidgetHandler
        {
            return ((_SafeStr_4981) ? _SafeStr_4981.handler : null);
        }


    }
}//package com.sulake.habbo.ui.widget.roomtools

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_6100 = "_-n1l" (String#5366, DoABC#4)
// _SafeStr_6101 = "_-Pu" (String#18751, DoABC#4)
// _SafeStr_6102 = "_-Z1O" (String#9695, DoABC#4)
// _SafeStr_6103 = "_-A1f" (String#3645, DoABC#4)
// _SafeStr_9081 = "_-C1B" (String#34407, DoABC#4)


