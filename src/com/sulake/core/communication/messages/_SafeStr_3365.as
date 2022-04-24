// by nota

//com.sulake.core.communication.messages._SafeStr_3365

package com.sulake.core.communication.messages
{
    import flash.utils.Dictionary;
    import com.sulake.core.utils.ClassUtils;
    import flash.utils.getQualifiedClassName;

    [SecureSWF(rename="true")]
    public class _SafeStr_3365 
    {

        private var _SafeStr_6301:Dictionary = new Dictionary();
        private var _SafeStr_6302:Dictionary = new Dictionary();
        private var _SafeStr_6300:Dictionary = new Dictionary();


        public function dispose():void
        {
            var _local_1:* = null;
            if (_SafeStr_6300)
            {
                for each (var _local_2:Object in _SafeStr_6300)
                {
                    _local_1 = _SafeStr_6300[_local_2];
                    if (_local_1)
                    {
                        _local_1.dispose();
                    };
                };
            };
        }

        public function registerMessages(_arg_1:IMessageConfiguration):void
        {
            var _local_2:* = null;
            for (_local_2 in _arg_1.events)
            {
                registerMessageEventClass(parseInt(_local_2), _arg_1.events[_local_2]);
            };
            for (_local_2 in _arg_1.composers)
            {
                registerMessageComposerClass(parseInt(_local_2), _arg_1.composers[_local_2]);
            };
        }

        private function registerMessageComposerClass(_arg_1:int, _arg_2:Class):void
        {
            if (!ClassUtils.implementsInterface(_arg_2, IMessageComposer))
            {
                throw (new Error(("Invalid composer class for message ID " + _arg_1)));
            };
            var _local_3:String = getQualifiedClassName(_arg_2);
            if (_SafeStr_6301[_local_3] != null)
            {
                throw (new Error(("Duplicate message ID definition for composer class " + _local_3)));
            };
            _SafeStr_6301[_local_3] = _arg_1;
        }

        private function registerMessageEventClass(_arg_1:int, _arg_2:Class):void
        {
            if (!ClassUtils.implementsInterface(_arg_2, IMessageEvent))
            {
                throw (new Error(("Invalid event class for message ID " + _arg_1)));
            };
            var _local_3:String = getQualifiedClassName(_arg_2);
            if (_SafeStr_6302[_local_3] != null)
            {
                throw (new Error(("Duplicate message ID definition for event class " + _local_3)));
            };
            _SafeStr_6302[_local_3] = _arg_1;
        }

        public function registerMessageEvent(_arg_1:IMessageEvent):void
        {
            var _local_4:String = getQualifiedClassName(_arg_1);
            var _local_2:Object = _SafeStr_6302[_local_4];
            if (_local_2 == null)
            {
                throw (new Error(("Unknown message event class " + _local_4)));
            };
            var _local_3:Array = _SafeStr_6300[_local_2];
            if (_local_3 != null)
            {
                _arg_1.parser = (_local_3[0] as IMessageEvent).parser;
            }
            else
            {
                _local_3 = [];
                _SafeStr_6300[_local_2] = _local_3;
                _arg_1.parser = new _arg_1.parserClass();
            };
            _local_3.push(_arg_1);
        }

        public function unregisterMessageEvent(_arg_1:IMessageEvent):void
        {
            var _local_5:String = getQualifiedClassName(_arg_1);
            var _local_2:Object = _SafeStr_6302[_local_5];
            if (_local_2 == null)
            {
                return;
            };
            var _local_4:Array = _SafeStr_6300[_local_2];
            if (_local_4 == null)
            {
                return;
            };
            var _local_3:int = _local_4.indexOf(_arg_1);
            if (_local_3 >= 0)
            {
                _local_4.splice(_local_3, 1);
                if (_local_4.length == 0)
                {
                    delete _SafeStr_6300[_local_2];
                };
            };
        }

        public function getMessageIDForComposer(_arg_1:IMessageComposer):int
        {
            var _local_2:Object = _SafeStr_6301[getQualifiedClassName(_arg_1)];
            if (_local_2 == null)
            {
                return (-1);
            };
            return (_local_2);
        }

        public function getMessageEventsForID(_arg_1:int):Array
        {
            return (_SafeStr_6300[_arg_1]);
        }


    }
}//package com.sulake.core.communication.messages

// _SafeStr_3365 = "_-w1P" (String#12728, DoABC#4)
// _SafeStr_6300 = "_-IO" (String#6771, DoABC#4)
// _SafeStr_6301 = "_-Q1u" (String#12142, DoABC#4)
// _SafeStr_6302 = "_-A1Q" (String#10596, DoABC#4)


