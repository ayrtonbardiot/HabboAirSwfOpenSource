// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.window.services.WindowMouseOperator

package com.sulake.core.window.services
{
    import com.sulake.core.runtime._SafeStr_13;
    import flash.display.DisplayObject;
    import com.sulake.core.window.WindowController;
    import flash.geom.Point;
    import com.sulake.core.window._SafeStr_3109;
    import flash.events.MouseEvent;
    import flash.events.Event;
    import com.sulake.core.window.events._SafeStr_3116;

    public class WindowMouseOperator implements _SafeStr_13 
    {

        protected var _SafeStr_5428:DisplayObject;
        protected var _window:WindowController;
        protected var _SafeStr_6581:Boolean;
        protected var _offset:Point;
        protected var _mouse:Point;
        protected var _SafeStr_6582:Point;
        protected var _SafeStr_6583:uint;
        private var _disposed:Boolean = false;

        public function WindowMouseOperator(_arg_1:DisplayObject)
        {
            _SafeStr_5428 = _arg_1;
            _SafeStr_6582 = new Point();
            _mouse = new Point();
            _offset = new Point();
            _SafeStr_6581 = false;
            _SafeStr_6583 = 0;
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function dispose():void
        {
            end(_window);
            _offset = null;
            _mouse = null;
            _SafeStr_6582 = null;
            _SafeStr_5428 = null;
            _disposed = true;
        }

        public function begin(_arg_1:_SafeStr_3109, _arg_2:uint=0):_SafeStr_3109
        {
            _SafeStr_6583 = _arg_2;
            var _local_3:_SafeStr_3109 = _window;
            if (_window != null)
            {
                end(_window);
            };
            if (((_arg_1) && (!(_arg_1.disposed))))
            {
                _SafeStr_5428.addEventListener("mouseDown", handler, false);
                _SafeStr_5428.addEventListener("mouseUp", handler, false);
                _SafeStr_5428.addEventListener("enterFrame", handler);
                _mouse.x = _SafeStr_5428.mouseX;
                _mouse.y = _SafeStr_5428.mouseY;
                _window = WindowController(_arg_1);
                getMousePositionRelativeTo(_arg_1, _mouse, _offset);
                _window.addEventListener("WE_DESTROYED", clientWindowDestroyed);
                _SafeStr_6581 = true;
            };
            return (_local_3);
        }

        public function end(_arg_1:_SafeStr_3109):_SafeStr_3109
        {
            var _local_2:_SafeStr_3109 = _window;
            if (_SafeStr_6581)
            {
                if (_window == _arg_1)
                {
                    _SafeStr_5428.removeEventListener("mouseDown", handler, false);
                    _SafeStr_5428.removeEventListener("mouseUp", handler, false);
                    _SafeStr_5428.removeEventListener("enterFrame", handler);
                    if (!_window.disposed)
                    {
                        _window.removeEventListener("WE_DESTROYED", clientWindowDestroyed);
                    };
                    _window = null;
                    _SafeStr_6581 = false;
                };
            };
            return (_local_2);
        }

        protected function handler(_arg_1:Event):void
        {
            var _local_2:* = null;
            if (_SafeStr_6581)
            {
                if (_arg_1.type == "enterFrame")
                {
                    if (_window.disposed)
                    {
                        end(_window);
                    }
                    else
                    {
                        if (((!(_mouse.x == _SafeStr_5428.mouseX)) || (!(_mouse.y == _SafeStr_5428.mouseY))))
                        {
                            operate(_SafeStr_5428.mouseX, _SafeStr_5428.mouseY);
                            _mouse.x = _SafeStr_5428.mouseX;
                            _mouse.y = _SafeStr_5428.mouseY;
                        };
                    };
                    return;
                };
                _local_2 = (_arg_1 as MouseEvent);
                if (_local_2 != null)
                {
                    switch (_local_2.type)
                    {
                        case "mouseUp":
                            end(_window);
                            return;
                    };
                };
            };
        }

        public function operate(_arg_1:int, _arg_2:int):void
        {
            _mouse.x = _arg_1;
            _mouse.y = _arg_2;
            getMousePositionRelativeTo(_window, _mouse, _SafeStr_6582);
            _window.offset((_SafeStr_6582.x - _offset.x), (_SafeStr_6582.y - _offset.y));
        }

        private function clientWindowDestroyed(_arg_1:_SafeStr_3116):void
        {
            end(_window);
        }

        protected function getMousePositionRelativeTo(_arg_1:_SafeStr_3109, _arg_2:Point, _arg_3:Point):void
        {
            _arg_1.getGlobalPosition(_arg_3);
            _arg_3.x = (_arg_2.x - _arg_3.x);
            _arg_3.y = (_arg_2.y - _arg_3.y);
        }


    }
}//package com.sulake.core.window.services

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_5428 = "_-L19" (String#253, DoABC#4)
// _SafeStr_6581 = "_-Lx" (String#4675, DoABC#4)
// _SafeStr_6582 = "_-GQ" (String#2857, DoABC#4)
// _SafeStr_6583 = "_-61n" (String#7312, DoABC#4)


