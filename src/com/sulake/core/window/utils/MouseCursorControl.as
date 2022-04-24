// by nota

//com.sulake.core.window.utils.MouseCursorControl

package com.sulake.core.window.utils
{
    import flash.display.Stage;
    import flash.display.DisplayObject;
    import flash.utils.Dictionary;
    import flash.ui.Mouse;
    import flash.events.MouseEvent;
    import flash.events.Event;

    public class MouseCursorControl 
    {

        private static var _SafeStr_4028:uint = 0;
        private static var _SafeStr_4845:Stage;
        private static var _SafeStr_4426:Boolean = true;
        private static var _disposed:Boolean = false;
        private static var _SafeStr_4846:Boolean = true;
        private static var _SafeStr_4844:DisplayObject;
        private static var _SafeStr_4847:Dictionary = new Dictionary();

        public function MouseCursorControl(_arg_1:DisplayObject)
        {
            _SafeStr_4845 = _arg_1.stage;
        }

        public static function dispose():void
        {
            if (!_disposed)
            {
                if (_SafeStr_4844)
                {
                    _SafeStr_4845.removeChild(_SafeStr_4844);
                    _SafeStr_4845.removeEventListener("mouseLeave", onStageMouseLeave);
                    _SafeStr_4845.removeEventListener("mouseMove", onStageMouseMove);
                    _SafeStr_4845.removeEventListener("mouseOver", onStageMouseMove);
                    _SafeStr_4845.removeEventListener("mouseOut", onStageMouseMove);
                };
                _disposed = true;
            };
        }

        public static function get disposed():Boolean
        {
            return (_disposed);
        }

        public static function get type():uint
        {
            return (_SafeStr_4028);
        }

        public static function set type(_arg_1:uint):void
        {
            if (_SafeStr_4028 != _arg_1)
            {
                _SafeStr_4028 = _arg_1;
                _SafeStr_4846 = true;
            };
        }

        public static function get visible():Boolean
        {
            return (_SafeStr_4426);
        }

        public static function set visible(_arg_1:Boolean):void
        {
            _SafeStr_4426 = _arg_1;
            if (_SafeStr_4426)
            {
                if (_SafeStr_4844)
                {
                    _SafeStr_4844.visible = true;
                }
                else
                {
                    Mouse.show();
                };
            }
            else
            {
                if (_SafeStr_4844)
                {
                    _SafeStr_4844.visible = false;
                }
                else
                {
                    Mouse.hide();
                };
            };
        }

        public static function change():void
        {
            var _local_1:* = null;
            if (_SafeStr_4846)
            {
                _local_1 = _SafeStr_4847[_SafeStr_4028];
                if (_local_1)
                {
                    if (_SafeStr_4844)
                    {
                        _SafeStr_4845.removeChild(_SafeStr_4844);
                    }
                    else
                    {
                        _SafeStr_4845.addEventListener("mouseLeave", onStageMouseLeave);
                        _SafeStr_4845.addEventListener("mouseMove", onStageMouseMove);
                        _SafeStr_4845.addEventListener("mouseOver", onStageMouseMove);
                        _SafeStr_4845.addEventListener("mouseOut", onStageMouseMove);
                        Mouse.hide();
                    };
                    _SafeStr_4844 = _local_1;
                    _SafeStr_4845.addChild(_SafeStr_4844);
                }
                else
                {
                    if (_SafeStr_4844)
                    {
                        _SafeStr_4845.removeChild(_SafeStr_4844);
                        _SafeStr_4845.removeEventListener("mouseLeave", onStageMouseLeave);
                        _SafeStr_4845.removeEventListener("mouseMove", onStageMouseMove);
                        _SafeStr_4845.removeEventListener("mouseOver", onStageMouseMove);
                        _SafeStr_4845.removeEventListener("mouseOut", onStageMouseMove);
                        _SafeStr_4844 = null;
                        Mouse.show();
                    };
                    switch (_SafeStr_4028)
                    {
                        case 0:
                        case 1:
                            Mouse.cursor = "auto";
                            break;
                        case 2:
                            Mouse.cursor = "button";
                            break;
                        case 5:
                        case 6:
                        case 7:
                        case 8:
                            Mouse.cursor = "hand";
                            break;
                        case 0xFFFFFFFE:
                            Mouse.cursor = "auto";
                            Mouse.hide();
                    };
                };
                _SafeStr_4846 = false;
            };
        }

        public static function defineCustomCursorType(_arg_1:uint, _arg_2:DisplayObject):void
        {
            _SafeStr_4847[_arg_1] = _arg_2;
        }

        private static function onStageMouseMove(_arg_1:MouseEvent):void
        {
            if (_SafeStr_4844)
            {
                _SafeStr_4844.x = (_arg_1.stageX - 2);
                _SafeStr_4844.y = _arg_1.stageY;
                if (_SafeStr_4028 == 0)
                {
                    _SafeStr_4426 = false;
                    Mouse.show();
                }
                else
                {
                    _SafeStr_4426 = true;
                    Mouse.hide();
                };
            };
        }

        private static function onStageMouseLeave(_arg_1:Event):void
        {
            if (((_SafeStr_4844) && (!(_SafeStr_4028 == 0))))
            {
                Mouse.hide();
                _SafeStr_4426 = false;
            };
        }


    }
}//package com.sulake.core.window.utils

// _SafeStr_4028 = "_-81R" (String#336, DoABC#4)
// _SafeStr_4426 = "_-c1l" (String#1501, DoABC#4)
// _SafeStr_4844 = "_-OU" (String#3813, DoABC#4)
// _SafeStr_4845 = "_-w1I" (String#1591, DoABC#4)
// _SafeStr_4846 = "_-s1f" (String#11872, DoABC#4)
// _SafeStr_4847 = "_-xy" (String#15434, DoABC#4)


