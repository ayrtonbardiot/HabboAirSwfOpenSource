// by nota

//com.sulake.core.utils.debug.GarbageMonitor

package com.sulake.core.utils.debug
{
    import com.sulake.core.runtime._SafeStr_13;
    import flash.utils.Dictionary;

    public class GarbageMonitor implements _SafeStr_13 
    {

        private var _disposed:Boolean = false;
        private var _SafeStr_5577:Dictionary;

        public function GarbageMonitor()
        {
            _SafeStr_5577 = new Dictionary(true);
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                for each (var _local_1:* in _SafeStr_5577)
                {
                    delete _SafeStr_5577[_local_1];
                };
                _SafeStr_5577 = null;
                _disposed = true;
            };
        }

        public function insert(_arg_1:Object, _arg_2:String=null):void
        {
            _SafeStr_5577[_arg_1] = ((_arg_2 == null) ? _arg_1.toString() : _arg_2);
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get list():Array
        {
            var _local_1:Array = [];
            for each (var _local_2:* in _SafeStr_5577)
            {
                _local_1.push(_local_2);
            };
            return (_local_1);
        }


    }
}//package com.sulake.core.utils.debug

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_5577 = "_-p13" (String#8535, DoABC#4)


