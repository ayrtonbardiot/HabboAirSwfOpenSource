// by nota

//com.sulake.core.window.services.WindowMouseDragger

package com.sulake.core.window.services
{
    import flash.display.DisplayObject;

    public class WindowMouseDragger extends WindowMouseOperator implements IMouseDraggingService 
    {

        public function WindowMouseDragger(_arg_1:DisplayObject)
        {
            super(_arg_1);
        }

        override public function operate(_arg_1:int, _arg_2:int):void
        {
            _mouse.x = _arg_1;
            _mouse.y = _arg_2;
            getMousePositionRelativeTo(_window, _mouse, _SafeStr_6582);
            _window.offset((_SafeStr_6582.x - _offset.x), (_SafeStr_6582.y - _offset.y));
        }


    }
}//package com.sulake.core.window.services

// _SafeStr_6582 = "_-GQ" (String#2857, DoABC#4)


