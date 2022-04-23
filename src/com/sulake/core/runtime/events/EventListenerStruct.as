// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.runtime.events.EventListenerStruct

package com.sulake.core.runtime.events
{
    import flash.utils.Dictionary;

    public class EventListenerStruct 
    {

        private var _SafeStr_7970:Dictionary;
        public var useCapture:Boolean;
        public var priority:int;
        public var useWeakReference:Boolean;

        public function EventListenerStruct(_arg_1:Function, _arg_2:Boolean=false, _arg_3:int=0, _arg_4:Boolean=false)
        {
            _SafeStr_7970 = new Dictionary(_arg_4);
            this.callback = _arg_1;
            this.useCapture = _arg_2;
            this.priority = _arg_3;
            this.useWeakReference = _arg_4;
        }

        public function set callback(_arg_1:Function):void
        {
            for (var _local_2:Object in _SafeStr_7970)
            {
                delete _SafeStr_7970[_local_2];
            };
            _SafeStr_7970[_arg_1] = null;
        }

        public function get callback():Function
        {
            for (var _local_1:Object in _SafeStr_7970)
            {
                return (_local_1 as Function);
            };
            return (null);
        }


    }
}//package com.sulake.core.runtime.events

// _SafeStr_7970 = "_-do" (String#9247, DoABC#3)


