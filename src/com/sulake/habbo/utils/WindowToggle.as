// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.utils.WindowToggle

package com.sulake.habbo.utils
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components._SafeStr_3216;
    import flash.geom.Rectangle;

    public class WindowToggle implements _SafeStr_13 
    {

        public static const RESULT_SHOW:int = 0;
        public static const RESULT_ACTIVATE:int = 1;
        public static const RESULT_HIDE:int = 2;

        private var _window:_SafeStr_3109;
        private var _SafeStr_4393:_SafeStr_3216;
        private var _disposed:Boolean;
        private var _showFunction:Function;
        private var _hideFunction:Function;

        public function WindowToggle(_arg_1:_SafeStr_3109, _arg_2:_SafeStr_3216, _arg_3:Function=null, _arg_4:Function=null)
        {
            _window = _arg_1;
            _SafeStr_4393 = _arg_2;
            _showFunction = _arg_3;
            _hideFunction = _arg_4;
        }

        public static function isHiddenByOtherWindows(_arg_1:_SafeStr_3109):Boolean
        {
            var _local_8:* = null;
            var _local_7:int;
            var _local_3:_SafeStr_3216 = _arg_1.desktop;
            var _local_5:int = _local_3.numChildren;
            var _local_6:int = _local_3.getChildIndex(_arg_1);
            if (_local_6 < 0)
            {
                throw (new Error("Window must be contained by the desktop!"));
            };
            var _local_2:Rectangle = new Rectangle();
            _arg_1.getGlobalRectangle(_local_2);
            var _local_4:Rectangle = new Rectangle();
            _local_7 = (_local_6 + 1);
            while (_local_7 < _local_5)
            {
                _local_8 = _local_3.getChildAt(_local_7);
                if (_local_8.visible)
                {
                    _local_8.getGlobalRectangle(_local_4);
                    if (_local_2.intersects(_local_4))
                    {
                        return (true);
                    };
                };
                _local_7++;
            };
            return (false);
        }


        public function get window():_SafeStr_3109
        {
            return (_window);
        }

        public function get visible():Boolean
        {
            return (((_window) && (_window.visible)) && (_window.parent));
        }

        public function get active():Boolean
        {
            return ((visible) && (_window.getStateFlag(1)));
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                if (_window)
                {
                    _window.dispose();
                    _window = null;
                };
                _SafeStr_4393 = null;
                _disposed = true;
                _showFunction = null;
                _hideFunction = null;
            };
        }

        public function show():void
        {
            if (!_window.disposed)
            {
                if (_window.parent != _SafeStr_4393)
                {
                    _SafeStr_4393.addChild(_window);
                };
                if (!_window.visible)
                {
                    _window.visible = true;
                };
                _window.activate();
            };
        }

        public function hide():void
        {
            if (!_window.disposed)
            {
                if (_window.parent == _SafeStr_4393)
                {
                    _SafeStr_4393.removeChild(_window);
                };
                if (_window.visible)
                {
                    _window.visible = false;
                };
                _window.deactivate();
            };
        }

        public function toggle():void
        {
            if (visible)
            {
                if (active)
                {
                    ((_hideFunction == null) ? hide() : _hideFunction.call());
                }
                else
                {
                    if (isHiddenByOtherWindows(_window))
                    {
                        _window.activate();
                    }
                    else
                    {
                        ((_hideFunction == null) ? hide() : _hideFunction.call());
                    };
                };
            }
            else
            {
                ((_showFunction == null) ? show() : _showFunction.call());
            };
        }


    }
}//package com.sulake.habbo.utils

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3216 = "_-o1L" (String#2319, DoABC#4)
// _SafeStr_4393 = "_-U1" (String#3797, DoABC#4)


