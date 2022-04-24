// by nota

//com.sulake.core.window.services.WindowMouseListener

package com.sulake.core.window.services
{
    import flash.display.DisplayObject;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events.WindowMouseEvent;
    import flash.geom.Point;
    import flash.events.Event;

    public class WindowMouseListener extends WindowMouseOperator implements IMouseListenerService 
    {

        private var _SafeStr_6672:Array = [];
        private var _SafeStr_6673:uint = 0;

        public function WindowMouseListener(_arg_1:DisplayObject)
        {
            super(_arg_1);
        }

        public function get eventTypes():Array
        {
            return (_SafeStr_6672);
        }

        public function get areaLimit():uint
        {
            return (_SafeStr_6673);
        }

        public function set areaLimit(_arg_1:uint):void
        {
            _SafeStr_6673 = _arg_1;
        }

        override public function end(_arg_1:_SafeStr_3109):_SafeStr_3109
        {
            var _local_2:int;
            _local_2 = _SafeStr_6672.length;
            while (_local_2 > 0)
            {
                _SafeStr_6672.pop();
                _local_2--;
            };
            return (super.end(_arg_1));
        }

        override protected function handler(_arg_1:Event):void
        {
            var _local_2:Boolean;
            if (((_SafeStr_6581) && (!(_window.disposed))))
            {
                if (_SafeStr_6672.indexOf(_arg_1.type) >= 0)
                {
                    if ((_arg_1 is WindowMouseEvent))
                    {
                        _local_2 = _window.hitTestGlobalPoint(new Point(WindowMouseEvent(_arg_1).stageX, WindowMouseEvent(_arg_1).stageY));
                        if (((_SafeStr_6673 == 1) && (!(_local_2))))
                        {
                            return;
                        };
                        if (((_SafeStr_6673 == 3) && (_local_2)))
                        {
                            return;
                        };
                    };
                    _window.update(null, WindowMouseEvent(_arg_1));
                };
            };
        }

        override public function operate(_arg_1:int, _arg_2:int):void
        {
        }


    }
}//package com.sulake.core.window.services

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_6581 = "_-Lx" (String#4675, DoABC#4)
// _SafeStr_6672 = "_-T1N" (String#11139, DoABC#4)
// _SafeStr_6673 = "_-oQ" (String#8893, DoABC#4)


