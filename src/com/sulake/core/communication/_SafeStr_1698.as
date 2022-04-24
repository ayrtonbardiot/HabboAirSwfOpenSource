// by nota

//com.sulake.core.communication._SafeStr_1698

package com.sulake.core.communication
{
    import com.sulake.core.runtime.Component;
    import com.sulake.core.runtime._SafeStr_41;
    import com.sulake.core.runtime._SafeStr_31;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.core.communication.connection._SafeStr_3115;
    import com.sulake.core.communication.connection._SafeStr_26;

    [SecureSWF(rename="true")]
    public class _SafeStr_1698 extends Component implements _SafeStr_46, _SafeStr_41 
    {

        private var _SafeStr_3753:Array;

        public function _SafeStr_1698(_arg_1:_SafeStr_31, _arg_2:uint=0)
        {
            super(_arg_1, _arg_2);
            _SafeStr_3753 = [];
            registerUpdateReceiver(this, 0);
        }

        override public function dispose():void
        {
            removeUpdateReceiver(this);
            for each (var _local_1:IConnection in _SafeStr_3753)
            {
                _local_1.dispose();
            };
            _SafeStr_3753 = null;
            super.dispose();
        }

        public function createConnection(_arg_1:_SafeStr_26=null):IConnection
        {
            var _local_2:IConnection = new _SafeStr_3115(this, _arg_1);
            _SafeStr_3753.push(_local_2);
            return (_local_2);
        }

        public function update(_arg_1:uint):void
        {
            var _local_2:int;
            var _local_3:* = null;
            _local_2 = 0;
            while (_local_2 < _SafeStr_3753.length)
            {
                _local_3 = _SafeStr_3753[_local_2];
                _local_3.processReceivedData();
                if (disposed)
                {
                    return;
                };
                if (_local_3.disposed)
                {
                    _SafeStr_3753.splice(_local_2, 1);
                }
                else
                {
                    _local_2++;
                };
            };
        }


    }
}//package com.sulake.core.communication

// _SafeStr_1698 = "_-r1k" (String#14707, DoABC#4)
// _SafeStr_20 = "_-W1o" (String#542, DoABC#4)
// _SafeStr_26 = "_-91n" (String#25556, DoABC#4)
// _SafeStr_31 = "_-Ee" (String#1238, DoABC#4)
// _SafeStr_3115 = "_-T1Z" (String#13897, DoABC#4)
// _SafeStr_3753 = "_-J1P" (String#7158, DoABC#4)
// _SafeStr_41 = "_-m5" (String#2087, DoABC#4)
// _SafeStr_46 = "_-fk" (String#24270, DoABC#4)


