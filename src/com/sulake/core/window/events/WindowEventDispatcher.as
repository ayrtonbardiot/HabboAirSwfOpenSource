// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.window.events.WindowEventDispatcher

package com.sulake.core.window.events
{
    import com.sulake.core.runtime._SafeStr_13;
    import flash.utils.Dictionary;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.runtime.events.EventListenerStruct;

    public class WindowEventDispatcher implements _SafeStr_13 
    {

        private static const _SafeStr_8040:uint = 0;
        private static const _SafeStr_8041:uint = 1;
        private static const _SafeStr_8042:uint = 2;

        protected var _disposed:Boolean = false;
        private var _SafeStr_6477:Dictionary = new Dictionary();
        private var _SafeStr_4258:uint;
        private var _SafeStr_6476:Error;

        public function WindowEventDispatcher(_arg_1:_SafeStr_3109)
        {
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get error():Error
        {
            return (_SafeStr_6476);
        }

        public function addEventListener(_arg_1:String, _arg_2:Function, _arg_3:int=0):void
        {
            var _local_6:Array = _SafeStr_6477[_arg_1];
            var _local_4:EventListenerStruct = new EventListenerStruct(_arg_2, false, _arg_3);
            if (!_local_6)
            {
                _local_6 = [_local_4];
                _SafeStr_6477[_arg_1] = _local_6;
            }
            else
            {
                for each (var _local_5:EventListenerStruct in _local_6)
                {
                    if (_local_5.callback == _arg_2)
                    {
                        return;
                    };
                    if (_arg_3 > _local_5.priority)
                    {
                        _local_6.splice(_local_6.indexOf(_local_5), 0, _local_4);
                        return;
                    };
                };
                _local_6.push(_local_4);
            };
        }

        public function removeEventListener(_arg_1:String, _arg_2:Function):void
        {
            var _local_4:* = null;
            var _local_5:uint;
            if (!_disposed)
            {
                _local_4 = _SafeStr_6477[_arg_1];
                if (_local_4)
                {
                    _local_5 = 0;
                    for each (var _local_3:EventListenerStruct in _local_4)
                    {
                        if (_local_3.callback == _arg_2)
                        {
                            _local_4.splice(_local_5, 1);
                            _local_3.callback = null;
                            if (_local_4.length == 0)
                            {
                                delete _SafeStr_6477[_arg_1];
                            };
                            return;
                        };
                        _local_5++;
                    };
                };
            };
        }

        public function dispatchEvent(_arg_1:_SafeStr_3116):Boolean
        {
            var _local_3:* = null;
            var _local_4:* = null;
            var _local_5:* = null;
            if (!_disposed)
            {
                _SafeStr_4258 = 0;
                _local_3 = _SafeStr_6477[_arg_1.type];
                if (_local_3)
                {
                    _local_5 = [];
                    for each (var _local_2:EventListenerStruct in _local_3)
                    {
                        _local_5.push(_local_2.callback);
                    };
                    while (_local_5.length > 0)
                    {
                        _local_4 = _local_5.shift();
                        (_local_4(_arg_1));
                    };
                };
                _SafeStr_4258 = ((_arg_1.isDefaultPrevented()) ? 1 : 0);
                return (_SafeStr_4258 == 0);
            };
            return (false);
        }

        public function hasEventListener(_arg_1:String):Boolean
        {
            return ((_disposed) ? false : (!(_SafeStr_6477[_arg_1] == null)));
        }

        public function dispose():void
        {
            var _local_2:* = null;
            if (!_disposed)
            {
                for (var _local_3:Object in _SafeStr_6477)
                {
                    _local_2 = (_SafeStr_6477[_local_3] as Array);
                    for each (var _local_1:EventListenerStruct in _local_2)
                    {
                        _local_1.callback = null;
                    };
                    delete _SafeStr_6477[_local_3];
                };
                _SafeStr_6477 = null;
                _disposed = true;
            };
        }


    }
}//package com.sulake.core.window.events

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_4258 = "_-fc" (String#2827, DoABC#4)
// _SafeStr_6476 = "_-Cr" (String#29971, DoABC#4)
// _SafeStr_6477 = "_-h1O" (String#5238, DoABC#4)
// _SafeStr_8040 = "_-a13" (String#37170, DoABC#4)
// _SafeStr_8041 = "_-s6" (String#31646, DoABC#4)
// _SafeStr_8042 = "_-N1x" (String#40756, DoABC#4)


