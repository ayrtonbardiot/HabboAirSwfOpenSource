// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.window.utils.GenericEventQueue

package com.sulake.core.window.utils
{
    import com.sulake.core.runtime._SafeStr_13;
    import flash.events.IEventDispatcher;
    import __AS3__.vec.Vector;
    import flash.events.Event;

    public class GenericEventQueue implements IEventQueue, _SafeStr_13 
    {

        protected var _disposed:Boolean = false;
        protected var _SafeStr_6345:IEventDispatcher;
        protected var _eventArray:Vector.<Event>;
        protected var _index:uint = 0;
        protected var _SafeStr_6223:Boolean = true;

        public function GenericEventQueue(_arg_1:IEventDispatcher)
        {
            _eventArray = new Vector.<Event>();
            _SafeStr_6345 = _arg_1;
        }

        public function get length():uint
        {
            return (_eventArray.length);
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                _SafeStr_6345 = null;
                if (_eventArray.length)
                {
                    _eventArray.splice(0, _eventArray.length);
                };
                _disposed = true;
            };
        }

        public function begin():void
        {
            if (!_SafeStr_6223)
            {
                flush();
            };
            _index = 0;
            _SafeStr_6223 = false;
        }

        public function next():Event
        {
            var _local_1:* = null;
            if (_index < _eventArray.length)
            {
                _local_1 = _eventArray[_index];
                _index++;
            };
            return (_local_1);
        }

        public function remove():void
        {
            _eventArray.splice((_index - 1), 1);
            if (_index > 0)
            {
                _index--;
            };
        }

        public function end():void
        {
            _index = 0;
            _SafeStr_6223 = true;
        }

        public function flush():void
        {
            _eventArray.splice(0, _eventArray.length);
            _index = 0;
        }

        protected function eventListener(_arg_1:Event):void
        {
            _eventArray.push(_arg_1);
        }


    }
}//package com.sulake.core.window.utils

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_6223 = "_-At" (String#13150, DoABC#4)
// _SafeStr_6345 = "_-jw" (String#3249, DoABC#4)


