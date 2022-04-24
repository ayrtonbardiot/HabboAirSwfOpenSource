// by nota

//com.sulake.habbo.window.widgets.UpdatingTimeStampWidget

package com.sulake.habbo.window.widgets
{
    import flash.utils.Timer;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.window.HabboWindowManagerComponent;
    import com.sulake.core.window.components.ILabelWindow;
    import flash.geom.Rectangle;
    import com.sulake.core.window.iterators.EmptyIterator;
    import com.sulake.core.window.utils.IIterator;
    import com.sulake.habbo.utils.FriendlyTime;
    import flash.events.TimerEvent;

    public class UpdatingTimeStampWidget implements _SafeStr_3351 
    {

        public static const TYPE:String = "updating_timestamp";
        private static const UPDATE_TIMER:Timer = new Timer(60000);

        private var _disposed:Boolean;
        private var _SafeStr_5427:_SafeStr_3199;
        private var _windowManager:HabboWindowManagerComponent;
        private var _SafeStr_5428:ILabelWindow;
        private var _SafeStr_5415:Number;

        {
            UPDATE_TIMER.start();
        }

        public function UpdatingTimeStampWidget(_arg_1:_SafeStr_3199, _arg_2:HabboWindowManagerComponent)
        {
            _SafeStr_5427 = _arg_1;
            _windowManager = _arg_2;
            _SafeStr_5428 = (_windowManager.create("", 12, 100, 16, new Rectangle()) as ILabelWindow);
            _SafeStr_5428.textColor = 0x555555;
            _SafeStr_5427.rootWindow = _SafeStr_5428;
            UPDATE_TIMER.addEventListener("timer", onTimerTick);
            reset();
        }

        public function reset():void
        {
            _SafeStr_5415 = new Date().getTime();
            onTimerTick();
        }

        public function get properties():Array
        {
            return ([]);
        }

        public function set properties(_arg_1:Array):void
        {
        }

        public function set align(_arg_1:String):void
        {
            _SafeStr_5428.defaultTextFormat.align = _arg_1;
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                UPDATE_TIMER.removeEventListener("timer", onTimerTick);
                if (_SafeStr_5428 != null)
                {
                    _SafeStr_5428.dispose();
                    _SafeStr_5428 = null;
                };
                if (_SafeStr_5427 != null)
                {
                    _SafeStr_5427.rootWindow = null;
                    _SafeStr_5427 = null;
                };
                _windowManager = null;
                _disposed = true;
            };
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get iterator():IIterator
        {
            return (EmptyIterator.INSTANCE);
        }

        public function get timeStamp():Number
        {
            return (_SafeStr_5415);
        }

        public function set timeStamp(_arg_1:Number):void
        {
            _SafeStr_5415 = _arg_1;
            onTimerTick();
        }

        private function onTimerTick(_arg_1:TimerEvent=null):void
        {
            if (((((_disposed) || (!(_SafeStr_5428))) || (!(_windowManager))) || (!(_windowManager.localization))))
            {
                return;
            };
            _SafeStr_5428.caption = FriendlyTime.getFriendlyTime(_windowManager.localization, ((new Date().getTime() - Math.abs(_SafeStr_5415)) / 1000), ".ago", 1);
        }


    }
}//package com.sulake.habbo.window.widgets

// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3351 = "_-bh" (String#10123, DoABC#4)
// _SafeStr_5415 = "_-f15" (String#4009, DoABC#4)
// _SafeStr_5427 = "_-h1n" (String#409, DoABC#4)
// _SafeStr_5428 = "_-L19" (String#253, DoABC#4)


